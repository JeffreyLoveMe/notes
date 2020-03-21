//
//  WMMemoryManager.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/2/21.
//  Copyright © 2020 zali. All rights reserved.
//

#import "WMMemoryManager.h"
#import "WMGameProxy.h"
/**
 0.内存管理的重要性
 1>.移动设备的内存极其有限，如果不进行内存管理App很容易发生闪退
 2>.增加一个App的内存占用行为 - 创建一个OC对象/定义一个变量/调用一个函数和方法
 3>.App占用内存较多时候系统会发生内存警告（回收一些不需要的内存空间）/系统会强制关闭App
 */
/**
 1.什么是内存管理
 1>.如何回收那些不需要再使用的对象 - 内存管理
 2>.分配内存 - 比如创建一个对象/清除内存 - 销毁一个对象
 3>.内存管理的范围 - 任何继承于 NSobject 的对象/对非对象类型（比如基本数据类型 - int/char/double）无效
 */
/**
 2.堆和栈的区别
 栈 - 由编译器自动分配释放内存/主要存放函数的参数值、局部变量
 堆 - 由程序员手动分配释放内存/若程序员不释放，程序结束的时候才会回收
 */
/**
 3.什么是引用计数器
 0>.每个对象都有一个自己的引用计数器/它是一个整数/表示对象被引用的次数（多少人正在引用这个对象）
 1>.系统如何判断什么时候需要回收一个对象 - 对象的 "引用计数器retainCount = 0"
 2>.任何对象只要被创建出来“引用计数器retainCount = 1”
 */
/**
 4.怎么操作引用计数器
 1>.给对象发送一个retain消息->可以使对象引用计数器+1（retain方法返回对象本身）
 2>.给对象发送一个release消息->可以使对象引用计数器-1/release不代表销毁/回收对象（仅仅代表引用计数器-1）
 3>.给对象发送一个retainCount消息->可以获取当前引用计数器的值（获取的不准备/要想准备必须使用dealloc()方法）
 */

@implementation WMMemoryManager
/**
5.dealloc()方法
1>.什么时候调用 - 当对象的 "引用计数器retainCount = 0"的时候
2>.作用 - 销毁对象/释放相关资源/必须调用 “[super dealloc];” 放在最后
3>.一旦对象被回收就不能在使用/如果坚持使用会导致程序崩溃（野指针错误）
*/
- (void)dealloc {
    /**
     执行代码
     */
    // 这句代码放在最后一行
    [super dealloc];
}

// 单个对象的内存管理
/**
 6.内存中有5块内存空间
 栈 - 由编译器自动分配释放内存/主要存放函数的参数值、局部变量
 堆 - 由程序员手动分配释放内存/若程序员不释放，程序结束的时候才会回收
 静态区/方法区 - 静态变量、全局变量和方法/class存放的区/只要静态区被分配内存直到程序结束才会被释放
 常量区 - 存放常量/多个内容相同的对象指向同一块存储空间
 程序代码区 - 程序加载到内存（程序代码存放在"代码区(存放二进制代码)"）
 */
/**
 7.内存管理有三种方式
 1.ARC/自动引用计数 - 不需要开发人员自己管理内存，编译器会在适当的地方加上 “release/retain代码”
 2.MRC/手动引用计数 - 所有对象的内存都需要开发人员手动管理/开发人员需要自己在适当的地方加上 “release/retain代码”
 3.自动释放池 - xxx
 */
/**
 8.内存管理的黄金法则
 1>.如果一个对象使用了 "alloc/copy[mutable]/retain" 那么就必须使用 "release/autorelease"
 2>.反之如果没有使用 "alloc/copy/retain" 就不能使用 "release/autorelease"
 */
-(void)singleObjectMemoryManager {
    /**
     1.开辟内存空间（在堆中开辟内存空间存放对象和对象属性）
     2.初始化所有属性
     3.返回指针地址（指针地址保存在栈区）
     */
    /**
    WM - 指针变量WM
    WM指向的对象 - [[WMGameProxy alloc]init]
    */
    WMGameProxy *WM = [[WMGameProxy alloc]init];  // 引用计数器 = 1
    /**
     ARC/MRC混合编程
     1.整个工程支持MRC - 选中工程-> TARGET-> Build Settings-> Automatic Reference Counting-> NO
     2.单个文件支持MRC - Build Phases-> Compile Sources -> "-fno-objc-arc"
     */
    // 必须在 “{}” 前通过 “指针变量WM” 给 “WM指向的对象” 发送一条 “release消息”
    [WM release];  // 引用计数器 - 1 = 0 -> 自动调用 "dealloc方法"/release只会使“引用计数器 - 1”不会“自动调用 'dealloc方法'”
    
//    WMGameProxy *WM = [[WMGameProxy alloc]init];  // 引用计数器 = 1
//    [WM retain]; // 引用计数器 + 1 = 2/给 “指针变量WM指向的对象” 引用计数器 + 1
//    [WM release]; // // 引用计数器 - 1 = 1/这时候不会“自动调用 'dealloc方法'”/给 “指针变量WM指向的对象” 引用计数器 - 1
    
    /**
     0>.僵尸对象 - 被释放的对象/开启监听"僵尸对象"( Edit Scheme->Run->Diagnostics->勾选Zombie Objects )
     1>.野指针 - 指向僵尸对象的指针
     */
    WMGameProxy *currentWM = [[WMGameProxy alloc]init]; // 引用计数器 = 1
    [currentWM release]; // 引用计数器 - 1 = 0 -> 对象被释放/此时 [[WMGameProxy alloc]init] 为僵尸对象/ currentWM 为野指针
    // 为了避免给野指针发送消息会报错，一般情况下当一个对象被释放后我们会将这个对象的指针设置为空指针
    // 因为在OC中给空指针发送消息程序不会报错
    currentWM = nil;
    // 指针变量currentWM 调用 release方法  <==>  给 指针变量currentWM 发送 release消息
    [currentWM release]; // 给 currentWM（野指针） 发送消息程序会报错
    [currentWM release];
    [currentWM release];
}


// 多个对象的内存管理
-(void)doubleObjectMemoryManager {
    /**
    有增就有减/有 retain 就有 release
    1.当A对象想要使用B对象的时候（"setter方法"）一定要对B对象进行一次 retain（拥有B对象的所有权）/保证A对象存在B对象就一定存在
    2.当A对象释放的时候（“dealloc方法”）一定要对B对象进行一次 release（释放B对象的所有权）/保证A对象释放了B对象也会被随之释放
    */
}






-(void)memoryManager {
    // 创建对象的时候返回的地址其实就是类的第0个属性的地址
    // 类的第0个属性是一个叫 isa 的属性
    // 其实类也是对象（类对象存放着当前类的所有方法，由系统自动创建）
    // 类对象通过 new 可以创建实例对象
    // 实例对象中有一个 isa 指针就会指向创建它的那个类对象
    /*
     对象方法：对象p -> 属性 -> 类对象 -> 调用方法
     类方法：类对象 -> 调用方法
     类对象的执行效率更高
     */
    /// 数组的内存管理
    // 向一个数组中加入一个元素，数组会对元素 retain(引用计数+1)
    // 数组销毁的时候会将数组中每个元素 release(引用计数-1)
    // 将元素移除数组会对元素 release(引用计数-1)
    /// 自动释放池 - Objective-C语言的一种内存管理机制
    // 当自动释放池销毁时会对池子中每一个对象调用一次 release方法
}

@end
