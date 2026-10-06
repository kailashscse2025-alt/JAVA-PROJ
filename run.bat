@echo off
echo ========================================================
echo   STARTING COLLEGE EVENT MANAGEMENT SYSTEM
echo ========================================================
echo.
echo Make sure MySQL is running on port 3306.
echo.

if not exist bin (
    echo [INFO] Bin folder not found. Compiling first...
    call build.bat
)

java -cp "bin;lib/mysql-connector-j-9.2.0.jar" Main

pause
