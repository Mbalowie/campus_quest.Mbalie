@echo off
cls
echo.
echo ================================================================
echo              TASK 4: Testing Character and NPC
echo ================================================================
echo.

set JUNIT_JAR=tests\junit\junit-4.12.jar
set CLASSPATH=.;%JUNIT_JAR%
set BIN_DIR=bin

if not exist %BIN_DIR% mkdir %BIN_DIR%

echo [STEP 1] Compiling classes...
echo ----------------------------------------------------------------

javac -d %BIN_DIR% -cp %CLASSPATH% core\Character.java core\NPC.java 2^>errors.txt

if errorlevel 1 (
    echo.
    echo [X] ERROR: NPC class won't compile!
    echo.
    type errors.txt
    echo.
    del errors.txt
    pause
    exit /b 1
)

echo [OK] Classes compiled!
echo.

echo [STEP 2] Compiling test...
echo ----------------------------------------------------------------

javac -d %BIN_DIR% -cp "%CLASSPATH%;%BIN_DIR%" tests\Task4CharacterNpcTests.java 2^>errors.txt

if errorlevel 1 (
    echo.
    echo [X] ERROR: Test won't compile!
    echo.
    echo You're probably missing the speak() method in NPC.java
    echo.
    echo Here are the exact errors:
    type errors.txt
    echo.
    del errors.txt
    pause
    exit /b 1
)

echo [OK] Test compiled!
echo.

echo [STEP 3] Running tests...
echo ================================================================
echo.

java -cp "%CLASSPATH%;%BIN_DIR%" org.junit.runner.JUnitCore tests.Task4CharacterNpcTests

echo.
echo ================================================================
pause
