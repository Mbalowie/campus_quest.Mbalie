package events;

import core.Student;
import interfaces.GameAction;

public class QuizEvent implements GameAction {
    @Override
    public void perform(Student s) {
        System.out.println("Pop quiz in Lecture Hall!");
        // TODO: Students complete behaviour
    }
}