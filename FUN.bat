@echo off
setlocal enabledelayedexpansion
set Count=0
set Time=총 작동 시간 (초)
set MEMTime=메모리 과부하 작동 중지 시간 (초)
set ShutdownProgram=작동 중지 시킬 프로그램 이름.exe

:loop
taskkill /f /im !ShutdownProgram!.exe >nul

set /a Count+=1
echo 프로그램 종료한 횟수 : !Count!

timeout /t 1 >nul

if !Count! geq !Time! (
    set /a Count = 0
    powershell -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('메모리 부족 방지를 위해 !MEMTime!초간 프로그램이 중지됩니다.', '주의', 'OK', 0)"
    timeout /t !MEMTime! 
    goto loop
) else (
    goto loop
)
