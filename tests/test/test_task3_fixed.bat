@echo off
cls
echo.
echo ================================================================
echo              TASK 3: Testing Event Classes
echo ================================================================
echo.

set JUNIT_JAR=tests\junit\junit-4.12.jar
set CLASSPATH=.;%JUNIT_JAR%
set BIN_DIR=bin

if not exist %BIN_DIR% mkdir %BIN_DIR%

echo [STEP 1] Compiling classes...
echo ----------------------------------------------------------------

javac -d %BIN_DIR% -cp %CLASSPATH% core\Character.java core\Student.java events\Event.java events\StudyEvent.java events\RandomEncounter.java 2^>errors.txt

if errorlevel 1 (
    echo.
    echo [X] ERROR: Event classes won't compile!
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

javac -d %BIN_DIR% -cp "%CLASSPATH%;%BIN_DIR%" tests\Task3EventTests.java 2^>errors.txt

if errorlevel 1 (
    echo.
    echo [X] ERROR: Test won't compile!
    echo.
    echo You're probably missing the perform(Student s) method in:
    echo   - StudyEvent.java
    echo   - RandomEncounter.java
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

java -cp "%CLASSPATH%;%BIN_DIR%" org.junit.runner.JUnitCore tests.Task3EventTests

echo.
echo ================================================================
pause
