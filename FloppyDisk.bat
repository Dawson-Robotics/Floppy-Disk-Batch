@echo off

:findA
if exist A:\ (
    goto runfile
) else ( 
    goto findA
)

:runfile
A:

for %%f IN (*.txt) do set file="%%f"

if %file% == "redgame.txt" (
	start "firefox.exe" "https://scratch.mit.edu/projects/945043561/fullscreen/"
	goto checkOnlineFile
) 

if %file% == "bluegame.txt" (
    @REM NOT DONE
    start winword.exe "iv lab schedule.doc"
    goto checkfileword
)

if %file% == "video.txt" (
    start mpc-hc64.exe "C:\Users\2236219\Documents\Video.mp4"
    goto checkfilevideo
)

if %file% == "bloopers.txt" (
    start mpc-hc64.exe "C:\Users\2236219\Documents\Bloopers.mp4"
    goto checkfilevideo
)

if %file% == "bts.txt" (
    start mpc-hc64.exe "C:\Users\2236219\Documents\BTS.mov"
    goto checkfilevideo
)

if %file% == "powerpoint.txt" (
	start powerpnt.exe "C:\Users\2236219\Documents\PresentationPlaceHolder.ppsx"
	goto checkPowerPoint
)

if %file% == "tutorial.txt" (
    start mpc-hc64.exe "C:\Users\2236219\Documents\Tutorial2024Final.mp4"
    goto checkfilevideo
)

if %file% == "website.txt" (
	start "firefox.exe" http://dawtrek.crcrobotics.com/
	goto checkOnlineFile
)

:checkfilevideo
C:
tasklist /fi "ImageName eq mpc-hc64.exe" /fo csv 2>NUL | find /I "mpc-hc64.exe">NUL
if exist A:\ (
    if "%ERRORLEVEL%"=="0" (
        @REM echo Program is running
        goto checkfilevideo
    ) else (
        goto findA
    )
)
taskkill /f /im mpc-hc64.exe
goto findA


:checkPowerPoint
C:
tasklist /fi "ImageName eq POWERPNT.EXE" /fo csv 2>NUL | find /I "POWERPNT.EXE">NUL
if exist A:\ (
    if "%ERRORLEVEL%"=="0" (
        @REM echo Program is running
        goto checkPowerPoint
    ) else (
        goto findA
    )
)
taskkill /f /im POWERPNT.EXE
goto findA 

:checkOnlineFile
C:
tasklist /fi "ImageName eq firefox.exe" /fo csv 2>NUL | find /I "firefox.exe">NUL
if exist A:\ (
    if "%ERRORLEVEL%"=="0" (
        @REM echo Program is running
        goto checkOnlineFile
    ) else (
        goto findA
    )
)
taskkill /f /im firefox.exe
goto findA
