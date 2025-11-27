@echo off
cls
echo.
echo ================================================================
echo              TASK 1: Testing Student Class
echo ================================================================
echo.

set JUNIT_JAR=junit\junit-4.12.jar
set HAMCREST_JAR=junit\hamcrest-core-1.3.jar
set CLASSPATH=.;%JUNIT_JAR%;%HAMCREST_JAR%
set BIN_DIR=bin

if not exist %BIN_DIR% mkdir %BIN_DIR%

echo [STEP 1] Compiling Student class...
echo ----------------------------------------------------------------

javac -d %BIN_DIR% -cp %CLASSPATH% ^
  ..\core\Character.java ^
  ..\core\Student.java ^
  2> errors.txt

if errorlevel 1 (
    echo.
    echo [X] ERROR: Student.java won't compile!
    echo.
    type errors.txt
    echo.
    del errors.txt
    pause
    exit /b 1
)

echo [OK] Student class compiled!
echo.

echo [STEP 2] Compiling test...
echo ----------------------------------------------------------------

javac -d %BIN_DIR% -cp "%CLASSPATH%;%BIN_DIR%" ^
  Task1StudentTests.java ^
  2> errors.txt

if errorlevel 1 (
    echo.
    echo [X] ERROR: Test won't compile!
    echo.
    echo You might be missing required methods in Student.java
    echo.
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

java -cp "%CLASSPATH%;%BIN_DIR%" org.junit.runner.JUnitCore tests.Task1StudentTests

echo.
echo ================================================================
pause
