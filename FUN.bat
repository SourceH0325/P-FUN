@echo off
setlocal enabledelayedexpansion
set Count=0
set Time="Seconds to run the program for a few seconds"
set CoolTime="Seconds for how many seconds to shut down the program"
set MEMTime="Seconds to stop while preventing low memory"
set ShutdownProgram="Name of the program you want to stop"

:loop
taskkill /f /im !ShutdownProgram! >nul

set /a Count+=1
echo Number of program terminations : !Count!

timeout /t !CoolTime! >nul

if !Count! geq !Time! (
    set /a Count = 0
    powershell -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('The program is interrupted for !MEMTime! second to avoid running out of memory.', 'Warning', 'OK', 0)"
    timeout /t !MEMTime! 
    goto loop
) else (
    goto loop
)
