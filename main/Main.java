package main;

import core.Student;
import events.RandomEncounter;
import locations.Cafeteria;
import locations.Library;
import locations.Location;
import events.Event;
import locations.LectureHall;
import utils.InputHelper;

public class Main {

    public static void main(String[] args) {
        Student player = new Student("Unnamed");
        Location currentLocation = new Library();

        System.out.println("+++++++++++++++ Welcome to Campus Quest +++++++++++++++");

        boolean running = true;

        while (running) {
            System.out.println("\nYou are at: " + currentLocation.getName());
            System.out.println("Choose an action:");
            System.out.println("1. Move to another location");
            System.out.println("2. Interact");
            System.out.println("3. Trigger event");
            System.out.println("0. Exit");

            int choice = InputHelper.readInt("Enter choice: ");

            switch (choice) {
                case 1:
                    currentLocation = moveMenu();
                    break;
                case 2:
                    currentLocation.interact(player);
                    break;
                case 3:
                    Event e = new RandomEncounter();
                    e.run(player);

                case 0:
                    running = false;
                    break;
                default:
                    System.out.println("Invalid choice");
            }
        }
        System.out.println("Goodbye!");
    }

    private static Location moveMenu() {
        System.out.println("\nWhere would you like to go?");
        System.out.println("1. Library");
        System.out.println("2. Cafeteria");
        System.out.println("3. Lecture Hall");

        int choice = InputHelper.readInt("Enter choice: ");
        switch (choice) {
            case 1:
                return new Library();
            case 2:
                return new Cafeteria();
            case 3:
                return new LectureHall();
            default:
                return new Library();
        }
    }
}
