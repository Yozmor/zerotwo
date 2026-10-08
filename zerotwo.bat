@echo off
rem zerotwo launcher for Windows: runs the zerotwo file next to this .bat
where py >nul 2>nul
if %errorlevel%==0 (
    py "%~dp0zerotwo" %*
) else (
    python "%~dp0zerotwo" %*
)
