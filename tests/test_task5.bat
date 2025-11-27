@echo off
cls
echo.
echo ================================================================
echo              TASK 5: Testing Main Class
echo ================================================================
echo.

set JUNIT_JAR=junit\junit-4.12.jar
set HAMCREST_JAR=junit\hamcrest-core-1.3.jar
set CLASSPATH=.;%JUNIT_JAR%;%HAMCREST_JAR%
set BIN_DIR=bin

if not exist %BIN_DIR% mkdir %BIN_DIR%

echo [STEP 1] Compiling Main class...
echo ----------------------------------------------------------------

javac -d %BIN_DIR% -cp %CLASSPATH% ^
..\interfaces\GameAction.java ^
  ..\core\Character.java ^
  ..\core\Student.java ^
  ..\events\Event.java ^
  ..\events\QuizEvent.java ^
  ..\events\RandomEncounter.java ^
  ..\events\StudyEvent.java ^
  ..\locations\Location.java ^
  ..\locations\Library.java ^
  ..\locations\Cafeteria.java ^
  ..\locations\LectureHall.java ^
  ..\utils\InputHelper.java ^
  ..\main\Main.java 2> errors.txt

if errorlevel 1 (
    echo.
    echo [X] ERROR: Main.java won't compile!
    echo.
    type errors.txt
    echo.
    del errors.txt
    pause
    exit /b 1
)

echo [OK] Main class compiled!
echo.

echo [STEP 2] Compiling test...
echo ----------------------------------------------------------------

javac -d %BIN_DIR% -cp "%CLASSPATH%;%BIN_DIR%" Task5MainFlowTests.java 2> errors.txt

if errorlevel 1 (
    echo.
    echo [X] ERROR: Test won't compile!
    echo.
    echo Make sure Main.java has:
    echo   public static void main function
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

java -cp "%CLASSPATH%;%BIN_DIR%" org.junit.runner.JUnitCore tests.Task5MainFlowTests

echo.
echo ================================================================
pause
