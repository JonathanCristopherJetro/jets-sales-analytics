@echo off
REM ========================================
REM Jets Sales Analytics - Deployment Helper
REM ========================================

echo.
echo 🚀 Jets Sales Analytics Dashboard - Deployment Helper
echo ======================================================
echo.

REM Check if Git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git tidak terinstall. Download di: https://git-scm.com/downloads
    pause
    exit /b 1
)

echo ✅ Git terdeteksi
echo.

REM Check current directory
echo 📂 Current directory: %CD%
echo.

REM Menu
echo Pilih opsi deployment:
echo 1. Setup Git ^& Push ke GitHub (First time)
echo 2. Update ^& Push changes ke GitHub
echo 3. Test locally (jalankan app)
echo 4. Check dependencies
echo 5. Exit
echo.

set /p option="Pilih opsi (1-5): "

if "%option%"=="1" goto setup
if "%option%"=="2" goto update
if "%option%"=="3" goto test
if "%option%"=="4" goto deps
if "%option%"=="5" goto end
goto invalid

:setup
echo.
echo 🔧 Setting up Git repository...

REM Initialize Git if not already
if not exist .git (
    git init
    echo ✅ Git repository initialized
) else (
    echo ✅ Git repository already exists
)

REM Add all files
git add .
echo ✅ Files added to staging

REM Commit
set /p commit_msg="Enter commit message: "
git commit -m "%commit_msg%"
echo ✅ Commit created

REM Add remote
echo.
echo 📝 Sekarang buat repository di GitHub:
echo    1. Buka https://github.com/new
echo    2. Buat repository baru (public)
echo    3. Copy URL repository (format: https://github.com/username/repo-name.git)
echo.
set /p repo_url="Paste repository URL: "

git remote add origin %repo_url%
echo ✅ Remote repository added

REM Push
git branch -M main
git push -u origin main
echo ✅ Pushed to GitHub!
echo.
echo 🎉 Repository setup complete!
echo Next steps:
echo 1. Go to https://share.streamlit.io/
echo 2. Sign in with GitHub
echo 3. Deploy your app!
pause
exit /b 0

:update
echo.
echo 🔄 Updating repository...

REM Add changes
git add .
echo ✅ Changes added

REM Commit
set /p commit_msg="Enter commit message: "
git commit -m "%commit_msg%"
echo ✅ Commit created

REM Push
git push
echo ✅ Changes pushed to GitHub!
echo.
echo 🎉 Update complete! App akan auto-deploy di Streamlit Cloud.
pause
exit /b 0

:test
echo.
echo 🧪 Testing locally...
echo Opening browser at http://localhost:8501
streamlit run app.py
exit /b 0

:deps
echo.
echo 📦 Checking dependencies...

if exist requirements.txt (
    echo ✅ requirements.txt found
    echo.
    echo Dependencies:
    type requirements.txt
    echo.
    set /p install="Install/update dependencies? (y/n): "
    if /i "%install%"=="y" (
        pip install -r requirements.txt
        echo ✅ Dependencies installed!
    )
) else (
    echo ❌ requirements.txt not found!
)
pause
exit /b 0

:invalid
echo ❌ Invalid option
pause
exit /b 1

:end
echo 👋 Goodbye!
exit /b 0
