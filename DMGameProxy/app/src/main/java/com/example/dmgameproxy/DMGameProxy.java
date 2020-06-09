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
        // java输出语句
        System.out.println("我的第一个程序");

        // 常量 - 不能改变的量
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

        // 变量 - 可以改变的量
        































    }
}
