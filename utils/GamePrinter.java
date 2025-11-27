package utils;

public class GamePrinter {
    public static void line() {
        System.out.println("------------------------------------------------");
    }

    public static void title(String text) {
        line();
        System.out.println(text);
        line();
    }
}
