@echo off
title CapSwey's Sync Calculator (CSSC)

:start
cls
echo ====================================================
echo          CapSwey's Sync Calculator (CSSC)
echo ====================================================
echo Select Frame Rate:
echo   [1] 23.976 fps (Default - press Enter)
echo   [2] 24.000 fps (True 24p)
echo   [3] 25.000 fps (PAL)
echo   [4] 29.970 fps (NTSC)
echo   [5] 50.000 fps (PAL High Frame Rate)
echo   [6] 59.940 fps (NTSC High Frame Rate)
echo.
set "fpsChoice=1"
set /p fpsChoice="Choice [1-6] (Default 1): "

set "fpsName=23.976 fps"
set "num=1001"
set "den=24"

if "%fpsChoice%"=="2" (
    set "fpsName=24.000 fps"
    set "num=1000"
    set "den=24"
)
if "%fpsChoice%"=="3" (
    set "fpsName=25.000 fps"
    set "num=1000"
    set "den=25"
)
if "%fpsChoice%"=="4" (
    set "fpsName=29.970 fps"
    set "num=1001"
    set "den=30"
)
if "%fpsChoice%"=="5" (
    set "fpsName=50.000 fps"
    set "num=1000"
    set "den=50"
)
if "%fpsChoice%"=="6" (
    set "fpsName=59.940 fps"
    set "num=1001"
    set "den=60"
)

echo.
echo Selected: %fpsName%
echo ----------------------------------------------------
set /p frameA="Enter Movie A (Target Video) Frame: "
set /p frameB="Enter Movie B (Source Audio/RPU) Frame: "

powershell -NoProfile -Command ^
  "$diff = %frameA% - %frameB%; " ^
  "$ms = [math]::Round(($diff * %num%) / %den%); " ^
  "Write-Host ''; " ^
  "Write-Host '----------------------------------------------------' -ForegroundColor DarkGray; " ^
  "Write-Host ('Frame Rate:  %fpsName%') -ForegroundColor Gray; " ^
  "if ($diff -gt 0) { " ^
  "    Write-Host 'Direction:   POSITIVE DELAY (Movie B is ahead)' -ForegroundColor Yellow; " ^
  "    Write-Host ('Frame Diff:  +' + $diff + ' frames') -ForegroundColor White; " ^
  "    Write-Host ('Delay (ms):  +' + $ms + ' ms') -ForegroundColor Green; " ^
  "} elseif ($diff -lt 0) { " ^
  "    Write-Host 'Direction:   NEGATIVE DELAY (Movie B is behind)' -ForegroundColor Yellow; " ^
  "    Write-Host ('Frame Diff:  ' + $diff + ' frames') -ForegroundColor White; " ^
  "    Write-Host ('Delay (ms):  ' + $ms + ' ms') -ForegroundColor Green; " ^
  "} else { " ^
  "    Write-Host 'Direction:   PERFECT SYNC (No delay needed)' -ForegroundColor Cyan; " ^
  "    Write-Host 'Frame Diff:  0 frames' -ForegroundColor White; " ^
  "    Write-Host 'Delay (ms):  0 ms' -ForegroundColor Green; " ^
  "} " ^
  "Write-Host '----------------------------------------------------' -ForegroundColor DarkGray; " ^
  "Set-Clipboard -Value $ms; " ^
  "Write-Host 'Copied to clipboard: ' -NoNewline; Write-Host $ms -ForegroundColor Cyan"

echo.
pause
goto start
