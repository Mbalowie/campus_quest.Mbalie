package core;

// Base class for NPC
public abstract class Character {
    protected String name;

    public Character(String name) {
        this.name = name;
    }

    public abstract void speak();
}
