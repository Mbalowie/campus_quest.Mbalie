package locations;

import core.Student;

public class Library extends Location {
    @Override
    public String getName() {
        return "Library";
    }

    @Override
    public void interact(Student s) {
        System.out.println("You quietly read a book");
        // Reading costs some energy but increases knowledge
        s.decreaseEnergy(10);
        s.increaseKnowledge(5);
    }
}   
