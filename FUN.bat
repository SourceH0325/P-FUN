@echo off
setlocal enabledelayedexpansion
set Count=0
set Time=�� �۵� �ð� (��)
set MEMTime=�޸� ������ �۵� ���� �ð� (��)
set ShutdownProgram=�۵� ���� ��ų ���α׷� �̸�.exe

:loop
taskkill /f /im !ShutdownProgram!.exe >nul

set /a Count+=1
echo ���α׷� ������ Ƚ�� : !Count!

timeout /t 1 >nul

if !Count! geq !Time! (
    set /a Count = 0
    powershell -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('�޸� ���� ������ ���� !MEMTime!�ʰ� ���α׷��� �����˴ϴ�.', '����', 'OK', 0)"
    timeout /t !MEMTime! 
    goto loop
) else (
    goto loop
)
