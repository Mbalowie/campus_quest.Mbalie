# Campus Quest - Student Testing Guide

## How to Test Your Code

### Quick Start

1. Open Command Prompt
2. Navigate to your project's `src` folder:
   ```
   cd C:\path\to\campus_quest_java\src
   ```
3. Run the test script for the task you're working on

### Available Test Scripts

Copy these files to your `src` folder, then run them:

#### Test Individual Tasks:

- `test_task1.bat` - Tests Student class (energy, knowledge methods)
- `test_task2.bat` - Tests Location classes (Library, Cafeteria, LectureHall)
- `test_task3.bat` - Tests Event classes (StudyEvent, RandomEncounter)
- `test_task4.bat` - Tests Character and NPC classes
- `test_task5.bat` - Tests Main class
- `test_task6.bat` - Tests GamePrinter utility class

#### Test Everything:

- `run_all_tests.bat` - Runs all tests at once

### How to Run Tests

**Option 1: Double-click**

- Find the `.bat` file in File Explorer
- Double-click it
- Read the results in the window that opens

**Option 2: Command Line**

```batch
# From src\test folder:
test_task1.bat

# Or full path:
C:\path\to\campus_quest_java\src\test\test_task1.bat
```

### Understanding Test Results

#### Success Message

```
[PASS] All Student tests passed!
```

This means your code is working correctly for this task!

#### Failure Message

```
[FAIL] Some Student tests failed.
```

Look at the error details below this message to see what needs fixing.

#### Compilation Error

```
[X] ERROR: Student.java won't compile!

You're probably missing these methods in Student.java:
  - increaseEnergy(int amount)
  - decreaseEnergy(int amount)
```

This tells you exactly which methods you need to add to your class.

## Common Error Messages Explained

### "cannot find symbol"

**What it means:** You're missing a method or variable.

**Example:**

```
error: cannot find symbol
    s.increaseEnergy(20);
     ^
  symbol:   method increaseEnergy(int)
```

**Fix:** Add the `increaseEnergy(int amount)` method to your Student class.

### "ClassNotFoundException"

**What it means:** The test file wasn't compiled yet.

**Fix:** The test script handles this automatically. If you see this, try running the test script again.

### "method does not override or implement"

**What it means:** Your method signature doesn't match what's expected.

**Example:**

```
error: method does not override or implement a method from a supertype
    @Override
    ^
```

**Fix:** Check that your method name, parameters, and return type match exactly.

## Task-Specific Method Requirements

### Task 1: Student Class

You need these methods in `core/Student.java`:

```java
public void increaseEnergy(int amount)
public void decreaseEnergy(int amount)
public void increaseKnowledge(int amount)
public int getKnowledge()
public int getEnergy()
```

**Key Rules:**

- Energy cannot go below 0
- Energy cannot go above 100
- Knowledge starts at 0

### Task 2: Location Classes

Each location needs this method:

```java
public void interact(Student student)
```

**What each location should do:**

- **Library:** Increases knowledge, decreases energy
- **Cafeteria:** Restores energy
- **LectureHall:** Triggers an event (changes knowledge)

### Task 3: Event Classes

Each event needs this method:

```java
public void perform(Student student)
```

**What each event should do:**

- **StudyEvent:** Increases student's knowledge
- **RandomEncounter:** Randomly affects student's energy (up or down)

### Task 4: Character & NPC

Your NPC needs:

```java
public void speak()
```

This should print something (doesn't matter what).

### Task 5: Main Class

Your Main class needs:

```java
public static void main(String[] args)
```

### Task 6: GamePrinter

Your GamePrinter needs these methods:

```java
public static void line()
public static void title(String text)
```

## Tips for Success

1. **Start with Task 1** - Get the Student class working first
2. **Test frequently** - Run tests after adding each method
3. **Read error messages carefully** - They tell you exactly what's missing
4. **One task at a time** - Don't try to do everything at once
5. **Ask for help** - If you're stuck, show your instructor the error message

## Troubleshooting

### Tests won't run at all

**Check:**

- Are you in the `src` folder?
- Does `tests/junit/junit-4.12.jar` exist?
- Is Java installed? Try: `java -version`

### All tests fail with "NoClassDefFoundError"

**Fix:** Delete the `bin` folder and run the test again

### "Access is denied" error

**Fix:** Close any programs that might be using your Java files (like your IDE)

## Need More Help?

If you're stuck:

1. Read the error message carefully
2. Check which method is missing
3. Look at the example code in the test file
4. Ask your instructor, showing them the exact error message

Good luck with Campus Quest!
