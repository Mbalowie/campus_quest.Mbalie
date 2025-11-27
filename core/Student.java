package core;

public class Student {
    private String name;
    private int energy = 100;
    private int knowledge = 0;

    public Student(String name) {
        this.name = name;
    }

    // TODO: add method decreaseEnergy(int amount)
    // TODO: add method increaseEnergy(int amount)
    // TODO: add method increaseKnowledge(int amount)
    // TODO: add method getKnowledge(int amount)

    public String getName() {
        return name;
    }

    public int getEnergy() {
        return energy;
    }

    public void setName(String newName) {
        name = newName;
    }
     public int getKnowledge() {
        return knowledge;

    public void increaseEnergy(int amount) {
        if (energy + amount > 100) {
            System.out.println("Warning: Energy cannot exceed 100.");
            energy = 100; // cap energy at 100
        }
        else {
            energy += amount;
        }
        System.out.println("Energy: " + energy);
    }
    public void decreaseEnergy(int amount) {
        if (energy - amount <= 0 ) {
            // energy = 0
            System.out.println(x: "Warning: Energy cannot go below 0.You're dead lol!");
        } else {
            energy -= amount;
            System.out.println("Energy: " + energy);
        }
    }
    public void increaseKnowledge(int amount) {
       knowledge = knowledge + amount;
       System.out.println("Knowledge: " + knowledge);
}
     }
    }

}