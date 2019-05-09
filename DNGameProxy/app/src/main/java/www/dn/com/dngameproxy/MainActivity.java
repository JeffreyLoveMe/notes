package www.dn.com.dngameproxy; // 包名

// 引用的包名/类名
import android.accounts.Account;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

// 类定义：
// 只有一个主类public class xxx
// xxx与源文件名称必须一致
// 如果没有public，文件名可以不与类名一致
public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }

    public void javaFunction() {
        // java具有面向对象、跨平台、安全、多线程
        // java版本-javaSE/javaEE/javaME
        // jvm -java虚拟机
        // 半编译、半解释型语言
        /*
        * java平台：
        * java虚拟机 -用程序仿真的假想计算机/依靠不同平台的JVM实现"一次编译，处处运行"
        * java API -java应用程序编程接口
        * */
        // xx.java -java源文件 --java编译器--> xx.class -字节码文件
        System.out.println("hello world");

        /*
        * 标识符：类名/变量名/方法名/类型名
        * 以字母/下划线/$开头
        * 不能把关键字/保留字作为标识符
        * java使用Unicode编码：所以支持使用汉字作为标识符
        * */

        /*
        * 关键字：boolean import...
        * 注释：//
        * java是强类型语言，java只有两种数据类型：引用数据类型/基本数据类型
        * */

        /*
        * 基本数据类型：byte8 short16 int32 long64 float32
        * double64 char16 boolean8
        * 常量（始终不变的量）""也是字符串常量/变量：基本存储单元、先声明在使用
        * 类变量系统自动init/局部变量必须init
        * */

        /*
        fix - 位运算符
        * 表达式：算术运算符、关系运算符、逻辑运算符、赋值运算符(类型不一致需要强制类型转换)、三木运算符、对象运算符instanceof
        * */

        /*
        * 数据类型转换
        * 隐式转换：必须类型兼容int->long
        * 强制类型转换
        * */
        byte a = 123;
        int i;
        double b = 234.43;
        System.out.println("byte型向int型自动转换");
        i = a;
        System.out.println("double型向int型强制类型转换");
        i = (int)b;

        /*
        * 选择语句：
        * if语句：永远只会执行一个或者不执行
        * switch语句：同上
        * */
        int m = 10;
        int j = 21;
        int k = 105;
        if (m == 10) {
            if (j < 20) {
                if (k > 100) {

                } else {

                }
            } else {

            }
        } else {

        }

        if (i == 10) {

        } else if (j > 20) {

        } else {

        }

        char grade = 'A';
        String message;
        switch (grade) {
            case 'A':
            case 'B':
            case 'C':
                message = "你的成绩及格";
                break;
            case 'D':
                message = "你的成绩不及格";
                break;
            default:
                message = "我也不知道你的成绩";
                break;  // 这里可以不加break
        }

        /*
        * 循环语句：
        * while语句
        * do...while语句
        * for循环
        * */
        // 直到表达式为fasle终止循环：可能一次都不执行
        int c = 90;
        while (c > 10) {
            c = c - 1;
            System.out.println(c);
        }

        // 直到表达式为fasle终止循环：默认执行一次
        do {
            c = c - 1;
            System.out.println(c);
            break;  // 从语句块跳出来：终止循环
        } while (c > 5);

        // 应用最广泛 - ;
        for (int temp = 0; temp < 10; temp++) {
            System.out.println(temp);
            continue;  // 必须用于循环体：终止本次循环、开始下次循环
//            break;  // 跳出语句块
//            return; // 没有返回值可以省略return
        }

        /*
        * 数组：相同数据类型的集合
        * java中数组元素：可以是数据类型、也可以是类对象
        * java数组必须用new分配内存空间、不能直接写[]
        * */
        int p[]; // 声明数组
        p = new int[5]; // 创建数组
        int e[] = new int[5]; //合并
        p[0] = 1; // 数组初始化
        int f[] = {0,1,2,3,4,5}; // 声明/创建/初始化

        /*
        * java的核心思想：面向对象
        * 仅仅支持单继承、多继承需要接口实现
        * private修饰的私有变量和方法不能继承
        * 父类构造方法不能被继承
        * */
//        System.gc();  // 显示的进行垃圾回收
        HourlyEmployee he = new HourlyEmployee();
        he.hours = 15.0;

        /*
        * 成员变量的隐藏：如果子类定义与父类相同的成员变量，父类成员变量需要隐藏
        * "就近原则"一致
        * 子类方法的重写：父类完全不存在、必须super显式调用
        * 重载/重写之间的区别？？？静态方法不能被重写
        * 向上转型：默认、安全的-父类引用指向子类对象
        * 向下转型：强制类型转换-子类引用指向父类对象
        * */
        Employee employee;  // 父类
        HourlyEmployee hourlyEmployee = new HourlyEmployee(); // 子类
        employee = hourlyEmployee; // 子类->父类/向上转型
        if (employee instanceof HourlyEmployee) { // 父类对象名 子类类名
            //
        }

        /*
        * static关键字：
        * 静态变量：static修饰的成员变量/类变量
        * 静态变量只在系统加载类进行一次空间分配和init、创建对象实例不再init、类名/
        * 对象名调用静态变量都是对这个共享空间的操作
        * */
        Account account = new Account("","");
        account.log();

        /*
        * 静态方法一般使用工具类、无法访问任何对象的对象成员、属于类本身
        * 静态访问不能访问非静态成员、所以不能访问this/super
        * */
//        // 静态语句块
//        static {
//
//        }

        /*
        * final修饰符：
        * final类：最终类、不能派生类
        * final变量： 最终变量、一旦初始化就不会再改变、常量
        * final成员方法：最终方法、可以继承、但不能重写
        * */
//        static final int MAX = 18;  // 常量

        /*
        * abstract关键字：抽象 -位于顶层
        * 抽象类：不能创建实例
        * */

        /*
        * 接口：静态常量+抽象方法 -类似iOS中delegate
        * 作用：java提供的一个用于实现多继承功能的机制
        * */
        /*
        * 当一个类实现的多个接口中有相同定义的方法时：
        * 1.方法的声明完全一样：实现一个方法即可；
        * 2.方法的参数列表不同：分别实现各自接口定义；
        * 3.参数列表一样，返回值不同：编译出错
        * */
        MainInterface m1; // 接口不是类：不能用new
        MainXi mainXi = new MainXi();
        m1 = mainXi; // 接口被实现：接口的引用可以直接/间接实现它的所有类对象
        m1.showInfo(); // 2.接口可以调用方法

        /*
        * 接口的扩展：
        * 弊端：可以直接在接口中添加方法，但是这样会影响到所有实现该接口的类
        * 解决办法：可以创建子接口，利用子接口实现扩展
        * */

        /*
        * 接口和抽象类的区别：
        * 1.接口利用interface声明、抽象类用abstract class声明
        * 2.接口中只有常量+方法/抽象类中成员变量+成员方法
        * 3.接口中方法必须是抽象方法/抽象类中方法可以是抽象方法，也可以是非抽象方法
        * 4.接口只能继承接口、不能继承类/抽象类可以继承一个类和多个接口
        * */

        /*
        * 包package
        * 定义：一组相关类和接口的集合、命名空间管理机制、访问权限控制机制
        * java中以包为单位：独立命名空间
        * 特征：同一个包中的类不能同名、不同包中的类可以同名
        * 包访问权限：默认访问权限/只有定义为public的类/接口才可以被包外访问
        * 包的声明：package xxx  // 一个类只属于一个包
        * */

        /*
        * 访问权限：
        * 私有类型 -private
        * 公有类型 -public
        * 默认类型 -没有任何修饰符
        * 保护类型 -protected
        * */
        // 类的访问权限：私有类型 -private/默认类型 -没有任何修饰符
        // 类成员的访问权限：4种

        /*
        * 内部类：声明在另一类内部、声明该内部类的类称为外部类
        * 内部类是外部类的一个类成员：既有类的属性/成员方法的属性
        * 内部类不能与外部类同名、内部类使用static修饰不能再访问外部类成员
        * 内部类可以访问外部类任意成员/包括私有成员
        * 非静态内部类：不能有静态成员/可以访问外部类的静态成员
        * 1.内部类的对象->外部类的成员变量
        * 2.可以在外部类中实例化一个内部类->调用它的成员
        * 3.内部类可以访问外部类任意成员
        * 4.*/

        /*
        * 匿名类：
        * */












    }

    // 类
    class MyStack {
        // 成员变量：私有
        private int data[];
        private int p;
        private int size;

        // 构造方法
        // 方法名与类名同名/没有返回值/不能由用户直接调用
        // 如果没有自定义构造方法：系统默认添加无参构造方法
        // 如果有自定义构造方法：系统默认不会添加无参构造方法
        public MyStack(int size) {
            // 为了方便this可以省略
            data = new int[5];
            p = 0;
            this.size = size; // 因为参数变量与成员变量同名：必须加上this
        }

        public MyStack(int size, int p) {
            this(size); // 先调用一个参数构造方法：this必须是第一句语句
            this.p = p;
            data = new int[5];
        }

        // 成员方法
        public void push(int d) {
           if (p < size) {
               data[p] = d;
               p++;
           }
        }
    }

    // 父类
    class Employee {
        // 成员变量
        String name, sex;
        // 无参构造
        public Employee() {

        }
        // 有参构造
        public Employee(String name, String sex) {
            this.name = name;
            this.sex = sex;
        }

        public void show() {
            System.out.println("这个工人的姓名："+this.name + ";这个工人的性别："+this.sex);
        }
    }

    //  子类
    class HourlyEmployee extends Employee {
        private double wageRate;
        private double hours;
        // 构造方法不能被继承
        public HourlyEmployee() {

        }
    }

    /// 例4.1
    class Account {
        private String AccountNumber;
        private String AccountName;
        private double balance;
//        static double interest = 0.1; // 年利率

        public Account(String number, String name) {
            AccountNumber = number;
            AccountName = name;
            balance = 0.0;
        }

        public void log() {
            System.out.println("");
        }
    }

    /*
    * 抽象类：不能被实例化、可以用super调用
    * 抽象方法：只有方法声明、没有方法体
    * 1.抽象方法必须在抽象类中
    * 2.抽象类可以没有抽象方法：禁止类实例化
    * 3.抽象类中的抽象方法必须在非抽象子类中实现
    * */
    abstract class User {
        String name, sex;

        public User() {

        }

        public User(String name, String sex) {
            this.name = name;
            this.sex = sex;
        }

        // 抽象方法在抽象类中不能被实现
        // 抽象类位于继承体系的顶层/成员变量和方法是所有子类共有的/不能定义为private
        public abstract void getDetails();
    }

    class xUser extends User {

        // 必须实现抽象方法
        @Override
        public void getDetails() {
            System.out.println("");
        }
    }

    /*
    * 接口只有两种权限：public/默认权限
    * 接口也可以继承
    * */
    // 1.定义接口
    public interface MainInterface {
         void showInfo();
    }

    // 遵循接口：一个类可以实现多个接口,所有方法都要实现
    // 抽象类可以实现接口：也不需要实现该接口下所有方法/但是该抽象类的非抽象子类必须实现
    class MainXi implements MainInterface {
        // 3.实现接口
        @Override
        public void showInfo() {
           System.out.println("xxx");
        }
    }

    // 外部类
    
}
