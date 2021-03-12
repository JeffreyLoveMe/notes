package demo;

import java.util.Scanner;

public class GNGameDemo_01 {
    public static void main(String[] args) {
        Dog d = new Dog("红色", 4);
        System.out.println(d.getColor());
        d.eat();
        d.lookHome();

        simulationLogin();

        convertString();

        /*
        校验QQ号：
        1.长度必须是5-15位
        2.0不能开头
        3.必须是数字
        */
    }

    /*
    需求：模拟登录，三次机会，并提示还有几次
    用户名：admin / 密码：admin
    */
    public static void simulationLogin() {
        int count = 3;
        for (int i = 0; i < count; i++) {
            Scanner scanner = new Scanner(System.in);
            System.out.println("请输入账号");
            String userName = scanner.nextLine();
            System.out.println("请输入密码");
            String pwd = scanner.nextLine();
//            // 此处这样写如果userName或者pwd为null，则会异常
//            if (userName.equals("admin") && pwd.equals("admin")) {
//                System.out.println("登录成功");
//                break;
//            }
            // 推荐这样写
            if ("admin".equals(userName) && "admin".equals(pwd)) {
                System.out.println("登录成功");
                break;
            }
            System.out.println("账号或者密码错误，还剩" + (count - i - 1) + "次机会");
        }
    }

    /*
    需求：将一个字符串的首字母转换成大写，其他字母转换成小写
    */
    public static void convertString() {
        String s = "aSDFaxc";
        // 链式编程：每次调用方法以后返回当前对象就可以再次调用对象其他方法
        s.substring(0, 1).toUpperCase().concat(s.substring(1).toLowerCase());
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
