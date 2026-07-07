# rollback_STEP34_macd_settings_ui.ps1
# STEP34 복구 보조 스크립트
#
# 실행 위치:
# C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto
#
# 목적:
# - 가장 최근 gui_routine_assign_window_BACKUP_before_STEP31_*.py 백업을 찾아 복구
# - gui_macd_routine_settings_dialog.py는 제거하지 않고 남겨둠
#
# 주의:
# - 자동 복구 대상은 gui_routine_assign_window.py 하나만이다.
# - 여러 백업이 있으면 가장 최근 백업을 사용한다.

$ErrorActionPreference = "Stop"

Write-Host "======================================================================"
Write-Host "STEP34 MACD 설정 UI 롤백 보조 스크립트"
Write-Host "======================================================================"

$Backups = Get-ChildItem -Path . -Filter "gui_routine_assign_window_BACKUP_before_STEP31_*.py" | Sort-Object LastWriteTime -Descending

if ($Backups.Count -eq 0) {
    Write-Host "[ERROR] 복구할 백업 파일을 찾지 못했습니다."
    exit 1
}

$Latest = $Backups[0]
Copy-Item $Latest.FullName "gui_routine_assign_window.py" -Force

Write-Host "[복구 완료]" $Latest.Name "-> gui_routine_assign_window.py"
Write-Host "이후 확인:"
Write-Host "python gui_main.py"
Write-Host "======================================================================"
