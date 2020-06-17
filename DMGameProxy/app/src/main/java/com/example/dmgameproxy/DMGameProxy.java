package com.example.dmgameproxy;

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
         int num = 0b1110; // 前面加上0b/
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
         真值      原码      反码      补码
         1        00000001  00000001 00000001
         -1       10000001  11111110 11111111
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
        /// 2>.引用数据类型
        // 类 - class
        // 接口 - interface
        // 数组 - []





        // 变量 - 可以改变的量
































    }
}
