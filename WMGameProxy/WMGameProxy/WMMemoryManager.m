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
/**
 6.内存中有5块内存空间
 栈 - 由编译器自动分配释放内存/主要存放函数的参数值、局部变量
 堆 - 由程序员手动分配释放内存/若程序员不释放，程序结束的时候才会回收
 静态区/方法区 - 静态变量、全局变量和方法/类存放的区、只要静态区被分配内存直到程序结束才会被释放
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

// MRC单个对象的内存管理
-(void)singleObjectMemoryManager {
    /**
     1.开辟内存空间（在堆中开辟内存空间存放对象和对象属性）
     2.初始化所有属性
     3.返回指针地址（指针地址保存在栈区）
     */
    /**
    WM - 指针变量WM
    [[WMGameProxy alloc]init] - WM指向的对象/WMGameProxy实例变量
    */
    /**
     “WM指向的对象/WMGameProxy实例变量”中包含
     1.属性（isa指针）- 属性可以指向别的实例变量
     2.引用计数器（retainCount）
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


// 9.MRC模式下多个对象的内存管理
-(void)doubleObjectMemoryManager {
    /**
    有增就有减/有 retain 就有 release
    1.当A对象想要使用B对象的时候（"setter方法"）一定要对B对象进行一次 retain（拥有B对象的所有权）/保证A对象存在B对象就一定存在
    2.当A对象释放的时候（“dealloc方法”）一定要对B对象进行一次 release（释放B对象的所有权）/保证A对象释放了B对象也会被随之释放
    */
}
/**
 10.“循环retain”
 1.概念 - 如果对象A拥有对象B，而对象B拥有对象A，此时会形成 “循环retain”
 2.解决办法 - 让对象A/对象B一方不要进行 “retain操作”
 */

 
/**
 11.Autorelease
 1>.概念 - 一种支持引用计数的内存管理方式
 2>.作用 - 只要给对象发送 “autorelease消息” 就会将对象放到自动释放池。当自动释放池被销毁的时候会对自动释放池中所有的对象做一次 “release操作”（并不代表会释放对象）
 3>.p = [p autorelease];  // autorelease返回对象本身/不会修改对象的引用计数器
 4>.好处 - 1.不用关心对象释放的时间/2.不用关心什么时候调用release
 5>.原理 - “autorelease操作”实际上是将 “release操作” 延迟执行（只要对象发送 “autorelease消息”系统就会将对象放入 “自动释放池” 中，当 “自动释放池”被销毁就会对内部的所有对象发送 “release消息”）
 6>.加入到自动释放池以后可以接着使用该对象/release以后不可以接着使用该对象
 7>.自动释放池无序/自动释放池可以嵌套使用/就近原则-向上查找
 */
/**
1>.自动释放池注意事项
 1.调用autorelease必须在 @autoreleasepool {} 内部不然没有效果
 2.写在 @autoreleasepool {} 内部的代码必须 ”调用autorelease“ 不然没有效果
 3.只要在 @autoreleasepool {} 内部 ”调用autorelease“ 就有效果
 4.尽量避免对大内存使用 “@autoreleasepool {}方法” - 因为这是一种延迟释放机制
 5.一个 “alloc/new/copy/retain” 对应一个 “release/autorelease”/不要过度释放
*/
/**
2>.什么时候使用“自动释放池”？
1.如果对象需要返回->那么对象不能在返回之前release->那么在返回之前需要将对象放入自动释放池
2.使用类工厂方法创建的对象不需要release/都会自动加入到自动释放池
*/
// 面试题 - Foundation框架的类但凡通过类工厂方法创建的对象都是autorelease的
-(void)setAutoRelease {
    /// 新建自动释放池
    // 1>.第一种方法/ iOS5.x以后
    @autoreleasepool {   // 创建一个自动释放池 - iOS程序运行过程中会创建无数个“自动释放池”/“自动释放池”以栈结构存在
        // 执行代码块
        // 第一种写法
        WMGameProxy *wm = [[WMGameProxy alloc]init];
        // 把 "指针变量p" 指向的 “实例变量” 放到了 “自动释放池” 中/对象还是可以访问
        // 只要调用了 “autorelease” 就不用在调用 "release"
        // 将这个对象放到栈顶的自动释放池
        wm = [wm autorelease];
//        // 第二种写法
//        WMGameProxy *wm = [[[WMGameProxy alloc]init] autorelease];
        [wm setSdk:@"sdk"];
    }  // 销毁自动释放池 - 给自动释放池中所有对象发送一条 “release消息”
//    // 2>.第二种方法/ iOS5.x以前
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
//    // 执行代码块
//    [pool drain];
}



/**
 12.ARC
 1>.概念 - 自动引用计数/编译器特性（不是运行时特性）
 2>.不允许写retain/release/autorelease|可以调用dealloc()，但是不允许使用[super dealloc];
 3>.判断原则 - 只要还有一个强指针变量指向对象，对象就会保持在内存中/默认所有的指针都是强指针
 4>.从执行效率上讲 - ARC优于MRC
 */
-(void)setARC {
    // 明确声明这是一个强指针
    __strong WMGameProxy *wm = [[WMGameProxy alloc]init];
    // 明确声明这是一个弱指针/只有弱指针指向的对象也会被释放
    __weak WMGameProxy *wm1 = wm;
    // 刚创建出来就会被释放 - 在开发中不要使用一个弱指针保存一个刚刚创建的对象（一创建就会被释放）
    __weak WMGameProxy *wm2 = [[WMGameProxy alloc]init];
    // 执行完这行代码 “对象wm” 就会被释放
    wm = nil;
}

/**
 13.ARC模式下多个对象的内存管理
 1>.A对象想拥有B对象就需要用一个强指针指向B对象/A指针不再使用B对象什么都不需要做（编译器会自动帮我们释放）
 */

/**
 14.集合对象的内存管理
 1>.如果数组将一个对象添加，那么数组会对对象进行一次retain
 2>.如果数组将一个对象移除，那么数组会对对象进行一次release
 3>.当数组对象释放之后会对数组中的所有对象发送一条release消息
 */

/**
 15.mutableCopy和Copy - https://blog.csdn.net/chenyufeng1991/article/details/51771728
 1>.mutableCopy - 创建可变对象
 2>.Copy - 创建不可变对象
 3>.使用Copy/mutableCopy的对象必须遵循NSCopying/NSMutableCopy协议/实现copyWithZone:/mutableCopyZone:方法
 4>.oc中的对象全部默认遵循NSCopying/NSMutableCopy协议
 5>.修改原来的对象不会影响拷贝出来的对象/修改拷贝出来的对象也不会影响原来的对象
 */
/**
 因为调用copy方法有时候会生成一个对象，有时候未生成一个新的对象
 1.如果生成一个新的对象我们称为深拷贝，本质就是会创建一个新的对象/原来对象的引用计数不变/新的对象引用计数 + 1
 2.如果未生成一个新的对象，我们称为浅拷贝，本质就是指针拷贝/引用计数 + 1
 */
-(void)setCopy {
    // 位于常量区 - 不需要手动管理内存
    NSString *str = @"str";
    /// 会生成新的对象
    // 1.只要是拷贝出来的对象的内容和以前对象的内容一致
    // 2.一般情况下拷贝会生成一个新的对象
    // 3.修改原来的对象不会影响拷贝出来的对象/修改拷贝出来的对象也不会影响原来的对象
    // 4.生成一个新对象可以让"不可变对象"生成"可变对象"
    NSMutableString *newStr = [str mutableCopy];
    /// 会生成新的对象
    NSMutableString *copyStrM = [newStr mutableCopy];
    /// 不会生成新的对象
    // 此时不会生成一个新对象 - 因为原来的对象和拷贝出来的对象都是"不可变对象"/不能修改所以符合条件
    NSString *copyStr = [str copy];
    /**
     深拷贝：生成值一样，内存地址不一样的全新对象-内容拷贝
     浅拷贝：使原对象的引用计数 + 1，没有创建全新的对象，直接返回被拷贝对象的地址-指针拷贝
     // 不可变字符串：右侧如果是copy，那么就是浅拷贝；右侧如果是mutableCopy,那么就是深拷贝
     NSString *msg0 = @"";
     NSString *msg2 = [msg1 mutableCopy]; // 深拷贝
     NSString *msg1 = [msg0 copy]; // 浅拷贝：对原对象进行一次retain、对拷贝出来的对象进行一次release
     // 可变字符串：右侧无论是copy还是mutableCopy，都是深拷贝
     NSMutableString *msg3 = [NSMutableString stringWithString:@""];
     NSString *msg1 = [msg0 copy];//深拷贝
     NSString *msg2 = [msg1 mutableCopy];//深拷贝
     1.浅拷贝类似retain，深拷贝类似copy
     2.https://blog.csdn.net/chenyufeng1991/article/details/51771728
     -(id)copyWithZone:(NSZone *)zone {

     }
     -(id)mutableCopyWithZone:(NSZone *)zone {

     }
     */
//    // ！！！Copy内存管理的正确写法！！！
//    NSString *str = [[NSString alloc]initWithString:@"xwj"];
//    NSString *newStr = [str copy];
//    [str release];
//    [str release];
//    // ！！！Copy内存管理的正确写法！！！
}

@end





