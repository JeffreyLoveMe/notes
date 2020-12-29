public class GNGameDemo {
    public static void main(String[] args) {
        Zi z = new Zi();
    }
}

class Fu {
    {
        System.out.println("父类构造代码块");
    }

    public Fu() {
        System.out.println("父类构造方法");
    }
}

class Zi extends Fu {
    {
        System.out.println("子类构造代码块");
    }

    public Zi() {
        System.out.println("子类构造方法");
    }
}
