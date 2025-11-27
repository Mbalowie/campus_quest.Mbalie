package locations;

import core.Student;

public class LectureHall extends Location {

    @Override
    public String getName() {
        return "Lecture Hall";
    }

    @Override
    public void interact(Student s) {
        System.out.println("You attend a lecture on Principles of programming languages");
        // TODO: maybe random event? say a test?
    }
}
