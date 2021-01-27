package demo;

public class GNGameDemo_01 {
    public static void main(String[] args) {
        Dog d = new Dog("红色", 4);
        System.out.println(d.getColor());
        d.eat();
        d.lookHome();
    }
}

class Animal {
    private String color;
    private int count;

    public Animal() {

    }

    public Animal(String color, int count) {
        this.color = color;
        this.count = count;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getColor() {
        return color;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCount() {
        return count;
    }

    public void eat() {
        System.out.println("吃饭");
    }
}

class Dog extends Animal {

    public Dog() {

    }

    public Dog(String color, int count) {
        super(color, count);
    }

    public void lookHome() {
        System.out.println("看家");
    }
}

class cat extends Animal {
    public cat(String color, int count) {
        super(color, count);
    }

    public void catchMouse() {
        System.out.println("抓老鼠");
    }
}
