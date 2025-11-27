package events;

import core.Student;

public class RandomEncounter extends Event {

    @Override
    public void run(Student s) {
        System.out.println("Random event! A lecturer greets you warmly. Asks if you love anime.");
        // TODO: maybe add energy, reduce energy or add some random consequences
    }

    // TODO: implement perform method
}
