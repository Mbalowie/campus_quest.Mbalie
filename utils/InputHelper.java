package utils;

import java.util.Scanner;

public class InputHelper {
    private static Scanner scanner = new Scanner(System.in);

    public static int readInt(String msg) {
        System.out.print(msg);
        return scanner.nextInt();
    }
}
