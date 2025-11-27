package events;

import core.Student;
import interfaces.GameAction;

public class StudyEvent implements GameAction {
    @Override
    public void perform(Student s) {
        System.out.println("You quietly revise your notes...");
        // TODO: increase knowledge stat in future version
    }
}
