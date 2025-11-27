package tests;

import static org.junit.Assert.*;
import org.junit.Test;
import utils.GamePrinter;

public class Task6PrinterTests {

    @Test
    public void testLineMethodExists() {
        try {
            GamePrinter.line();
        } catch (Exception e) {
            fail("line() method failed");
        }
    }

    @Test
    public void testTitleMethodExists() {
        try {
            GamePrinter.title("Hello");
        } catch (Exception e) {
            fail("title() method failed");
        }
    }
}
