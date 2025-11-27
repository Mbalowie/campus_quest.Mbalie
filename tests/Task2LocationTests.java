package tests;

import static org.junit.Assert.*;
import org.junit.Test;

import core.Student;
import locations.*;

public class Task2LocationTests {

    @Test
    public void testLibraryIncreasesKnowledge() {
        Student s = new Student("T");
        int k = s.getKnowledge();
        new Library().interact(s);
        assertTrue(s.getKnowledge() > k);
    }

    @Test
    public void testLibraryDecreasesEnergy() {
        Student s = new Student("T");
        int e = s.getEnergy();
        new Library().interact(s);
        assertTrue(s.getEnergy() < e);
    }

    @Test
    public void testCafeteriaRestoresEnergy() {
        Student s = new Student("T");
        s.decreaseEnergy(50);
        new Cafeteria().interact(s);
        assertTrue(s.getEnergy() > 50);
    }

    @Test
    public void testLectureHallTriggersEvent() {
        Student s = new Student("T");
        int k = s.getKnowledge();
        new LectureHall().interact(s);
        assertNotEquals(k, s.getKnowledge());
    }
}
