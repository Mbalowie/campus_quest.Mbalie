package locations;

import core.Student;

public class Cafeteria extends Location {
    @Override
    public String getName() {
        return "Cafeteria";
    }

    @Override
    public void interact(Student s) {
        System.out.println("You buy a snack and feel refreshed.");
        // TODO: s.increaseEnergy(10)
    }
}
