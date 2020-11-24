import java.util.Scanner; // 导入包中的类

public class GNGameProxy {
    /**
    * 计算机概述
    * 1.概念 - 全称"电子计算机"/俗称"电脑"，一种可以按照程序运行自动、高速处理海量数据的现代化智能电子设备
    * 2.组成 - 硬件（冯-诺伊曼体系结构/运算器&控制器（CPU）、存储器（内存、外存）、输入设备（鼠标、键盘）、输出设备（屏幕、打印机））和软件（系统软件（Mac OS/Unix/Windows/Linux等）、应用软件（微信/QQ等））
    * 3.表现形式 - 台式计算机、笔记本计算机、大型计算机
    * 4.应用 - 科学计算、数据处理、计算机辅助设计、人工智能、计算机网络
    * */

    /**
    * 软件开发
    * 1.软件 - 按照特定顺序组织的计算机数据和指令集合
    * 2.开发 - 软件的制作过程
    * 3.概念 - 借助开发工具与计算机语言制作软件
    * */

    /**
     * 计算机语言
     * 1.概念 - 人与计算机之间进行信息交流沟通的一种特殊语言
     * 2.机器语言 - 直接使用二进制代码指令表达的计算机语言
     * 3.汇编语言 - 使用特殊符号替代机器语言的计算机语言（计算机无法直接识别 - 需要翻译成机器语言）
     * 4.高级语言 - 使用"普通英文"进行编码的计算机语言（计算机无法直接识别 - 需要翻译成机器语言/高级语言包括C语言、C++、C#、Java）
     */

    /**
     * 人机交互
     * 1.命令行方式 - 需要在控制台输入特定的指令（操作麻烦）
     * 2.图形化界面 - 简单直观
     */

    /**
     * 快捷键
     * command+C/V/X/A/S/Z - 复制/粘贴/剪切/全选/保存/撤销
     */

    /**
     * DOS命令
     * d: + 回车 - 盘符切换
     * dir + 目录 - 列出当前目录下的文件和文件夹
     * cd + 目录 - 进入指定目录
     * md + 文件名称 - 创建目录
     * rd + 文件名称 - 删除目录
     * cd - 进入指定目录
     * exit - 退出DOS命令行
     * cls - 清屏
     * del - 删除文件
     */

    /**
     * java语言概述
     * 1.平台版本
     * 1>.javaSE标准版（为开发普通桌面和商务应用程序提供的解决方案）- 基础
     * 2>.javaME小型版（为开发电子消费产品和嵌入式设备提供的解决方案）- 安卓
     * 3>>javaEE企业版（为开发企业环境下的应用程序提供的一套解决方案）- 后台
     * 2.特点
     * 1>.面向对象
     * 2>.高性能
     * 3>.分布式处理
     * 4>.开源
     * 5>.跨平台
     * 3.跨平台
     * 1>.什么是跨平台 - 通过java语言编写的应用程序在不同的系统平台上都可以运行
     * 2>.原理 - 在运行java应用程序的OS上安装一个JVM，由JVM负责java应用程序在该系统中的运行
     * 3>.注意 - JVM不是跨平台
     * 4.JRE和JDK
     * 1>.JRE/java运行环境 - JVM + 类库/运行java程序
     * 2>.JDK/java开发工具包 - JRE + java开发工具包/开发java程序
     */

    /**
     * 配置环境变量path（记录可执行文件） - MacOS不需要配置/Win百度自行配置
     * 配置环境变量classpath（记录java类的运行文件） - jdk5.0以后classpath不需要配置
     */

    // 注释 - 用于解释说明程序的文字
    // 1>.单行注释 - 可以嵌套
    /*2>.多行注释 - 不可以嵌套*/
    /**
     * 3>.文档注释 - 不可以嵌套
     */
    // 4>.注释是一个程序猿必须要具备的编程习惯
    // 5>.初学者可以先写注释再写代码
    // 6>.注释可以帮助我们排查错误 - 初级排错方式/有一定效果

    /**
     * 关键字
     * 1>.概念 - 被java语言赋予特定含义的单词
     * 2>.特点 - 关键字全部小写/关键字不能做为标识符
     * 3>.保留关键字 - goto/const（保留关键字也不能做为标识符（！！！js中可以！！！））
     */

    /**
     * 标识符
     * 1>.概念 - 给类、接口、方法、变量起名字时候使用的字符序列
     * 2>.规则 - 只能包含数字、字母、_、$ ｜ 不能以数字开头 ｜ （保留）关键字不能做为标识符 ｜ 严格区分大小写
     */

    /**
     * 标识符命名细则
     * 1>.包（文件夹）- 一般域名（www.heima.com）倒过来/com.heima.utils｜全部小写
     * 2>.类/接口 - 每个单词首字母大写（驼峰命名）/DemoStudent
     * 3>.方法/变量 - 从第二个单词开始首字母大写/playGame
     * 4>.常量 - 所有字母大写，以'_'隔开/MAX_VALUE
     */

    /**
     * 主方法
     * @param args
     */
    public static void main(String[] args) { // 这是主方法（程序的入口）
        // 我的第一个程序
        System.out.println("我的第一个程序");

        /**
         * 常量的概述和使用
         * 1>.概述 - 在程序执行的过程中其值不可以发生改变
         * 2>.字面值常量（字符串常量 - 用""括起来、字符常量 - 用''括起来，只能放单个数字/字符、整数常量 - 所有整数、小数常量 - 所有小数、布尔常量 - true/false、空常量 - null）
         * 3>.自定义常量（面向对象再讲）
         */
        System.out.println("abc"); // 字符串常量
        System.out.println(123); // 整数常量
        System.out.println(12.3); // 小数常量
        System.out.println('A'); // 字符常量 - 对
//        System.out.println('10'); // 字符常量 - 错/''必须放单个字符/10不表示单个字符
//        System.out.println(''); // 字符常量 - 错/任何字符都不放也不行，因为无法代表任何字符
        System.out.println(' ');  // 字符常量 - 对/可以放空格
        System.out.println(true); // 布尔常量 - true/false

        /**
         * 进制转换
         * 1byte = 8bit（"1bit"相当于"一个二进制的数字0或1"）
         * 1K = 1024byte | 1M = 1024K | 1G = 1024M | 1T = 1024G
         * 任意进制 -> 十进制 / 十进制 -> 任意进制 - 除k取余法
         */
        System.out.println(0b100); // 二进制 - 0b
        System.out.println(0100); // 八进制 - 0
        System.out.println(100); // 十进制 - 默认
        System.out.println(0x100); // 十六进制 - 0x

        /**
         * 原码补码反码 - 参考iOS笔记
         */

        /**
         * 变量
         * 1.概念 - 在程序执行过程中可以发生改变的量
         * 2.定义格式 - 数据类型 变量名 = 变量值
         * 3.使用注意 - 1>.作用域：同一个区域不能使用相同的变量名、2>.局部变量在使用之前必须初始化
         */
        int a0 = 10;

        /**
         * 数据类型
         * 1.概念 - java语言是强类型语言，每个数据都有明确的数据类型，在内存中都分配了不同大小的内存空间
         * 2.分类 - 基本数据类型（整数型 - byte（1个字节）/short（2个字节）/int（4个字节）/long（8个字节） |
         浮点型 - float（4个字节）/double（8个字节） | 字符型 - char（两个字节） | 布尔型 - boolean（没有明确指定大小））、
         引用数据类型（面向对象阶段再讲）
         */
        // 整数型 - 默认为int
        byte a1 = 10; // 取值范围：-128 - 127
        short a2 = 20;
        int a3 = 15;
        long a4 = 8888888888888L; // 超过int范围 - 必须末尾加一个"l/L"表示这是一个long类型
        // 浮点型 - 默认为double
        float a5 = 12.3f; // ！！！必须末尾加一个"f/F"表示这是一个float类型！！！
        double a6 = 3.14;
        // 字符型
        char a7 = 'a'; // 没有负数
//        char a8 = '12'; // 不能放置两个字符
        // 布尔型 - 没有'非0即真'，不能与其它类型运算
        /**
         * 面试题 - 在Java中boolean类型占几个字节？
         * 在Java中boolean类型理论上占1/8个字节，因为一个开关就可以决定true和false，但是在java中没有明确指定boolean类型的大小
         */
        boolean a9 = true; // 没有明确指定大小

        // 隐式类型转换 - 自动类型转换（系统会自动将"小类型"->"大类型"，不会损失精度）/"大类型"->"小类型"可能会损失精度 - 报错
        // byte/short/char - int - long - float - double
        int a10 = 10;
        byte a11 = 4;
        a10 = a10 + a11;

        // 强制类型转换 - 数据类型 变量名 = (数据类型)变量值;
        // 1.强制转换的格式
        int a12 = 10;
        byte a13 = 4;
        a13 = (byte) (a12 + a13);
        // 2.强制转换超出"数据类型"的取值范围会出错
        byte a14 = (byte) (126 + 4);
        System.out.println(a14); // 输出-126（多于8位的会直接砍掉）
        byte a15 = (byte)300;
        System.out.println(a15); // 输出44
        // 3.面试题：以下程序是否有问题？如果有问题请指出问题。
        byte a16 = 3;
        byte a17 = 4;
//        // 1.byte与任何数据类型（char/int/short/byte）进行运算会提升为int，两个int类型相加结果也是int
//        // 2.a16和a17是两个变量，变量存储的值是变化的，在编译的时候无法判断具体的值，相加有可能会超出byte取值范围
//        byte a18 = a16 + a17; // 报错
        // Java编译器有常量优化机制
        byte a19 = 3 + 4;

        // 字符和字符串参与运算
        System.out.println('a' + 1); // 98 - 因为有ASCII码表, 'a'字符对应97
        System.out.println('a' + 1 + "hello"); // 98hello - 任何数据类型用"+"与字符串相连接都会产生新的字符串
        System.out.println("5 + 5 = " + 5 + 5); // 5 + 5 = 55;
        System.out.println("5 + 5 = " + (5 + 5)); // 5 + 5 = 10;

        // 字符char - 取值范围：0 ~ 65535
        char a20 = 'a';
        System.out.println(a20);
        char a21 = 97;
        System.out.println(a21);
        // Java使用Unicode编码，char可以存放2个字节
        // Java中的char可以存放中文：单个中文占2个字节
        char a22 = '中';
        System.out.println(a22);

        // 运算符 - 对常量和变量进行操作的符号
        // 1.算术运算符：+，-，*，/，%
        System.out.println(10 / 3); // 输出3 - 整数相除结果只能是整数
        System.out.println(10 / 3.0); // 输出3.33333 - 小数相除结果只能是小数（把其中一个数变成小数，另一个数会自动类型提升）
        System.out.println(-2 / 5); // 输出-2 - 当左边的绝对值小于右边绝对值的时候结果为左边的值/结果只与左边的符号有关，与右边无关
        // 2.自增自减运算符 - 自身永远都需要+1或-1
        int a23 = 13;
        a23 = a23++; // 13
        a23 = ++a23; // 14
        a23 = a23--; // 14
        a23 = ++a23; // 15
        /**
         * 面试题 - 哪句话会报错
         * byte b = 10;
         * b++; // '++'是一个运算符所以肯定会有一个结果，底层会转化为'b = (byte)(b + 1);'
         * b = b + 1; // 报错 - byte和int进行运算会自动类型提升为int，int再赋值给byte会报错
         */
        // 3.赋值运算符：+=，-=，*=，/=，=
        int a24 = 3;
        a24 += 4; // a24 = a24 + 4;
        a24 -= 4; // a24 = a24 - 4;
        a24 *= 4; // a24 = a24 * 4;
        a24 /= 4; // a24 = a24 / 4;
        /**
         * 面试题 - 下面程序是否有问题？
         * short s = 1; s = s + 1; // 报错 - short和int进行运算会自动类型提升为int，int再赋值给short会报错
         * short s = 1; s += 1; // short s = (short)(s + 1);
         */
        // 4.关系运算符：<，<，>=，<=，==，!=，
        System.out.println(4 != 3);
        // 5.逻辑运算符：&（逻辑与），|（逻辑或），^（异或 - 相同为false，不同为true），!（逻辑非），&&（短路与），||（短路或）
        int a25 = 15;
        System.out.println(a15 > 10 & a15 < 20);
        // 6.位运算符：操作二进制：补码参与运算
        // &（位与-有0则0），｜（位或-有1则1），^（异或-相同则0，不同则1），～（按位取反）
        System.out.println(6 & 3); // 2
        System.out.println(6 | 3); // 7
        System.out.println(6 ^ 3); // 5
        System.out.println(~6); // -7（按位取反，包括高位/操作的是补码，保存的是原码（6 - 原码 - 补码 - 按位取反 - 原码））
        System.out.println(5 ^ 10 ^ 10); // 5
        /**
         * 面试题：实现两个整数的交换
         * int x = 10;
         * int y = 5;
         * // 1.引入第三方变量（实际开发推荐使用）
         * int temp = x;
         * x = y;
         * y = temp;
         * // 2.不引入第三方变量（有弊端：有可能超出int的取值范围）
         * x = x + y;
         * y = x - y;
         * x = x - y;
         * // 3.不引入第三方变量
         * x = x ^ y;
         * y = x ^ y;
         * x = x ^ y;
         */
        // <<左移（左边最高位丢弃，右边补0），>>右移（最高位是0，左边补0；最高位是1，左边补1），>>>无符号右移（无论最高位是0或1，左边补0）
        System.out.println(12 << 1); // 24（向左移动几位就是乘以2的几次幂）
        System.out.println(12 << 2); // 48
        System.out.println(12 >> 1); // 6（向右移动几位就是除以2的几次幂）
        System.out.println(12 >> 2); // 3
        // 7.三目运算符
        int a26 = 10;
        int a27 = 5;
        int max = (a26 > a27) ? a26 : a27;

        // 键盘输入
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入第一个整数：");
        int x = scanner.nextInt();
        System.out.println("请输入第二个整数：");
        int y = scanner.nextInt();

        // if语句 - 判断区间使用
        // 1.判断条件必须是boolean
        // 2.如果是一条语言'{}'可以省略，如果是多条语句'{}'不能省略（建议永远不要省略）
        // 3.一般来讲，有"{"就没有分号
        if (x > 10) {
            // 语句体1
        }
        if (y < 10) {
            // 语句体1
        } else {
            // 语句体2
        }
        if (x > 10) {
            // 语句体1
        } else if (y < 10) {
            // 语句体2
        } else {
            // 语句体3
        }
        /**
         * 面试题 - 下面的代码是否有错误
         * if (x > 10) int z = 10; // 报错 - "int z = 10;"为两条语句
         */

        // switch语句 - 判断固定值使用（枚举）/理论上比"if语句"效率高
        // "表达式x + y"可以接收：基本数据类型（byte，short，char，int）/可以自动类型提升为int、枚举（JDK1.5）、字符串（JDK1.7）
        // 1.int
        switch (x + y) {
            // case后面只能是常量（必须不一样），不能是变量
            case 1: {
                System.out.println("123");
            }
            break;
            case 2: {
                System.out.println("456");
            }
            break;
            // case穿透
            case 3:
            case 4:
            case 5: {
                System.out.println("123456");
            }
            break;
            // default可以省略（不建议），可以放在任何位置（放在最后可以省略break）
            // 不管放在任何位置都只会最后执行
            default: {
                System.out.println("789");
            }
            break;
        }
        // 2.String
        String gender = "男士";
        switch (gender) {
            case "男士": {
                System.out.println("男士");
            }
            break;
            case "女生": {
                System.out.println("女生");
            }
            break;
            default: {
                System.out.println("太监");
            }
            break;
        }

        // 循环语句
        // 1.while语句 - 条件为true开始循环，条件为false终止循环
        int x1 = 100;
        while (x1 < 10) {
            // 循环体
            x1--;
        }
        // 2.do...while循环 - 条件为true开始循环，条件为false终止循环
        do {
            // 循环体
            x1--;
        } while (x1 < 10);
        // 3.forx循环
        for (int i = 0; i < 100; i++) {
            // 循环体 - i是局部变量
        }
        // 4.死循环
//        while (true) {
//
//        }
//        do {
//
//        } while (true);
//        for (;;) {
//
//        }
        // 5.循环嵌套
        // 外循环控制行数
        outer: // 标号：合法标识符即可
        for (int i = 0; i < 4; i++) {
            // 内循环控制列数
            inner: // 合法标识符即可
            for (int j = 0; j < 5; j++) {
//                System.out.println("*"); // 输出自动换行
                System.out.print("*"); // 输出不自动换行
//                break; // 终止循环 - 只可以使用于"循环语句"和"switch语言"
//                break inner; // 跳出内部循环（与break;效果一样）
//                break outer; // 跳出外部循环
//                continue; // 跳出本次循环，开始下次循环 - 只可以使用于"循环语句"
//                return; // 结束方法（返回值）
            }
            // 转义字符
            System.out.print("\n");
        }
        /**
         * 面试题 - 下面的代码是否能够执行?
         * System.out.println("hello world");
         * // 可以执行，因为"https:"是一个标号，"//www.baidu.com"是一个注释
         * https://www.baidu.com
         * System.out.println("hello java");
         */

        System.out.println("-----这是分割线-----");



    }



























































}
