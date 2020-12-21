import java.util.Scanner; // 导入包中的类
// 测试类 - 包含主函数、"测试类的类名"必须与"当前文件名"一致
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
     * @author xiewujun
     * @version v1.0
     * @param array（形式参数的变量名称）
     * @return 函数运行完成返回的数据
     */
    // javadoc -d api -version -author -ArrayTool.java
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

    /*
    主方法
    public - 被JVM调用，权限需要足够大
    static - 被JVM调用，不需要创建对象
    void - 被JVM调用，不需要任何的返回值
    main - 默认规定的（只有这样写才能被JVM识别）
    String[] args - 接收键盘录入的数据
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

        sum(10, 20);

        // 数组
        // 1.为什么需要数组 - 可以存储相同数据类型的集合（这点与js不一样）
        // 2.数组（引用数据类型）可以存储基本数据类型、也可以存储引用数据类型（这点与Objective-C不一样）
        // 3.一维数组
        /*
        格式：数据类型[] 数组名 = new 数据类型[数组长度];
        // 左边
        int - 数据类型
        [] - 几个[]就代表是几维数组
        array_00 - 数组名（标识符）
        // 右边
        new - 关键字
        int - 数据类型
        [5] - [数组长度]
        */
        // oc的数组"@[]"
        int[] array_00 = new int[5];
        int array_000[] = new int[5];
        // 4.数组的初始化 - 为数组开辟连续的内存空间，并为每个元素赋值
        // 1>.动态初始化 - 指定长度，由系统给出初始化值
        // 整数类型（byte/short/int/long）默认为0 | 浮点类型（float/double）默认为0.0 | 布尔类型（boolean）默认为false | 字符类型（char）默认为'\u0000' | 引用类型默认为null
        int[] array_01 = new int[5];
        System.out.println("array_01[0] = " + array_01[0]);
        System.out.println("array_01[1] = " + array_01[1]);
        System.out.println("array_01[2] = " + array_01[2]);
        System.out.println("array_01[3] = " + array_01[3]);
        System.out.println("array_01[4] = " + array_01[4]);
        System.out.println(array_01);
        // 2>.静态初始化 - 给出初始化值，由系统指定长度
        // 第一种方法：可以先声明再赋值
        // ！！！第二个[]不允许有数字！！！
        int[] array_02 = new int[]{1, 2, 3, 4, 5};
        // 第二种方法：必须声明并赋值
        int[] array_03 = {1, 2, 3, 4, 5};
        // 5.异常
//        // 1>.java.lang.ArrayIndexOutOfBoundsException数组索引越界异常（访问了数组中不存在的索引）
//        System.out.println(array_03[10]);
//        // 2>.java.lang.NullPointerException空指针异常（数组已经不再指向堆内存，还继续使用数组名访问元素）
//        // oc没有空指针异常
//        array_03 = null;
//        System.out.println(array_03[0]);
        // 6.遍历
        // 数组的最大索引：array_04.length - 1
        int[] array_04 = {1, 2, 3, 4, 5};
        for (int i = 0; i < array_04.length; i++) {
            System.out.println(array_04[i]);
        }
        for (int element: array_04) {
            System.out.println(element);
        }
        // 多个引用指向同一块内存
        array_04 = array_03;
        // 7.二维数组
        // 1>.概述
        // [3] - 二维数组中有3个一维数组
        // [2] - 一维数组中有2个元素
        int[][] array_05 = new int[3][2]; // 推荐使用
        int[] array_005[] = new int[3][2];
        int array_0005[][] = new int[3][2];
        System.out.println(array_05); // 二维数组
        System.out.println(array_05[0]); // 二维数组红的第一个一维数组
        System.out.println(array_05[0][0]); // 二维数组中的第一个一维数组的第一个元素
        // 初始化 - 这是一个二维数组
        int[][] array_06 = {{1, 2, 3}, {4, 5}, {6, 7, 8}};
        // 2>.遍历
        for (int i = 0; i < array_06.length; i++) {
            for (int j = 0; j < array_06[i].length; j++) {
                System.out.println(array_06[i][j]);
            }
        }

        // java中的内存分配
        // 1.内存空间划分
        // 栈 - 存储"局部变量（定义在方法声明和方法中的变量）"
        // 堆 - 存储"new出来的数组和对象"
        // 方法区（代码区/静态区） - 存储源代码
        // 本地方法区 - 与系统有关
        // 寄存器 - 给cpu使用
        // 2.内存图解
        // 1>.图解一个数组
//        // main方法压栈（"局部变量array"在方法中）
//        public static void main(String[] args) {
//            // 遇到new在堆中开辟连续的内存空间（0x0011）
//            // 将"内存空间地址0x0011"赋值给"局部变量array"
//            int[] array = new int[5];
//            // 修改堆中相关数值 - 栈中的"局部变量array"指向堆
//            array[0] = 10;
//            array[1] = 20;
//        }
        // 2>.图解两个数组
//        // main方法压栈（"局部变量array"在方法中）
//        public static void main(String[] args) {
//            // 遇到new在堆中开辟连续的内存空间（0x0011）
//            // 将"内存空间地址0x0011"赋值给"局部变量array"
//            int[] array = new int[5];
//            // 修改堆中相关数值 - 栈中的"局部变量array"指向堆
//            array[0] = 10;
//            array[1] = 20;
//
//            System.out.println(array);
//            System.out.println(array[0]);
//            System.out.println(array[1]);
//
//            System.out.println("-----------------------------------");
//
//            // 遇到new在堆中开辟连续的内存空间（0x0012）
//            // 将"内存空间地址0x0012"赋值给"局部变量newArray"
//            int[] newArray = new int[5];
//            // 修改堆中相关数值 - 栈中的"局部变量newArray"指向堆
//            newArray[0] = 10;
//            newArray[1] = 20;
//
//            System.out.println(newArray);
//            System.out.println(newArray[0]);
//            System.out.println(newArray[1]);
//        }
        // 3.图解二维数组
//        // main方法压栈（"局部变量array"在方法中）
//        public static void main(String[] args) {
//            // 遇到new在堆中开辟连续的内存空间（0x0011）- 存放3个一维数组地址（默认为null）
//            // 遇到new在堆中开辟连续的内存空间（0x0012）- 存放一维数组元素的地址
//            // 0x0011指向0x0012
//            int[][] array = new int[3][2];
//
//            // 栈中的"局部变量newArray"指向堆
//            System.out.println(array); // 打印二维数组
//            System.out.println(array[0]); // 打印二维数组中第一个一维数组
//            System.out.println(array[0][0]); // 打印二维数组中第一个一维数组的第一个元素
//        }

        // Java代码规范
        // 1.类名、接口名 - 一个单词首字母大写，多个单词每个首字母大写
        // 2.方法名、变量名 - 一个单词全部小写，多个单词从第二个单词首字母大写（驼峰命名法）
        // 3.'{}'成对出现，'{'在该行代码的最后，'}'在该行代码的后面
        // 4.'{'前面有空格
        // 5.语句块、方法中间加空格

        // 面向对象
        // 1.学习编程的目的 - 用计算机语言描述日常生活中实物
        // 2.面向对象的三大特性
        // 1>.封装
        // 一、概念 - 隐藏对象的属性和实现细节，仅对外提供公共访问方式
        // 二、好处 - 1、提高代码复用性/2、提高安全性
        // 三、原则 - 1、将不需要对外的内容隐藏起来/2、隐藏属性，仅提供公共对外访问方式
        // 2>.继承
        // 3>.多态
        // 3.定义类
        Phone p = new Phone(); // 创建对象的时候默认会调用构造方法
        p.brand = "苹果";
        p.price = 7999;
        p.call();
        p.sendMessage();
        p.playGame();
        // 4.成员变量和局部变量的区别
        // 成员变量 - 定义在"类中方法外"/位于堆内存/随着对象的创建而存在，随着对象的销毁而消失/有默认初始化值
        // 局部变量 - 定义在"方法上&方法内"/位于栈内存/随着方法的调用而存在，随着方法的调用完毕而消失/没有初始化值（必须先定义赋值才能使用）
        // 5.匿名对象
        new Phone().price = 123; // 匿名对象可以调用属性，没有意义
        new Phone().call(); // 匿名对象可以调用方法，有意义（如果对同一个方法进行多次调用不能使用匿名对象）
        method(new Phone()); // 匿名对象可以当做参数传递
        // 6.构造方法
//        // 构造方法不能用对象调用
//        p.Phone();
        // 有参构造函数
        Phone p1 = new Phone("hw", 100, "黑色");
        p1.sendMessage();
        // 7.给成员变量赋值
        // 1>.构造方法 - 给属性进行初始化
        // 2>.setXxx方法 - 修改属性值（使用率更高）
        /*
        8.创建一个对象的步骤：
        1>.xxx.class加载进入内存（进入方法区）
        2>.main压栈（声明"xxx类型对象"）
        3>.堆内存创建对象（对象属性默认初始化值）
        4>.构造方法压栈（初始化对象属性）
        5>.构造方法弹栈
        6>.将对象的地址值赋值给"xxx类型对象"
        */
        /*
        9.static关键字
        1.特点
        1>.随着类的加载而加载，先于对象存在
        2>.被类的所有对象共享（被static修饰的成员位于方法区）
        3>.可以通过类名调用（也可以通过对象名调用）
        2.注意事项
        1>.静态方法中没有this关键字（静态方法随着类的加载而加载，this随着对象的创建而存在）
        2>.静态方法只能访问静态成员方法和静态成员变量（静态只能访问静态）
        3.静态变量和成员变量的区别
        1>.静态变量属于类（类变量），成员变量属于对象（对象变量）
        2>.静态变量存储于方法区中的静态区，成员变量存储于内存
        3>.静态变量随着类的加载而加载（随着类的销毁而销毁），成员变量随着对象的创建而创建（随着对象的销毁而销毁）
        4>.静态变量可以通过类名调用（也可以通过对象调用），成员变量只能通过对象名调用
        */
        // 0.0 <= 随机数 < 1.0
        Math.random();

        // 代码块
        // 1>.概念 - 在java中，使用{}括起来的代码被称为代码块
        // 2>.分类 - 局部代码块、构造代码块、静态代码块、同步代码块
        // a.局部代码块 - 出现在方法中，限定变量的生命周期，及时释放提高内存利用率
        // b.构造代码块（初始化块） - 出现在类中方法外，多个构造方法中重复的代码存在在一起，每次调用构造方法直接执行
        // c.静态代码块 - 出现在类中方法外，static修饰，用于给类进行初始化，类加载的时候执行（只执行一次）

        // 继承extends
        // 1>.概念 - 让类与类之间产生关系（子类和父类）
        // 2>.好处 - 1.提高了代码的复用性；2.提高了代码的维护性；3.让类与类之间产生关系（多态的前提）
        // 3>.弊端 - 提高了代码的耦合性
        // 4>.开发原则 - 高内聚（自己完成某件事的能力），低耦合（类与类的关系）
        // 5>.特点
        // a.Java只支持单继承，不支持多继承（C++支持多继承）
        // b.Java支持多层继承
        // 6>.注意事项
        // a.子类只能继承父类所有非私有的成员（成员方法和成员变量）
        // b.子类不能继承父类的构造方法（可以通过super去访问父类构造方法）
        // c.不要为了部分功能而刻意使用继承
    }

    // b.构造代码块（初始化块） - 出现在类中方法外，多个构造方法中重复的代码存在在一起，每次调用构造方法直接执行
    {
       System.out.println("构造代码块");
    }

    // c.静态代码块 - 出现在类中方法外，static修饰，用于给类进行初始化，类加载的时候执行（优先于方法执行、只执行一次）
    static {
        System.out.println("静态代码块");
    }

    public static void method(Phone p) {
        // a.局部代码块 - 出现在方法中，限定变量的生命周期，及时释放提高内存利用率
        {
            int x = 10;
            System.out.println(x);
        }
        p.brand = "hw";
        p.price = 8999;
    }

    // 方法概述
    // 1.概述 - 完成特定功能的代码块
    // 2.好处 - 提高代码复用性
    /*
    // 修饰符 - public/protected/private | static
    // 返回值类型 - void/int/String...
    // 方法名 - 符合命名规则即可
    // 形式参数 - 用于接收实际参数
    // 参数类型 - int/String...
    // 参数1 - 变量名
    修饰符 返回值类型 方法名(参数类型 参数1, 参数类型 参数2) {
        // 完成特定功能的代码块
        return 返回值;
    }
    */
    // 3>.方法不调用不执行
    public static int sum(int x, int y) {
        return x + y;
    }
    // 4>.方法重载（js不存在方法重载）- 在同一个类中，方法名相同，参数列表不同（与返回值无关）
    // 重载分类 - 参数个数不同、参数类型不同（参数顺序不同（开发中基本不使用））
    // 区别于"重写" - 在不同类中，子类可以重新实现父类的方法（返回值、方法名、参数列表完全一样）
}

// 定义一个手机类
class Phone {
    // 属性
    public String brand;
    public int price;
    // 权限修饰符
    // public公有 - 被修饰的成员可以在程序中访问
    // protected受保护 - 被修饰的成员只能在本包中访问
    // private私有 - 可以修饰成员变量和成员方法（被修饰的成员只能在本类中访问）
    private String color;

    // 对外提供公共的访问方式
    // IDEA自动生成：右键 - Generate... - 全选
    public void setColor(String color) {
//        // 就近原则
//        color = color;
        // this可以调用"成员方法"和"成员变量"，代表"当前对象（调用者）的引用"
        // 与oc一样
        this.color = color;
    }

    public String getColor() {
        return color;
    }

    // 构造方法
    // 1.概念 - 给对象的属性进行初始化
    /*
    构造方法的特点 - ！！！此处与oc不一样！！！
    a.方法名与类名完全一致（大小写也要一致）
    b.没有具体的返回值
    c.没有返回值类型（连void也没有）
    d.不能用对象调用
     */
    public Phone() {
        this.brand = "苹果";
        this.price = 123;
        this.color = "红色";
//        return; // 默认也会有return语句
    }
    // 构造方法的重载（在同一个类中，方法名相同，参数列表不同，与返回值无关）
    /*
    构造方法的注意事项
    a.如果我们没有给出构造方法，系统会自动提供一个无参构造方法
    b.如果我们给出了构造方法，系统不会再提供默认的无参构造方法（如果需要使用无参构造方法必须自定义 - ！！！建议永远自定义无参构造方法！！！）
    */
    public Phone(String brand, int price, String color) {
        this.brand = brand;
        this.price = price;
        this.color = color;
    }

    // 方法
    public void call() {
        System.out.println("打电话");
    }

    public void sendMessage() {
        System.out.println("发信息");
    }

    public void playGame() {
        System.out.println("打游戏");
    }
}



class ArrayTool {
    // 如果一个类中所有的方法都是静态方法，我们需要私有构造函数，防止外部创建对象
    private ArrayTool() {

    }

    public static int MaxElement(int[] args) {
        int maxElement = -1;
        if (args.length > 0) {
            maxElement = args[0];
        }
        for (int i = 0; i < args.length; i++) {
            if (maxElement < args[i]) {
                maxElement = args[i];
            }
        }
        return maxElement;
    }
}


