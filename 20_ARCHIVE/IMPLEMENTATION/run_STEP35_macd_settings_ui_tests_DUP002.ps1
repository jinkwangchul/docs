# run_STEP35_macd_settings_ui_tests.ps1
# STEP35 MACD 설정 UI 검증 실행 스크립트
#
# 실행 위치:
# C:\Users\JIN KWANG CHUL\Documents\kiwoom_auto
#
# 목적:
# - STEP30 독립 다이얼로그 검증 실행
# - STEP32 루틴지정창 연결 후보 검증 실행
# - gui_main.py 실행 전 필요한 파일 존재 확인
#
# 주의:
# - rules.json 수정 없음
# - 저장 기능 없음
# - 실주문 연결 없음

$ErrorActionPreference = "Stop"

Write-Host "======================================================================"
Write-Host "STEP35 MACD 설정 UI 검증 실행"
Write-Host "======================================================================"

$RequiredFiles = @(
    "gui_macd_routine_settings_dialog.py",
    "gui_routine_assign_window.py",
    "test_macd_settings_dialog_step30.py",
    "test_routine_assign_window_step32.py",
    "routines\MACD매매루틴\rules.json"
)

foreach ($file in $RequiredFiles) {
    if (-not (Test-Path $file)) {
        Write-Host "[ERROR] 필요한 파일이 없습니다: $file"
        exit 1
    } else {
        Write-Host "[OK] 파일 확인: $file"
    }
}

Write-Host ""
Write-Host "======================================================================"
Write-Host "1) STEP30 테스트 실행"
Write-Host "======================================================================"
python test_macd_settings_dialog_step30.py

Write-Host ""
Write-Host "======================================================================"
Write-Host "2) STEP32 테스트 실행"
Write-Host "======================================================================"
python test_routine_assign_window_step32.py

Write-Host ""
Write-Host "======================================================================"
Write-Host "[검증 완료]"
Write-Host "위 테스트가 모두 OK이면 다음을 직접 실행해 화면을 확인하세요:"
Write-Host "python gui_main.py"
Write-Host ""
Write-Host "확인할 것:"
Write-Host "- 루틴 지정창 열림"
Write-Host "- MACD매매루틴 선택"
Write-Host "- 루틴 설정 버튼 표시"
Write-Host "- 설정창 표시"
Write-Host "- 저장 버튼 비활성"
Write-Host "- HOLD 없음"
Write-Host "- CANCEL 실행 버튼 없음"
Write-Host "======================================================================"
