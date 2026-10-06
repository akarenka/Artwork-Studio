@echo off
cd /d "%~dp0"
where py >nul 2>nul
if errorlevel 1 goto python
start "" http://127.0.0.1:8000/
py -3 -m http.server 8000 --bind 127.0.0.1
pause
exit /b
:python
where python >nul 2>nul
if errorlevel 1 (
  echo Python 3 is required. Install Python or deploy the files to GitHub Pages.
  pause
  exit /b 1
)
start "" http://127.0.0.1:8000/
python -m http.server 8000 --bind 127.0.0.1
pause
