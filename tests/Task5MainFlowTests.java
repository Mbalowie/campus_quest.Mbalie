package tests;

import static org.junit.Assert.*;
import org.junit.Test;

import main.Main;

public class Task5MainFlowTests {

    @Test
    public void mainMethodExists() {
        try {
            Main.class.getMethod("main", String[].class);
        } catch (Exception e) {
            fail("Main method missing or incorrectly defined");
        }
    }
}
