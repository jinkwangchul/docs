param(
    [Parameter(Mandatory=$true)]
    [string]$ZipPath,

    [Parameter(Mandatory=$true)]
    [string]$OutputDir
)

$ErrorActionPreference = 'Stop'

Add-Type -AssemblyName System.IO.Compression.FileSystem

function Normalize-Text([string]$text) {
    $text = $text -replace "`r`n", "`n"
    $text = $text -replace "`r", "`n"
    return $text.Trim()
}

function Split-Blocks([string]$text) {
    $normalized = Normalize-Text $text
    if ([string]::IsNullOrWhiteSpace($normalized)) {
        return @()
    }
    return @($normalized -split "`n\s*`n+" | ForEach-Object { $_.Trim() } | Where-Object { $_ })
}

function Get-Category([string]$name) {
    if ($name -match 'Order|order|Hoga|Chejan|Fill|Position|Liquidation|Kiwoom|Adapter|Request_Hash|Lock|Review_Management|Execution_Request|Execution_Guard|provenance|intent|Preview|QUEUED') {
        return '01_Order_Pipeline'
    }
    if ($name -match 'Runtime|Data_Model|Data_Contract|Entity|State_Transition|Event_Catalog|Interface_Catalog|Module_Catalog|Component_Dependency') {
        return '02_Runtime_Data_Model'
    }
    if ($name -match 'Architecture|Controller|Dependency|Principles|RACI|Boundary') {
        return '03_Architecture'
    }
    if ($name -match 'Implementation|Test|Verification|Readiness|Evidence|DoD|Checklist|Gates|Backlog|Milestones|Deliverables|Trace_Register') {
        return '04_Implementation_Test_Verification'
    }
    if ($name -match 'MASTER_SPEC_.*Index|Reference_Priority|Document_Architecture|Integrated_Reference_Map|ADR_Index') {
        return '00_Final_Index_Reference_Map'
    }
    if ($name -match 'Governance|Policy|Operations|Risk|Quality|Change|Release|Backup|Maintenance|Lifecycle|Roadmap|Completion|Maturity|Acceptance|Certification|Assessment') {
        return '05_Operations_Policy_Governance'
    }
    if ($name -match 'Glossary') {
        return '06_Glossary'
    }
    return '90_Misc'
}

function New-SafeFileName([string]$category) {
    switch ($category) {
        '00_Final_Index_Reference_Map' { return '00_Final_Index_Reference_Map_merged.txt' }
        '01_Order_Pipeline' { return '01_Order_Pipeline_merged.txt' }
        '02_Runtime_Data_Model' { return '02_Runtime_Data_Model_merged.txt' }
        '03_Architecture' { return '03_Architecture_merged.txt' }
        '04_Implementation_Test_Verification' { return '04_Implementation_Test_Verification_merged.txt' }
        '05_Operations_Policy_Governance' { return '05_Operations_Policy_Governance_merged.txt' }
        '06_Glossary' { return '06_Glossary_merged.txt' }
        default { return '90_Misc_merged.txt' }
    }
}

function Get-Hash([string]$text) {
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($text.Trim())
    $sha = [System.Security.Cryptography.SHA256]::Create()
    try {
        return ([System.BitConverter]::ToString($sha.ComputeHash($bytes))).Replace('-', '').ToLowerInvariant()
    }
    finally {
        $sha.Dispose()
    }
}

if (-not (Test-Path -LiteralPath $ZipPath)) {
    throw "Zip file not found: $ZipPath"
}

if (Test-Path -LiteralPath $OutputDir) {
    $stamp = Get-Date -Format 'yyyyMMdd_HHmmss'
    $OutputDir = "${OutputDir}_$stamp"
}

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
$rawDir = Join-Path $OutputDir 'raw_extracted'
$mergedDir = Join-Path $OutputDir 'merged_by_index'
New-Item -ItemType Directory -Force -Path $rawDir | Out-Null
New-Item -ItemType Directory -Force -Path $mergedDir | Out-Null

$archive = [System.IO.Compression.ZipFile]::OpenRead($ZipPath)
$entries = @($archive.Entries | Where-Object { $_.FullName -like '*.txt' -and $_.Length -gt 0 } | Sort-Object FullName)

$docs = New-Object System.Collections.Generic.List[object]
$categoryOrder = @(
    '00_Final_Index_Reference_Map',
    '01_Order_Pipeline',
    '02_Runtime_Data_Model',
    '03_Architecture',
    '04_Implementation_Test_Verification',
    '05_Operations_Policy_Governance',
    '06_Glossary',
    '90_Misc'
)

foreach ($entry in $entries) {
    $target = Join-Path $rawDir $entry.FullName
    $targetParent = Split-Path -Parent $target
    if ($targetParent) {
        New-Item -ItemType Directory -Force -Path $targetParent | Out-Null
    }
    [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $target, $true)

    $stream = $entry.Open()
    try {
        $reader = New-Object System.IO.StreamReader($stream, [System.Text.Encoding]::UTF8, $true)
        $content = $reader.ReadToEnd()
        $reader.Close()
    }
    finally {
        $stream.Dispose()
    }

    $docs.Add([pscustomobject]@{
        Name = $entry.FullName
        Category = Get-Category $entry.FullName
        Content = Normalize-Text $content
        Hash = Get-Hash $content
        Blocks = Split-Blocks $content
    })
}
$archive.Dispose()

$globalDocHashes = @{}
$duplicateDocs = New-Object System.Collections.Generic.List[object]
foreach ($doc in $docs) {
    if ($globalDocHashes.ContainsKey($doc.Hash)) {
        $duplicateDocs.Add([pscustomobject]@{
            Duplicate = $doc.Name
            Original = $globalDocHashes[$doc.Hash]
            Type = 'Exact duplicate file'
        })
    }
    else {
        $globalDocHashes[$doc.Hash] = $doc.Name
    }
}

$summaryRows = New-Object System.Collections.Generic.List[object]
$blockDuplicateRows = New-Object System.Collections.Generic.List[object]

foreach ($category in $categoryOrder) {
    $categoryDocs = @($docs | Where-Object { $_.Category -eq $category } | Sort-Object Name)
    if ($categoryDocs.Count -eq 0) {
        continue
    }

    $seenBlocks = @{}
    $lines = New-Object System.Collections.Generic.List[string]
    $uniqueBlockCount = 0
    $duplicateBlockCount = 0

    $lines.Add("MASTER_SPEC merged index - $category")
    $lines.Add("Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")
    $lines.Add("Source zip: $ZipPath")
    $lines.Add("Source document count: $($categoryDocs.Count)")
    $lines.Add("")
    $lines.Add("==================================================")
    $lines.Add("Source documents")
    $lines.Add("==================================================")
    foreach ($doc in $categoryDocs) {
        $lines.Add("- $($doc.Name)")
    }
    $lines.Add("")

    foreach ($doc in $categoryDocs) {
        $lines.Add("==================================================")
        $lines.Add("SOURCE: $($doc.Name)")
        $lines.Add("==================================================")
        $lines.Add("")

        foreach ($block in $doc.Blocks) {
            $blockHash = Get-Hash $block
            if ($seenBlocks.ContainsKey($blockHash)) {
                $duplicateBlockCount += 1
                $previewText = (($block -replace "`n", ' ') -replace '\s+', ' ')
                $blockDuplicateRows.Add([pscustomobject]@{
                    Category = $category
                    DuplicateSource = $doc.Name
                    OriginalSource = $seenBlocks[$blockHash]
                    Preview = $previewText.Substring(0, [Math]::Min(120, $previewText.Length))
                })
                continue
            }

            $seenBlocks[$blockHash] = $doc.Name
            $uniqueBlockCount += 1
            $lines.Add($block)
            $lines.Add("")
        }
    }

    $fileName = New-SafeFileName $category
    $outFile = Join-Path $mergedDir $fileName
    [System.IO.File]::WriteAllText($outFile, ($lines -join "`r`n"), [System.Text.UTF8Encoding]::new($true))

    $summaryRows.Add([pscustomobject]@{
        Category = $category
        Documents = $categoryDocs.Count
        UniqueBlocks = $uniqueBlockCount
        DuplicateBlocksRemoved = $duplicateBlockCount
        OutputFile = "merged_by_index/$fileName"
    })
}

$indexLines = New-Object System.Collections.Generic.List[string]
$indexLines.Add("MASTER_SPEC MERGED INDEX")
$indexLines.Add("Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")
$indexLines.Add("Source zip: $ZipPath")
$indexLines.Add("Total source TXT documents: $($docs.Count)")
$indexLines.Add("")
$indexLines.Add("==================================================")
$indexLines.Add("Merged outputs")
$indexLines.Add("==================================================")
foreach ($row in $summaryRows) {
    $indexLines.Add("- $($row.Category): $($row.OutputFile)")
    $indexLines.Add("  Source documents: $($row.Documents), unique blocks: $($row.UniqueBlocks), duplicates removed: $($row.DuplicateBlocksRemoved)")
}
$indexLines.Add("")
$indexLines.Add("==================================================")
$indexLines.Add("Source assignment")
$indexLines.Add("==================================================")
foreach ($doc in ($docs | Sort-Object Category, Name)) {
    $indexLines.Add("- [$($doc.Category)] $($doc.Name)")
}
[System.IO.File]::WriteAllText((Join-Path $OutputDir '00_MASTER_SPEC_merged_INDEX.txt'), ($indexLines -join "`r`n"), [System.Text.UTF8Encoding]::new($true))

$reportLines = New-Object System.Collections.Generic.List[string]
$reportLines.Add("MASTER_SPEC deduplication report")
$reportLines.Add("Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")
$reportLines.Add("")
$reportLines.Add("==================================================")
$reportLines.Add("Summary")
$reportLines.Add("==================================================")
$reportLines.Add("- Source TXT documents: $($docs.Count)")
$reportLines.Add("- Exact duplicate files: $($duplicateDocs.Count)")
$reportLines.Add("- Duplicate blocks removed: $(($summaryRows | Measure-Object DuplicateBlocksRemoved -Sum).Sum)")
$reportLines.Add("")
$reportLines.Add("==================================================")
$reportLines.Add("Exact duplicate files")
$reportLines.Add("==================================================")
if ($duplicateDocs.Count -eq 0) {
    $reportLines.Add("- None")
}
else {
    foreach ($item in $duplicateDocs) {
        $reportLines.Add("- $($item.Duplicate) => $($item.Original)")
    }
}
$reportLines.Add("")
$reportLines.Add("==================================================")
$reportLines.Add("Removed duplicate blocks")
$reportLines.Add("==================================================")
if ($blockDuplicateRows.Count -eq 0) {
    $reportLines.Add("- None")
}
else {
    foreach ($item in $blockDuplicateRows) {
        $reportLines.Add("- [$($item.Category)] $($item.DuplicateSource) => $($item.OriginalSource)")
        $reportLines.Add("  Preview: $($item.Preview)")
    }
}
[System.IO.File]::WriteAllText((Join-Path $OutputDir '99_deduplication_report.txt'), ($reportLines -join "`r`n"), [System.Text.UTF8Encoding]::new($true))

$summaryRows | Format-Table -AutoSize
Write-Output ""
Write-Output "OutputDir=$OutputDir"
