@echo off
echo ========================================================
echo   RUNNING CONSOLE / CLI TERMINAL MODE
echo ========================================================
echo.

if not exist bin (
    echo [INFO] Bin folder not found. Compiling first...
    call build.bat
)

java -cp "bin;lib/mysql-connector-j-9.2.0.jar" Main --console

pause
