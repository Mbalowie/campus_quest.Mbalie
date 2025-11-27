package tests;

import static org.junit.Assert.*;
import org.junit.Test;
import core.Student;

public class Task1StudentTests {

    @Test
    public void testEnergyIncrease() {
        Student s = new Student("Test");
        s.increaseEnergy(20);
        assertEquals(100, s.getEnergy());
    }

    @Test
    public void testEnergyDecrease() {
        Student s = new Student("Test");
        s.decreaseEnergy(30);
        assertEquals(70, s.getEnergy());
    }

    @Test
    public void testKnowledgeIncrease() {
        Student s = new Student("Test");
        s.increaseKnowledge(10);
        assertEquals(10, s.getKnowledge());
    }

    @Test
    public void testEnergyCannotGoNegative() {
        Student s = new Student("Test");
        s.decreaseEnergy(200);
        assertEquals(0, s.getEnergy());
    }

    @Test
    public void testEnergyCannotExceed100() {
        Student s = new Student("Test");
        s.increaseEnergy(200);
        assertEquals(100, s.getEnergy());
    }
}
