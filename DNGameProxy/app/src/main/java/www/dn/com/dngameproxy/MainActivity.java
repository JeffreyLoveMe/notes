package www.dn.com.dngameproxy; // 包名

// 引用的包名/类名
import android.accounts.Account;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Scanner;
import java.util.Vector;


// 类定义：
// 只有一个主类public class xxx
// xxx与源文件名称必须一致
// 如果没有public，文件名可以不与类名一致
public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Bundle bundle = this.getIntent().getExtras();
        System.out.println(bundle.get("age"));

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
        * 匿名类：没有类名的特殊内部类
        * */

        /*
        * Java API是java应用程序编程接口
        * */
        // 包装类：实现基本数据类型->对象
        /*
        * boolean/Boolean
        * char/Character
        * double/Double
        * float/Float
        * int/Integer
        * long/Long
        * */
        // Integer
        // 1.构造函数
        Integer integer = new Integer("123");
        Integer integer1 = new Integer(123);
        // 2.字符串->整数/整数类
        Integer.parseInt("123"); // 转换成整数
        Integer.valueOf("123"); // 转换成整数类
        // 3.整数-> 字符串
        Integer.toString(123); // 转化成字符串
        integer.intValue();  // 转换成整数返回

        // Double
        // 1.构造函数
        Double d = new Double(123);
        Double stringD = new Double("123");
        // 2.字符串->double
        double m2 = Double.parseDouble("123");
        // 3.浮点数->字符串
        String m3 = Double.toHexString(123);
        // 4.浮点数/字符串->Double
        Double m4 = Double.valueOf(123);
        Double m5 = Double.valueOf("123");
        // 5.Double->浮点数
        m5.doubleValue();

        // 常见Math
        double n1 = Math.E + Math.PI;  //java需要等号两边类型一致
        int n2 = Math.max(10,12);   // 最大值
        int n3 = Math.min(10,12);   // 最小值
        int n4 = Math.abs(-10);     // 绝对值

        // String类/StringBuffer类
        // java把字符串当作对象处理
        String s1 = new String();
        String s2 = new String("123");
        StringBuffer ms1 = new StringBuffer("123");
        String s3 = new String(ms1);
        String s4 = "hello world";
        char c1 = s1.charAt(1); // 返回字符串指定位置的字符
        // 如果超过字符串长度、会抛出异常
        s4.substring(1,4);  // 截断字符串：必须有开始位置、可以没有结束位置
        s4.indexOf('a'); // 指定字符在s4中第一次出现的位置、没有返回-1
        s4.indexOf("as"); // 指定字符串在s4中第一次出现的位置、没有返回-1
        // java中提供关于字符串的比较方法
        int sum = s1.compareTo(s2); // 返回int
        boolean isEquals = s1.equals(s2); // 区分大小写
        boolean isCast = s1.equalsIgnoreCase(s2); // 不区分大小写
        boolean isObject = s1 == s2; // 判断两个字符串是否指向同一个对象
        // 获取该字符长度
        for (int temp = 0; temp < s1.length(); temp++) {
            temp++;
            System.out.println(temp);
        }
        // 静态方法
        String s5 = String.valueOf(true);  // 把true转化成字符串
        String s6 = String.valueOf(123); //  把123转化成字符串
        s1.toLowerCase(); // 转换成小写字符串
        s2.toUpperCase(); // 转换成大写字符串
        s2.trim(); // 移除字符串首尾空格

        /// StringBuffer类
        // 用于创建可变字符串对象
        // StringBuffer类默认16个字符长度、如果不超过16位、则不需要分配新的
        // 超过16位，容量自动增大
        StringBuffer sb = new StringBuffer(); // 初始化16个字符长度的空对象
        StringBuffer sb1 = new StringBuffer(12); // 初始化12个字符长度的对象
        StringBuffer sb2 = new StringBuffer("xwj"); // 利用字符串创建对象
        sb1.length(); // 获取对象包含的有效字符个数
        sb1.capacity(); // 获取当前对象的容量
        sb1.setLength(12); // 修改对象的容量、如果当前对象有效位数>12,则多余部分被删除，负数会抛出异常
        // 增删改查
        // 增
        StringBuffer sb5 = new StringBuffer();
        sb5.append('5');
        sb5.append("xwj");
        /// 插入
        // 0 <= offset <= sb5.length()
        sb5.insert(1, "dnf");
        // 删除
        sb5.delete(1,3);
        // 替换
        sb5.replace(1,5,"xwj");
        // 逆序
        sb5.reverse();
        // StringBuffer -> String
        sb5.toString();

        // Scanner类
        // 具体怎么使用：还不会
        Scanner sc = new Scanner("file://xxx");

        // 日期类：Date
        // Data数据/Date日期
        // 默认模式：星期、月、日、小时、分、秒、年
        // 跟iOS一致
        Date nowDate = new Date(); // 获取当前日期/时间的Date对象
        Date longDate = new Date(1000); // 表示距离格林尼治标准时间1970年1月1日00:00:00的偏移量
        Boolean isBefore = nowDate.before(longDate); // 是否早
        Boolean isEqual = nowDate.equals(longDate); // 是否相等
        Boolean isAfter = nowDate.after(longDate);  // 是否晚
        // 自定义模式
        // iOS中：yyyy-MM-dd HH:mm:ss/hh:mm:ss z
        /*
        * G - 年代标识、公元前/公元后
        * y - 表示年
        * M - 表示年中的月份
        * w/W - 表示一年中的第几周
        * d/D - 表示一年中的第几天
        * F - 表示一月中的第几个星期几
        * E - 表示星期中的天数
        * a - 表示上午/下午
        * H - 表示一天中的小时数(00~23)
        * h - 表示am/pm中的小时数(01~12)
        * K - 表示am/pm中的小时数
        * k - 表示一天中的小时数(1~24)
        * m - 表示小时中的分钟数
        * s - 表示分钟数
        * S - 表示毫秒数
        * z - 表示时区
        * */
        SimpleDateFormat format = new SimpleDateFormat();
        try {
            Date date = format.parse("2009-11-19");
            format.format(date);
        } catch (Exception exception) {
            System.out.println(exception);
        };

        // 向量类
        // Java中的数组是不变的、对于可变数组、Java使用向量类
        // 只能存放引用/对象、不能存放基本数据类型
        Vector<String> vector = new Vector<>();
        Vector<String> stringVector = new Vector<>(10);

        vector.addElement("xwj");  // 增
        vector.insertElementAt("cfj", 1); // 如果试图在某个不存在的位置上插入一个元素、会抛出异常、查找
        vector.setElementAt("thh",1); // 位置不存在、抛出异常、改
        vector.removeElement("xwj"); // 删
        vector.removeElementAt(1);
        vector.removeAllElements();
        String obj = vector.elementAt(1); // 查找某个位置的obj
        vector.indexOf("xwj", 1); // 从index开始查找"xwj"、返回第一个、若没有、返回-1
        vector.firstElement();
        vector.lastElement();
        vector.elements(); // 返回Vector中所有的枚举对象
        // 向量类的大小
        // 1.存储向量中实际元素的个数
        // 2.向量的最大容量
        vector.trimToSize(); // 压缩向量容积、让1==2
        vector.setSize(10); // 设置向量大小：>向量中实际元素的个数\多余置于null、<向量中实际元素的个数向量类被截断
        vector.capacity(); // 向量类容量
        vector.size(); // 向量类大小

        // 枚举接口
        // 提取枚举对象包含的枚举元素的方法
        // 判断枚举对象中是否含有枚举元素的方法
        // 实现该接口的对象会产生一个枚举元素集合
        Enumeration<String> enumeration = new Enumeration<String>() {
            @Override
            public boolean hasMoreElements() {  // 判断Enumeration对象中是否含有元素
                return false;
            }

            @Override
            public String nextElement() {   // 返回Enumeration对象中的下一个元素
                return null;
            }
        };
        // 经典
        Enumeration<String> enumString = vector.elements();
        while (enumString.hasMoreElements()) {
            System.out.print(enumString.nextElement());
        }

        /// 异常处理
        // 加强程序的健壮性、面向对象的异常处理机制
        // 异常有两种：编译错误、运行时错误
        // 常见运行时异常：
        // 1.空指针异常NullPointerException-调用不存在的对象、没有初始化的对象
        // 2.索引越界异常IndexOutOfBoundException-数组下标越界、字符串下标越界
        // 3.类型转换异常ClassCastException-类型转换异常
        // 4.算数运算异常ArithmeticException
        // 处理异常的办法：1.捕获并处理异常、2.将方法中产生的异常抛出
        try {
            // 可能出现异常的代码
            // 如果发生异常、进入catch、不执行后续代码
            // 如果不发生异常、不会进入catch、继续执行后续代码
        } catch (NullPointerException e1) {
            // 捕获一个异常、进行异常处理
            e1.printStackTrace(); // 追踪异常事件发生时执行堆栈的内容
        } catch (Exception e1) {  // Exception一般作为最后一个catch
            // 捕获一个异常、进行异常处理
            // 多个catch的时候：异常范围必须从小到大
            // 如果只想知道程序是否出现异常、不在乎异常类型、可以直接使用Exception
            e1.printStackTrace();
        } finally {
            // 提供统一出口
            // 无论是否发生异常、都需要执行的代码
            // 最后只能有一个、也可以没有
            // 一般这里进行资源的释放工作：关闭打开文件、关闭打开数据库连接
        }
        //demo
        int[] x = {-1,0,1,2}; // 创建数组
        int y = 10;

        try {
            // 可以会发生异常的代码
            for (int index = 0;index<x.length;index++) {
                System.out.println("y = "+ y + "x = "+ x[index]);
                int divide = y / x[index];   // 计算y和数组元素的值
                System.out.println("divide = "+ divide);
            }
        } catch (NullPointerException exception) {
            exception.printStackTrace();  // 追踪异常事件发生时执行堆栈的内容
        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {
            System.out.println("这里一定会执行");
        }
        // 异常声明
        // 如果一个方法在执行时会发生异常或者调用某一个抛出异常的方法，但是该方法并没有进行异常处理、而是调用他的方法或方法栈来处理异常，这种方式叫做异常声明。
        try {
            this.exceptionDemo();
        } catch (NullPointerException exception) {
            exception.printStackTrace();
        } catch (NumberFormatException exception) {
            exception.printStackTrace();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        // 抛出异常
        // 为了使程序更容易检测并处理可能出现的错误，Java提供了一种面向对象的异常处理机制来处理程序运行时产生的异常

        // I/O流
        // Java提供功能完善的用于处理输入输出操作的包
        // 1.文件类：File代表一个文件、目录
        File file = new File("xxx"); // 通过路径创建文件
        File file1 = new File("/mybook","Sample");
        file.getName(); // 获取File对象表示的文件/目录名称
        file.getParent(); // 获取File对象表示的文件或父目录、没有父目录、返回null
        file.getPath(); // 获取文件/目录的路径名
        file.getAbsoluteFile();
        file.getAbsolutePath(); // 获取文件/目录的绝对路径名
        file.length(); // 获取文件/目录的大小、以字节为单位
        file.lastModified(); // 文件/目录最后一次修改的时间
        System.out.print(file.exists()); // 文件/目录是否存在
        System.out.print(file.isDirectory()); // 是否代表一个目录
        System.out.print(file.isFile()); // 是否是文件
        System.out.print(file.canRead()); // 是否可读性
        System.out.print(file.canWrite()); // 是否可写
        System.out.print(file.isHidden()); // 是否隐藏
        System.out.print(file.isAbsolute()); // 是否采用绝对路径
        file.mkdirs();
        file.delete();
        // 流：Java把不同类型的输入/输出抽象为流、用统一的接口来表示
        // 流：是一组有顺序、有起点和终点的数据集合、依据先进先出原则
        // 流：有方向的，输入流读数据/输出流写数据
        // 1.字节流
        // 2.字符流
        // 3.文件流
        // 4.缓冲流
        // 5.标准流
        // 6.管道流

        // 多线程
        // 程序是一段静态的代码、进程是程序的一次动态执行过程
        // 每个进程的内部数据和状态都是完全独立的、由OS调度
        // 线程是比进程更小的执行单位、线程是进程中可独立执行的子task
        // 进程之间是相互独立的、线程除了栈区是独立的、其他的不独立、所以线程切换很简单
        // 允许单个进程创建多个并行执行的线程来完成多个子任务
        MyThread thread = new MyThread(); // 创建多线程对象
        thread.start(); // 启动多线程
        thread.isAlive(); // 返回boolean、线程是否处于活动状态
        thread.setName("线程1"); // 设置线程名称
        String threadName = thread.getName();
        thread.setPriority(1000); // 设置线程优先级
        int priority = thread.getPriority();
        try {
            Thread.sleep(20); // 让多线程睡眠一段时间
            Thread.currentThread();  // 获取当前线程对象
            Thread.yield();  // 将CPU控制权移交到下一个可运行线程
            thread.interrupt(); // 中断线程对象所处状态
        } catch (Exception exception) {
            exception.printStackTrace();
        }

        // 线程2
        YourThread one = new YourThread();
        Thread t = new Thread(one);
        t.start();

        // Java网络编程
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
    class OuterClass {
        private int x;  // 定义一个私有变量
        int y;     // 定义一个默认变量

        void showInner() {
            System.out.println("我是外部类成员方法");
        }
        // 内部类
        class InnerClass {
            int y;   //  可以定义同名的成员属性

            void showOuter() {
                System.out.println("我是内部类成员方法");
            }
        }
    }

    // Double包装类
    // 主要掌握"包装类"/基础数据类型/字符串之间的转换
    // 所有包装类都是final类型、不能派生子类
    public class DoubleDemo {

    }

    // 异常声明
    // 只要方法声明了异常就需要调用他的方法处理异常
    int exceptionDemo() throws NullPointerException, NumberFormatException {
        return 2;
    }

    // 多线程1
    // 继承Thread
    // 直接继承Thread类代码简单、可以直接操作多线程、但是缺点很明显
    // 不能再继承其他类
    class MyThread extends Thread {
        // 重载run()方法
        @Override
        public void run() {
            super.run();
            // 执行多线程
        }
    }

    // 多线程2
    // 使用Runnable接口可以将Thread类与所要处理的任务的类分开、形成清晰的模型
    // 还可以继承其他类
    class YourThread implements Runnable {

        @Override
        public void run() {
            // 执行多线程代码
        }
    }
}
