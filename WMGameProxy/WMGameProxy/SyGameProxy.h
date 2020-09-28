//
//  SyGameProxy.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/20.
//  Copyright © 2019 zali. All rights reserved.
//

#ifndef SyGameProxy_h
#define SyGameProxy_h
/**
 1.开班须知
 1>.建议学习时间：
 上午 9:00-12:00 | 下午 14:00-18:00 | 晚上 19:30-21:30 | 最晚不能超过凌晨两点
 2>.学习内容：
 基础班( 1个月 )：C语言 | Objective-C
 就业班( 4个月 )：iOS开发 ｜ swift语言 | HTML | React Native
 3>.学习方法：
 1).专心听讲：注重听懂、理解
 2).建议准备笔记本：记录重点
 3).先自己解决 -> 百度 -> 谷歌
 */

/**
 2.iOS开发
 1>.概述：
 1).iOS是一款由苹果公司开发的操作系统(OS)
 2).什么是iOS开发 - 开发 iphone/iPad 手机软件开发
 3).主流操作系统 - iOS、Android、黑莓、WP、Symbian
 4).什么是操作系统 - 直接运行在硬件上的最基本的系统软件，其他软件必须依赖操作系统才能运行
 5).iOS(基于UNIX、不开源、AppStore)/Android(基于Linux的虚拟机、开源、GooglePlay)
 2>.准备：
 1).编程语言 - C语言 > Objective-C > swift/C++
 2).开发工具 - Xcode
 3).电脑系统 - MacOS
 4).真机设备 - iphone/ipad
 5).iOS证书 - 调试证书/发布证书
 3>.Apple硬件：
 1).iPhone - 2007年发布iphone1/2008年发布iphone2(3G)
 2).iPad - 2010年发布iPad1(大概一年发布一款)
 3).ipad mini - 2012年发布iPad mini1
 4).ipod Touch - 没有打电话功能的iphone
 5).Apple TV - 需要翻墙(国内被小米模仿)
 4>.Mac系统/基于Unix内核：
 1).Dock工具栏 - 应用程序列表(默认位于屏幕下方)
 2).系统偏好设置 - windows的控制面板
 3).safari浏览器 - windows的IE浏览器
 4).App store - 苹果应用商店
 5).finder文件管理器 - windows的计算机
 */

/**
 3.MAC常用快捷键
 command+空格 //切换输入法
 command+F //查找、替换
 command+N //新建文件
 command+tab //切换应用程序
 command+shift+3/4 //截图
 command+shift+Z //恢复撤销
 command+W/Q //退出前台|退出后台
 command+S/C/V/X/A/Z //保存/复制/粘贴/剪切/全选/撤销
 command+B/R //将代码翻译成0/1、编译程序/运行程序
 shift+command+N/M //创建工程/模拟内存警告
 command+D //保存网址
 command+I //排版
 command+\ //设置断点
 command+press //查看方法名
 command+option+左/右 // 折叠/展开代码
 option+press // 查看文档
 F11 //进入桌面
 */

/**
 4.Xcode
 1>.概述
 Xcode4之前，Xcode使用GCC编译器来翻译代码
 Xcode4以后，LLVM(虚拟机)、Clang前端专门用来编译代码
 2>.快捷键
 command+R //运行程序
 command+. //停止运行
 shfit＋command＋H //程序退到后台
 shift＋command＋N // 创建程序
 shift＋command＋M // 模拟内存警告
 command+press //查看方法名
 */

/**
 5.常用终端命令
 cd + 目录 //切换到指定目录
 cd + ../ //返回上一级目录
 cd + /  //切换到root目录
 ls  //查询当前目录下子目录活文件
 pwd //查看当前路径
 clear + l //清屏
 mkdir + 文件夹名称 // 新建文件夹
 rmdir + 文件夹名称 // 删除文件夹
 open + 文件名称 // 打开文件
 touch + xxx.txt // 在当前文件夹下新建文件
 cat + 文件名 //查看文件内容
 */

/**
 6.vi编译器的使用
 1>.作用：用来编写c语言程序
 2>.操作步骤
 vi test.c //打开/新建test.c文件
 i //命令模式->编辑模式
 #include <stdio.h> //编写一段c语言代码
 int main() {
     printf("hello world\n");
     return 0;
 }
 esc //退出编辑模式
 :wq //保存代码：返回到命令行模式
 //通过gcc编译器编译
 gcc test.c -o t //test.c需要编译的C语言源文件/t将要生成可执行文件
 ./t //运行程序/生成可执行文件
 */

/**
 7.计算机常识
 1.计算机只能识别0|1，计算机能识别的指令也是由0和1组成，计算机中存储和操作的数据都是由0和1组成
 2.计算机语言：机器语言(只有0和1-0表示不加电，1表示加电)/汇编语言(符号化机器语言)/高级语言（非常接近自然语言）
 */

/**
 8.进制转换
 1>.概念：一般考虑四种进制
 十进制：用0-9来表示所以的自然数
 int num = 14; // 默认是十进制
 printf("%i", num);
 二进制：用0-1来表示所有的自然数
 int num = 0b1110; // 前面加上0b
 注意：在C语言中没有以二进制输出的占位符
 八进制：用0-7来表示所有的自然数
 int num = 016; // 前面加上0
 printf("%o", num);
 十六进制：用0-F来表示所有的自然数
 int num = 0xF1; // 前面加上0x
 printf("%x", num);
 2>.为什么要引入二进制？
 因为计算机是以二进制形式进行数据存储：二进制存储简单方便
 3>.进制转换：
 大->小：除 k 取余法/底部是高位、上部是低位
 小到大：从低位起 *k 的 n( n从0开始 )次幂相加
 二进制<-->八进制/十六进制：有特殊技巧（3位1取/4位1取：高位不足可以补0）
 */

/**
 9.原码/补码/反码
 ！！！有时间可以操作一遍！！！
 1.真值：一个数的十进制表示形式/机器数：一个数的二进制表示形式
 2.原理：计算机内存是由大量开关组成的，分别用0和1来表示每一位开关（每一位成为1bit，每8位成为1字节/byte）
 1kb=1024byte   1Mb=1024kb   1Gb=1024Mb   1Tb=1024Gb/计算机分配内存的最小单位是字节/byte
 1)原码：将一个数的真值的绝对值转为二进制，存储的八位内存空间，最高位存储符号位，1表示负数，0表示正数，其余7位用来存储真值的绝对值的二进制表示形式
 结论：计算机不以原码的方式进行数据存储，原码会出现计算错误
 2)反码：正数的反码是原码，负数的反码是原码符号位不变，其余位数按位取反（0变1，1变0）反码的反码是原码
 结论：计算机不以反码的方式进行数据存储，反码解决不了0的问题
 3)补码：正数的补码是原码，负数的补码是反码加1，补码的补码是原码
 结论：计算机是以补码的形式进行存储/计算机只会做"加法运算"
 //正数三码合一
 真值       原码       反码       补码
 1         00000001  00000001   00000001
 -1        10000001  11111110   11111111
 */
#include <stdio.h>
// 1.声明函数
void Log(int m);

#endif /* SyGameProxy_h */
