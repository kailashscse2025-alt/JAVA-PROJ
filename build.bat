@echo off
echo ========================================================
echo   COMPILING COLLEGE EVENT MANAGEMENT SYSTEM
echo ========================================================

if not exist bin mkdir bin

javac -encoding UTF-8 -cp "lib/mysql-connector-j-9.2.0.jar;src" -d bin src/model/*.java src/exception/*.java src/util/*.java src/dao/*.java src/server/*.java src/Main.java

if %ERRORLEVEL% EQU 0 (
    echo.
    echo [SUCCESS] Compilation finished with 0 errors!
    echo Output directory: bin\
) else (
    echo.
    echo [ERROR] Compilation failed. Please check Java errors above.
)
pause
