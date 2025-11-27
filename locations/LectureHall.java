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
        s.decreaseEnergy(15);
        s.increaseKnowledge(10);
        
        // Random event: 30% chance of pop quiz
        if (Math.random() < 0.3) {
            System.out.println("Oh no! The lecturer announces a surprise pop quiz!");
            s.decreaseEnergy(10);
            s.increaseKnowledge(5);
        }
    }
}
