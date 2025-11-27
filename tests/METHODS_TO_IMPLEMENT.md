# Methods You Need to Implement

Based on the test errors, here are the methods missing from your classes:

## Student Class (core/Student.java)

```java
public class Student extends Character {
    private int knowledge;

    public Student(String name) {
        super(name);
        this.knowledge = 0;
    }

    // Methods you need to add:
    public void increaseEnergy(int amount) {
        // Increase energy, but cap at 100
        // energy = Math.min(100, energy + amount);
    }

    public void decreaseEnergy(int amount) {
        // Decrease energy, but don't go below 0
        // energy = Math.max(0, energy - amount);
    }

    public void increaseKnowledge(int amount) {
        // increase knowledge by a given amount
    }

    public int getKnowledge() {
        // getter for the knowledge attribute
    }

    public int getEnergy() {
        // Return current energy
        // return energy;
    }
}
```

## RandomEncounter Class (events/RandomEncounter.java)

```java
public class RandomEncounter extends Event {

    // Method you need to add:
    public void perform(Student student) {
        // Randomly affect the student's energy
        // Could increase or decrease it
    }
}
```

## GamePrinter Class (utils/GamePrinter.java)

```java
public class GamePrinter {

    public static void line() {
        System.out.println("========================================");
    }

    // Method you need to add:
    public static void title(String text) {
        line();
        System.out.println(text);
        line();
    }
}
```

## Location Classes

All location classes (Library, Cafeteria, LectureHall) need:

```java
public void interact(Student student) {
    // Implement the interaction logic
    // e.g., Library increases knowledge and decreases energy
    // Cafeteria restores energy
    // LectureHall triggers events
}
```

## Event Classes

All event classes (StudyEvent, QuizEvent) need:

```java
public void perform(Student student) {
    // Implement the event logic
}
```
