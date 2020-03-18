//
//  SyMemoryManager.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/2/21.
//  Copyright © 2020 zali. All rights reserved.
//

#import "SyMemoryManager.h"

@implementation SyMemoryManager

- (void)dealloc {
    /**
     执行代码
     */
    // 这句代码放在最后一行
    [super dealloc];
}

#pragma mark - 内存管理
// 管理对象的生命周期/基本数据类型不需要内存管理
// 内存管理有几种方式？？？
// 自动调用 “dealloc方法”
// ARC/MRC混合编程-选中工程->TARGET->Build Settings->Automatic Reference Counting->NO
-(void)memoryManager {
    // 对象的内存存储细节
    // 内存分成三个区域：栈/堆/代码区
    // 程序加载到内存中：存放在"代码区(存放二进制代码)"
    /*
     通过类创建对象：
     1.开辟内存空间（在堆中开辟内存空间、存放对象和对象属性）
     2.初始化所有属性
     3.返回指针地址（指针地址保存在栈区）
     */
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
//    WMGameProxy *proxy = [[WMGameProxy alloc]init];
//    proxy.mheight = 100;
//    /// 基本对象的内存管理
//    MainController *controller = [[MainController alloc]init];  // 引用计数为1
//    NSLog(@"1.引用计数：%ld", [controller retainCount]);
//    [controller retain];  // 引用计数+1
//    NSLog(@"2.引用计数：%ld", [controller retainCount]);
//    [controller retain];  // 引用计数+1
//    NSLog(@"3.引用计数：%ld", [controller retainCount]);
//    [controller release]; // 引用计数-1
//    NSLog(@"4.引用计数：%ld", [controller retainCount]);
//    [controller release]; // 引用计数-1
//    [controller release]; // 引用计数-1（自动调用dealloc方法）
    /// 多个对象的持有某一个对象
    // 当你不再使用某一个对象引用计数-1
    // 对象所有权：当一个所有者（Objective-C对象）做出alloc/retain/copy操作就会拥有该对象的所有权
    // 释放对象所有权：做出 “release/autorelease操作” 就会释放该对象的所有权
///     内存管理的黄金法则：如果对一个对象使用了 alloc/copy[mutable]/retain 那么必须使用 release/autorelease 释放
///     ！！！反之如果没有使用 alloc/copy/retain 就不能使用 release/autorelease！！！
    // 怎么持有对象？？？
    // 对象销毁相当于野指针：调用野指针会 crash
    /*
     1.多release导致野指针程序crash
     2.少release导致内存泄漏对象不会被销毁
     */
    /// 数组的内存管理
    // 向一个数组中加入一个元素，数组会对元素 retain(引用计数+1)
    // 数组销毁的时候会将数组中每个元素 release(引用计数-1)
    // 将元素移除数组会对元素 release(引用计数-1)
    /// 自动释放池 - Objective-C语言的一种内存管理机制
    // 当自动释放池销毁时会对池子中每一个对象调用一次 release方法
}

@end
