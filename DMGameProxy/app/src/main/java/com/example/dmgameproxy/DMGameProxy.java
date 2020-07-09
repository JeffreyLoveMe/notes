package com.example.dmgameproxy;

import java.util.Scanner;

class DMGameProxy {
    /**
     * 1.java语言发展史
     * 1>.java之父 - James Gosling
     * 2>.分类 - java SE/java ME/java EE
     * 3>.特点 - 开源/跨平台/强类型语言
     * 4>.JRE - java运行环境
     * 5>.JDK - java开发工具包 = java开发工具 + JRE
     */

    /**
     * 2.JDK的安装和卸载
     * 1>.卸载 - 直接找到安装目录卸载
     * 2>.安装 - 进入www.oracle.com下载
     */

    /**
     * 3.java开发工具
     * 1>.Notepad - 记事本
     * 2>.Notepad++ - 简单编译工具
     * 3>.eclipse - IBM公司花费4000万美元利用java开发的IDE
     * 4>.MyEclipse - 付费IDE
     */

    // 单行注释
    /*
    多行注释
    */
    /**
     * 文档注释
     * @param xxx
     */

    /**
     * 4.关键字 - 被java赋予特殊含义的单词
     * 1>.goto/const是Java的保留关键字
     * 2>.关键字程序员不能使用
     */

    /**
     * 5.标识符 - 程序员自己在项目中起的名字/不能与关键字同名
     * 1>.由字母、数字、下划线、$组成/严格区分大小写、不能以数字开头/必须遵守
     * 2>.命名规范 - 有意义的名字/驼峰命名
     * 3>.包/文件夹 - cn.itcast.com/全部小写
     * 4>.类和接口 - HelloWorld/首字母大写、驼峰命名
     * 5>.方法和变量 - studyStudent/首字母小写、驼峰命名
     * 6>.常量 - GET_MAX/全部大写、下划线分割单词
     */
    public static void main(String[] args) {
        // 6.java输出语句
        System.out.println("我的第一个程序");

        // 7.常量 - 不能改变的量
        // 1>.字符串常量
        String a0 = "hello world";
        System.out.println(a0);
        // 2>.整数常量
        int a1 = 1;
        System.out.println(a1);
        // 3>.小数常量
        double a2 = 0.55;
        System.out.println(a2);
        // 4>.字符常量 - '只能存放单个数字/单个字母/单个符号'
        char a3 = 'h';
//        char a4 = '10';  // 不对
//        char a5 = 'ab'; // 不对
        System.out.println(a3);
        // 5>.布尔常量 - 只有true/false
        // true/false也是关键字
        boolean a6 = true;
        boolean a7 = false;
        System.out.println(a6 ? "YES" : "NO");
        System.out.println(a7 ? "YES" : "NO");
        // 6>.空常量
        a0 = null;
        System.out.println((a0 == null) ? "null" : "");

        /**
         8.进制转换
         1>.十进制：用0-9来表示所以的自然数
         int num = 14; // 默认是十进制
         2>.二进制：用0-1来表示所有的自然数 = 大于jdk1.7 - 0b/0B
         int num = 0b1110; // 前面加上0b
         3>.八进制：用0-7来表示所有的自然数
         int num = 016; // 前面加上0
         4>.十六进制：用0-F来表示所有的自然数
         int num = 0xF1; // 前面加上0x
         printf("%x", num);
         2>.为什么要引入二进制？
         因为计算机是以二进制形式进行数据存储：二进制存储简单方便
         3>.进制转换：
         大->小：除k取余法/底部是高位、上部是低位
         小到大：从低位起*k的n(n从0开始)次幂相加
         二进制<-->八进制/十六进制：有特殊技巧（3位1取/4位1取：高位不足可以补0）
         */
        // 1B(字节) = 8bit(比特) - 计算机最小存储单位是"字节"
        // 1K = 1024B
        // 1M = 1024K
        // 1G = 1024M
        // 1T = 1024G

        /**
         ！！！有时间可以操作一遍！！！
         9.原码/补码/反码 - 1表示负数，0表示正数
         1>.真值：一个数的十进制表示形式/机器数：一个数的二进制表示形式
         2>.原理：计算机内存是由大量开关组成的，分别用0和1来表示每一位开关（每一位成为1bit，每8位成为1字节/byte）
         1kb=1024byte   1Mb=1024kb   1Gb=1024Mb   1Tb=1024Gb/计算机分配内存的最小单位是字节/byte
         3>.原码：将一个数的真值的绝对值转为二进制，存储的八位内存空间，最高位存储符号位，1表示负数，0表示正数，其余7位用来存储真值的绝对值的二进制表示形式
         结论：计算机不以原码的方式进行数据存储，原码会出现计算错误
         4>.反码：正数的反码是原码，负数的反码是原码符号位不变，其余位数按位取反（0变1，1变0）反码的反码是原码
         结论：计算机不以反码的方式进行数据存储，反码解决不了0的问题
         5>.补码：正数的补码是原码，负数的补码是反码加1，补码的补码是原码
         结论：计算机是以补码的形式进行存储/计算机只会做"加法运算"
         //正数三码合一
         真值      原码      反码       补码
         1        00000001  00000001  00000001
         -1       10000001  11111110  11111111
         */

        // 10.数据类型 - java是强类型语言
        /// 1>.基本数据类型
        // 数值型 - 整数类型byte - 1个字节/short - 2个字节/int - 4个字节（默认类型）/long - 8个字节
        // ？？？怎么计算的？？？- byte的取值范围'-128 - 127'
        byte b1 = 127;
        System.out.println(b1);
        short b2 = 1000;
        System.out.println(b2);
        int b3 = 10000;
        System.out.println(b3);
//        // 报错 - Integer number too large/'123456789123456789'已经超过int取值范围
//        long b4 = 123456789123456789;
        // 告诉编译器'123456789123456789'是一个long
        // 切记 - 'L'可以大写也可以小写/尽量使用大写因为小写会与'1'混淆
        long b4 = 123456789123456789L;
        System.out.println(b4);

        // 数值型 - 浮点类型float - 单精度/4个字节/double - 双精度/8个字节（默认类型）
//        // 报错 - 因为float是单精度，'12.3'默认是double，不能直接赋值
//        float b5 = 12.3;
        // 同上 - 这里跟'F'/'f'都可以，因为不会混淆
        float b5 = 12.3f;
        System.out.println(b5);
        // 'd'可以省略也可以不省略
        // 同上 - 可以大写可以小写
        double b6 = 123.57d;
        System.out.println(b6);
        double b7 = 123.45;
        System.out.println(b7);

        // 字符型 - char - 2个字节/ASCII码表
        // char的取值范围'0 - 65535'
        char b8 = 's';
        System.out.println(b8);
//        // ''只能放'单个字符'
//        char b9 = '10';
        // 字符是否可以存放中文？- 可以，因为java是unicode编码（char类型占两个字节，中文也占两个字节）
        char b10 = '谢';
        System.out.println(b10);

        // 布尔类型 - boolean/Java中布尔类型没有明确指定大小/不能与其他类型相互运算（！！！C语言布尔类型能与其他类型相互运算！！！）
        boolean b11 = true;
        if (b11) {
            System.out.println("true");
        }
        /**
         * 注意点：
         * 1.在定义long/float类型变量的时候需要加上L/f
         * 2.整数默认类型是int/浮点数默认类型是double
         * 3.byte/short在定义的时候接收的实际上是一个int类型（如果不在它们的范围就会报错）
         * 4.关于自动类型提升 - byte/short/char -> int -> long -> float -> double
         *
         */
        /// 2>.引用数据类型
        // 类 - class
        // 接口 - interface
        // 数组 - []

        // 11.变量 - 可以改变的量
        // 1>.作用域 - xxx
        // 1.声明的同时赋值
        int c1 = 10;
        c1 = 20;
        System.out.println(c1);
        // 2.声明之后再赋值
        int c2;
        c2 = 10;
        // 变量在使用之前必须赋值
        System.out.println(c2);
        // 3.一条语言可以声明无数个变量/使用变量之前赋值即可
        int c3, c4, c5;
        c3 = 10;
        c4 = 20;
        c5 = 30;
        System.out.println(c3);
        System.out.println(c4);
        System.out.println(c5);

        // 12.类型转换
        int d1 = 100;
        byte d2 = 50;
        // 1>.自动类型提升 - 隐式转换
        // byte -> int/小类型自动提升到大类型
        d1 = d1 + d2;
        System.out.println(d1);
        // int不能直接赋值给byte
        // 计算机运算都是以'补码'的形式进行
        /**
         * int类型占4个字节 - 在内存中如果位数不够需要在前面补0
         * 123 - 00000000/00000000/00000000/01111011
         * 如果转成byte类型占1个字节 - 在内存中会将前面的0去掉///01111011
         */
        // 2>.强制类型转换 - 可能会损失精度
        d2 = (byte) (d1 + d2);
        System.out.println(d2);
        // 3>.面试题
        // 声明为byte类型
        byte e1, e2, e3;
        // byte -> int
        e1 = 3;
        // byte -> int
        e2 = 4;
//        // 报错 - byte = int + int
//        e3 = e1 + e2;
        // byte -> int
        // 常量优化机制 - 编译的时候直接将常量相加的结果算出来赋值/等同于'e3 = 7';
        e3 = 3 + 4;
        System.out.println(e1);
        System.out.println(e2);
        System.out.println(e3);

        // 13.运算符
        // 1>.自增自减运算符
        int f1 = 4;
        int f2 = f1++;
        int f3 = ++f1;
        // 6 - 自身不管怎么样都会'+1/-1'
        System.out.println(f1);
        // 4 - 直接赋值
        System.out.println(f2);
        // 5 - '+1'再赋值
        System.out.println(f3);
        /*
        ！！！必须要注意！！！
        // 先算(f2 + f3)
        // 再算(f2 * 10)
        f1 = (f2 + f3) + (f2 * 10);
        */
        // 2>.赋值运算符 - 左边必须是变量
        // 通常我们认为：f4等于10
        // 实际上应该是：10赋值给f4
        // "f4和10"之间不是完全的相同
        int f4 = 10;
        f4 += 10; // 等价于f4 = f4 + 10;
        f4 -= 10; // 等价于f4 = f4 - 10;
        f4 *= 10; // 等价于f4 = f4 * 10;
        f4 /= 10; // 等价于f4 = f4 / 10;
        System.out.println(f4);
        /*
        面试题
        short s = 1;
        s = s + 1; // 报错 - 's为short类型'与'1(整数默认为int类型)'相加默认会提升为int类型，再赋值给short类型会报错
        s += 1;  // 不会报错 - 默认加了一个强制转换符/s = (short)s + 1;
        */
        // 3>.关系运算符 - 结果只有两种可能true/false
        // '=='/'='的区别 - '=='关系运算符/'='赋值运算符
        // 4>.逻辑运算符 - 连接关系运算符、结果只有两种可能true/false
        /*
        // 都是按位运算 - 先转换成二进制，1代表真，0代表假
        '& - 逻辑与' - 左右两边只有都为真，结果才为真
        '｜ - 逻辑或' - 左右两边只要有一个为真，结果就为真
        '! - 逻辑非' - xxx
        '^ - 逻辑异或' - 左右两边只要相同，结果就为假
        */
        /*
        '& - 逻辑与'和'&& - 短路与'的区别
        '& - 逻辑与' - 如果左边已经确定结果，右边继续需要参与运算
        '&& - 短路与' - 如果左边已经确定结果，右边不需要参与运算
        ！！！'| - 逻辑或'和'|| - 短路或'以上同理！！！
        */
        /*
        面试题 - 交换两个变量的值：
        1.允许引入第三方变量
        int temp;
        temp = x;
        x = y;
        y = temp;
        2.不允许引入第三方变量
//        x = x + y;
//        y = x - y;
//        x = x - y;
        // 一个数被另一个数异或2次等于这个数本身
        x = x ^ y;
        y = x ^ y;
        x = x ^ y;
        */
        // 5>.位运算符 - ➡️指向哪一边就向哪一边移动
        System.out.println(-6 >> 1); // 有符号右移 - 向右边移动几次就是除以2的几次幂
        System.out.println(6 << 1);  // 有符号左移 - 向左移动几次就是乘以2的几次幂
        /*
        '有符号右移>>'和'无符号右移>>>'的区别
        '有符号右移>>' - 无论高位是0还是1，移动后都用0补位
        '无符号右移>>>' - 最高位是0移动后就用0补位，最高位是1移动后就用1补位
         */
        /*
        面试题 - 请使用最有效率的方式写出'2 * 8'的结果
        1.分析 - 最有效的方法就是'操作二进制（位运算）'
        2 * 8 = 2 << 3 = 16;
        */
        // 6>.三元运算符 - 可以嵌套但是不建议这样写
        // (表达式) ? 结果1 : 结果2

        // 14.键盘录入数据
        // 自动导入库/import java.util.Scanner;
        Scanner scanner = new Scanner(System.in); // 创建对象
        int g1 = scanner.nextInt();  // 输入一个整数
        System.out.println(g1);

        // 15.顺序语句

        // 16.if...else选择语句
        int age = 19;
        // 第一种方式
        if (age > 18) {
            System.out.println("可以浏览该网站");
        }
        // 第二种方式
        if (age > 18) {
            System.out.println("可以浏览该网站");
        } else {
            System.out.println("不可以浏览该网站");
        }
        // 第三种方式
        if (age > 200) {

        } else if (age > 100) {

        } else {

        }
        // 1>.如果只有一条语句体可以省略{} - 不建议这样写
        if (age > 18) System.out.println("可以浏览该网站");
//        // 报错 - 因为'int x = 1;'默认不是一条语句
//        if (age > 18) int x = 1;
        // 2>.if支持嵌套
        if (age > 20) {
            if (age > 10) {

            } else {

            }
        }

        // 17.switch选择语句
        // 1.可以是byte/short/char/int(可以自动类型提升为int类型的数据可以) - long不可以作为switch的表达式
        // 2.>=jdk1.5可以接收枚举
        // 3.>=jdk1.7可以接收字符串String
        // 4.每个case不能相同
        String name = "XWJ";
        switch (name) {
            case "XWJ": {
                System.out.println("XWJ");
                // ！！！如果'语句1/语句2/语句3'内容一致IDE会报警告！！！
                switch (age) {
                    case 1:
                    case 2:
                    case 3: {
                        // 语句1
                        System.out.println("随便玩");
                    }
                    // 跳出switch语句
                    // 不能'省略break'不然会发生'case穿透'
                    break;
                    case 4:
                    case 5:
                    case 6: {
                        // 语句2
                        System.out.println("幼儿园");
                    }
                    break;
                    // default可以写在任何位置，但是还是会最后执行
                    default: {
                        // 语句3
                    }
                    break;
                }
            }
            break;
            case "CFJ": {
                System.out.println("CFJ");
            }
            default: {
                System.out.println("NO");
            }
            break;
        }

        // 18.循环语句
        // 1>.for循环 - 条件为真开始循环
        for (int index = 0; index <= 10; index++) {
            System.out.println("hello world");
        }
        // 2>.while语句
        int h1 = 0;  // 初始化语句
        while (h1 <= 10) { // 条件语句 - 条件为真开始循环
            System.out.println("hello world");
            h1++; // 控制语句
        }
        // 3>.do...while语句
        do {
            System.out.println("hello world");
            h1++; // 控制语句
        } while (h1 <= 10); // 条件语句 - 条件为真开始循环
//        // 4>.死循环
//        while (true) {
//
//        }
//        // ！！！java对于永远无法执行到的语句会报错！！！
//        for (;;) {
//
//        }
        // 5>.循环嵌套
        // 外层循环 - 决定行数
        for (int i = 0; i < 5; i++) {
            // 内层循环 - 决定列数
            // i = 0/1/2/3/4分别会执行一次该循环
            for (int j = 0; j < 4; j++) {
                // 打印自动换行
                System.out.println("*");
                // 打印不会自动换行
                System.out.print("*");
                // 跳出循环
                break;
            }
            if (i == 4) {
                // 用于返回并结束方法
                return;
            }
            // 终止本次循环，继续下次循环
            continue;
        }
        // 标号':' - 合法的标识符/可以跳出指定的循环
        a: for (int i = 0; i < 5; i++) {
            b: for (int j = 0; j < 4; j++) {
                if (j == 3) {
                    // 跳出外层循环 - 可以用于'循环语句'和'switch语句'
                    break a;
                }
                // 跳出内层循环 - 只能用于'循环语句'
                break b;
            }
        }
        // 面试题
        System.out.println("hello world");
        http://www.baidu.com    // "http:"表示一个标号 / "//www.baidu.com"代表注释
        System.out.println("大家好"); // 最终输出"hello world"/"大家好"，不会访问百度

        // 20.一维数组 - 存储同一种数据类型多个元素的集合
        // 1>.数组定义 - 有两种定义方式（此处定义完成数组中是没有元素的）
        // 数据类型[] 数组名 - 推荐使用
        int[] mList;
        // 数据类型 数组名[]
        String sList[];
        // 2>.数组初始化 - 为数组中的元素分配内存空间，并为数组每个元素赋值
        // 一、java中的数组必须先初始化才可以使用
        // 二、动态初始化 - 只指定数组长度，由系统为数组分配初始值
        // new - 关键字/用于创建对象
        // 5 - 代表数组长度
        int[] array1 = new int[5];
        array1[0] = 1;
        array1[1] = 2;
        array1[2] = 3;
        array1[3] = 4;
        array1[4] = 5;
//        array1[5] = 6; // 报错 - 数组越界
        // 三、静态初始化 - 指定每个数组元素的初始化值，根据"值的个数"决定数组长度
        // 不用指定数组长度/数组长度 == 3
        int[] array2 = new int[]{1, 2, 3};
//        // 数组越界异常 - java.lang.ArrayIndexOutOfBoundsException
//        System.out.println(array1[4]);
//        // 空指针异常 - java.lang.NullPointerException
//        array1 = null;
//        System.out.println(array1[0]);
        int[] array3 = {1, 2, 3};
        /*
        int[] list;
        list = new int[]{1, 2, 4}; // 可以
        list = {1, 2, 3}; // 报错
         */
        /*
        1.动态初始化 - 在内存中开辟连续的5个空间
        2.内存分区
        堆 - 存放对象（每new一次就会在堆中新增一个新的对象/不会覆盖以前的对象）
        栈 - 存储局部变量（定义在'方法上/形参'和'方法中'的变量）
        方法区/代码区 - xxx.class(源代码)首先加载到方法区（只会加载一次）
        本地方法区 - xxx
        寄存器 - xxx
        */
        // 当没有'任何引用'指向'堆内存的对象'的时候该对象变成垃圾，'jvm的垃圾回收机制'会在不定时对其进行回收
        int[] array4 = new int[5];
        // 3>.数组的遍历
        int[] array5 = new int[]{1, 2, 3, 4, 5};
        // 第一种方式
        // array5.length - 数组长度
        for (int i = 0; i < array5.length; i++) {
            System.out.println(array5[i]);
        }
        // 第二种方式
        for (int bean:
             array5) {
            System.out.println(bean);
        }

        // 21.二维数组
        /*
        5 - 5个一维数组
        3 - 每个一维数组中有三个元素
         */
        int[][] arrayList1 = new int[5][3]; // 推荐写法
        System.out.println(arrayList1[0]); // 代表二维数组中第一个一维数组
        System.out.println(arrayList1[1][2]); // 代表二维数组中第二个一维数组第三个元素
        int[][] arrayList2 = {{1, 2, 3}, {1, 2, 3}, {1, 2, 3}}; // 简写
        int[] arrayList3[] = new int[5][5]; // 不推荐写法

        // java中到底是'传数值'还是'传指针'
        // 1>.在java中'基本数据类型传数值'，'引用数据类型传指针'
        // 2>.在java中'传数值'（因为指针也是值）

        // 创建对象
        Person p = new Person();  // 创建对象
        p.name = "谢吴军";        // 属性赋值
        p.age = 18;
        p.speak(20);         // 调用方法
        // 方法入参是对象
        DMGameProxy d = new DMGameProxy();
        p.run(d);
    }

    // 19.方法
    /*
    1>.方法格式
    // 修饰符 - public/protected/private/static
    // 返回值类型 - 数据类型
    // 方法名 - 标识符
    // 参数类型 - 数据类型
    // 参数名1 - 标识符
    // 函数体 - java语句
    // 返回值 - 与"返回值类型"保持一致
    修饰符 返回值类型 方法名(参数类型 参数名1, 参数类型 参数名2...) {
        // 函数体
        return 返回值;
    }
    */
    // 方法必须调用才会执行
    // java不支持嵌套定义
    public static void sendMsg(int phoneNum, String name) {
        sum(1, 2);
    }
    // 2>.方法重载 - java允许方法名称相同，参数列表不同/只看参数列表，不看返回值类型
    public static int sum(int a, int b) {
        return  a + b;
    }
    // 参数个数不同
    public static int sum(int a, int b, int c) {
        return a + b + c;
    }
    // 参数类型不同
    public static double sum(int a, int b, double c) {
        return a + b + c;
    }
}

// 22.面向对象
class Person {
    // 对象入堆 - 成员变量属于对象
    String name;  // 定义在类中、方法外 - 成员变量/存在于堆中/有默认值/随着对象的创建而创建，随着对象的消失而消失
    int age;

    // 方法入栈 - 局部变量属于方法
    public void speak(int x) {  // 定义在方法上 - 局部变量/存在于栈中/没有默认值，使用之前必须赋值/随着方法的调用而存在，随着方法的调用完毕而消失
        int y = 0;              // 定义在方法内 - 局部变量/存在于栈中/没有默认值，使用之前必须赋值/随着方法的调用而存在，随着方法的调用完毕而消失
        int age = 12;           // 成员变量和局部变量可以同名 - 就近原则

        System.out.println(name + "今年" + age + "岁");
        System.out.println(age);  // 输出12
    }

    public void run(DMGameProxy d) {
        System.out.println("run");
    }
}




















