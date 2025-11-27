package core;

public class NPC extends Character {
    public NPC(String name) {
        super(name);
    }

    @Override
    public void speak() {
        System.out.println(name + ": Helle there! Nice day on campus.");
    }
}
