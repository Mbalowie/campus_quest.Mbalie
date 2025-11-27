@echo off
cls
echo.
echo ================================================================
echo                    CAMPUS QUEST - TEST RUNNER
echo ================================================================
echo.

REM Set up paths
set JUNIT_JAR=tests\junit\junit-4.12.jar
set CLASSPATH=.;%JUNIT_JAR%
set BIN_DIR=bin

REM Create bin directory if it doesn't exist
if not exist %BIN_DIR% mkdir %BIN_DIR%

echo [STEP 1] Compiling your game code...
echo ----------------------------------------------------------------

javac -d %BIN_DIR% -cp %CLASSPATH% ^
    core\Character.java ^
    core\Student.java ^
    core\NPC.java ^
    interfaces\GameAction.java ^
    events\Event.java ^
    events\StudyEvent.java ^
    events\QuizEvent.java ^
    events\RandomEncounter.java ^
    locations\Location.java ^
    locations\Library.java ^
    locations\Cafeteria.java ^
    locations\LectureHall.java ^
    utils\GamePrinter.java ^
    utils\InputHelper.java ^
    Main.java 2> compile_errors.txt

if errorlevel 1 (
    echo.
    echo [X] ERROR: Your game code has compilation errors!
    echo.
    echo Here are the problems:
    echo ----------------------------------------------------------------
    type compile_errors.txt
    echo ----------------------------------------------------------------
    echo.
    echo Fix these errors in your code and try again.
    del compile_errors.txt
    pause
    exit /b 1
)

echo [OK] Game code compiled successfully!
echo.

echo [STEP 2] Compiling test files...
echo ----------------------------------------------------------------

javac -d %BIN_DIR% -cp "%CLASSPATH%;%BIN_DIR%" ^
    tests\Task1StudentTests.java ^
    tests\Task2LocationTests.java ^
    tests\Task3EventTests.java ^
    tests\Task4CharacterNpcTests.java ^
    tests\Task5MainFlowTests.java ^
    tests\Task6PrinterTests.java 2> test_compile_errors.txt

if errorlevel 1 (
    echo.
    echo [X] ERROR: Test files won't compile!
    echo.
    echo This usually means you're missing some methods in your classes.
    echo Here's what needs to be fixed:
    echo ----------------------------------------------------------------
    type test_compile_errors.txt
    echo ----------------------------------------------------------------
    echo.
    echo TIP: Look for "cannot find symbol" errors - these tell you which
    echo      methods you need to add to your classes.
    echo.
    del test_compile_errors.txt
    pause
    exit /b 1
)

echo [OK] Test files compiled successfully!
echo.

echo ================================================================
echo                        RUNNING TESTS
echo ================================================================
echo.

REM Run all tests and capture results
set TOTAL_TESTS=0
set PASSED_TESTS=0
set FAILED_TESTS=0

echo [TEST 1 of 6] Student Class Tests
echo ----------------------------------------------------------------
java -cp "%CLASSPATH%;%BIN_DIR%" org.junit.runner.JUnitCore tests.Task1StudentTests > test_result.txt 2>&1
findstr /C:"OK" test_result.txt > nul
if %errorlevel%==0 (
    echo [PASS] All Student tests passed!
    set /a PASSED_TESTS+=1
) else (
    echo [FAIL] Some Student tests failed.
    type test_result.txt | findstr /V "JUnit"
)
set /a TOTAL_TESTS+=1
echo.

echo [TEST 2 of 6] Location Classes Tests
echo ----------------------------------------------------------------
java -cp "%CLASSPATH%;%BIN_DIR%" org.junit.runner.JUnitCore tests.Task2LocationTests > test_result.txt 2>&1
findstr /C:"OK" test_result.txt > nul
if %errorlevel%==0 (
    echo [PASS] All Location tests passed!
    set /a PASSED_TESTS+=1
) else (
    echo [FAIL] Some Location tests failed.
    type test_result.txt | findstr /V "JUnit"
)
set /a TOTAL_TESTS+=1
echo.

echo [TEST 3 of 6] Event Classes Tests
echo ----------------------------------------------------------------
java -cp "%CLASSPATH%;%BIN_DIR%" org.junit.runner.JUnitCore tests.Task3EventTests > test_result.txt 2>&1
findstr /C:"OK" test_result.txt > nul
if %errorlevel%==0 (
    echo [PASS] All Event tests passed!
    set /a PASSED_TESTS+=1
) else (
    echo [FAIL] Some Event tests failed.
    type test_result.txt | findstr /V "JUnit"
)
set /a TOTAL_TESTS+=1
echo.

echo [TEST 4 of 6] Character and NPC Tests
echo ----------------------------------------------------------------
java -cp "%CLASSPATH%;%BIN_DIR%" org.junit.runner.JUnitCore tests.Task4CharacterNpcTests > test_result.txt 2>&1
findstr /C:"OK" test_result.txt > nul
if %errorlevel%==0 (
    echo [PASS] All Character/NPC tests passed!
    set /a PASSED_TESTS+=1
) else (
    echo [FAIL] Some Character/NPC tests failed.
    type test_result.txt | findstr /V "JUnit"
)
set /a TOTAL_TESTS+=1
echo.

echo [TEST 5 of 6] Main Flow Tests
echo ----------------------------------------------------------------
java -cp "%CLASSPATH%;%BIN_DIR%" org.junit.runner.JUnitCore tests.Task5MainFlowTests > test_result.txt 2>&1
findstr /C:"OK" test_result.txt > nul
if %errorlevel%==0 (
    echo [PASS] Main flow tests passed!
    set /a PASSED_TESTS+=1
) else (
    echo [FAIL] Main flow tests failed.
    type test_result.txt | findstr /V "JUnit"
)
set /a TOTAL_TESTS+=1
echo.

echo [TEST 6 of 6] GamePrinter Tests
echo ----------------------------------------------------------------
java -cp "%CLASSPATH%;%BIN_DIR%" org.junit.runner.JUnitCore tests.Task6PrinterTests > test_result.txt 2>&1
findstr /C:"OK" test_result.txt > nul
if %errorlevel%==0 (
    echo [PASS] GamePrinter tests passed!
    set /a PASSED_TESTS+=1
) else (
    echo [FAIL] GamePrinter tests failed.
    type test_result.txt | findstr /V "JUnit"
)
set /a TOTAL_TESTS+=1
echo.

REM Calculate failed tests
set /a FAILED_TESTS=%TOTAL_TESTS%-%PASSED_TESTS%

echo ================================================================
echo                        FINAL RESULTS
echo ================================================================
echo.
echo Tests Passed: %PASSED_TESTS% / %TOTAL_TESTS%
echo Tests Failed: %FAILED_TESTS% / %TOTAL_TESTS%
echo.

if %FAILED_TESTS%==0 (
    echo  CONGRATULATIONS! All tests passed! 
    echo.
    echo Your Campus Quest game is working correctly!
) else (
    echo  Keep going! You're making progress! 
    echo.
    echo Fix the failing tests above and run this script again.
)

echo ================================================================
echo.

REM Clean up temp files
if exist test_result.txt del test_result.txt
if exist compile_errors.txt del compile_errors.txt
if exist test_compile_errors.txt del test_compile_errors.txt

pause
