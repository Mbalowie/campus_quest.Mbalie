package tests;

import static org.junit.Assert.*;
import org.junit.Test;

import core.NPC;

public class Task4CharacterNpcTests {

    @Test
    public void testNpcSpeakDoesNotCrash() {
        NPC n = new NPC("Zara");
        n.speak(); // should print something but must not throw
    }
}
