package tests;

import static org.junit.Assert.*;
import org.junit.Test;
import core.Student;
import events.*;

public class Task3EventTests {

    @Test
    public void testStudyEventIncreasesKnowledge() {
        Student s = new Student("T");
        int k = s.getKnowledge();
        new StudyEvent().perform(s);
        assertTrue(s.getKnowledge() > k);
    }

    @Test
    public void testRandomEncounterAffectsEnergy() {
        Student s = new Student("T");
        s.decreaseEnergy(10);
        int e = s.getEnergy();
        new RandomEncounter().perform(s);
        assertNotEquals(e, s.getEnergy());
    }
}
