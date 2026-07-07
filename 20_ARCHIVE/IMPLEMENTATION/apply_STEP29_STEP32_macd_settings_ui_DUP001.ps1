# apply_STEP29_STEP32_macd_settings_ui.ps1
# STEP34 적용 보조 스크립트
#
# 실행 위치:
# C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto
#
# 목적:
# - STEP29~STEP32 파일명을 실제 프로젝트용 이름으로 복사
# - 기존 gui_routine_assign_window.py 백업
# - 기존 gui_macd_routine_settings_dialog.py가 있으면 백업
#
# 주의:
# - rules.json은 수정하지 않음
# - 실주문 관련 파일 수정 없음
# - HOLD/CANCEL/BUY 확장 없음

$ErrorActionPreference = "Stop"

Write-Host "======================================================================"
Write-Host "STEP34 MACD 설정 UI 적용 보조 스크립트"
Write-Host "======================================================================"

$ProjectRoot = Get-Location
Write-Host "[프로젝트 루트]" $ProjectRoot

$RequiredFiles = @(
    "gui_macd_routine_settings_dialog_STEP29.py",
    "test_macd_settings_dialog_step30.py",
    "gui_routine_assign_window_STEP31_add_macd_settings_button.py",
    "test_routine_assign_window_step32.py"
)

foreach ($file in $RequiredFiles) {
    if (-not (Test-Path $file)) {
        Write-Host "[ERROR] 필요한 파일이 없습니다: $file"
        Write-Host "스크립트를 중단합니다."
        exit 1
    }
}

$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"

if (Test-Path "gui_routine_assign_window.py") {
    $BackupName = "gui_routine_assign_window_BACKUP_before_STEP31_$Timestamp.py"
    Copy-Item "gui_routine_assign_window.py" $BackupName
    Write-Host "[백업]" $BackupName
} else {
    Write-Host "[WARN] 기존 gui_routine_assign_window.py 없음"
}

if (Test-Path "gui_macd_routine_settings_dialog.py") {
    $BackupName = "gui_macd_routine_settings_dialog_BACKUP_before_STEP29_$Timestamp.py"
    Copy-Item "gui_macd_routine_settings_dialog.py" $BackupName
    Write-Host "[백업]" $BackupName
}

Copy-Item "gui_macd_routine_settings_dialog_STEP29.py" "gui_macd_routine_settings_dialog.py" -Force
Write-Host "[적용] gui_macd_routine_settings_dialog.py"

Copy-Item "gui_routine_assign_window_STEP31_add_macd_settings_button.py" "gui_routine_assign_window.py" -Force
Write-Host "[적용] gui_routine_assign_window.py"

Write-Host "======================================================================"
Write-Host "[적용 완료]"
Write-Host "다음 순서로 검증하세요."
Write-Host "1) python test_macd_settings_dialog_step30.py"
Write-Host "2) python test_routine_assign_window_step32.py"
Write-Host "3) python gui_main.py"
Write-Host "======================================================================"
