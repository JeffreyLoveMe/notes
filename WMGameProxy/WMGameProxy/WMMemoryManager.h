//
//  WMMemoryManager.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/2/21.
//  Copyright © 2020 zali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMMemoryManager : NSObject

/**
 1.@property修饰符
 1>.readonly - 只读属性/只能生成 “getter方法”/不会生成 “setter方法”
 2>.readwrite - 读写属性/既会生成 “getter方法”又会生成 “setter方法”/默认
 
 3>.getter - 可以给生成的 “getter方法” 起别名
 4>.setter - 可以给生成的 “setter方法” 起别名
 // MRC
 5>.retain - 自动帮我们生成 “setter方法” 内存管理的代码/表示持有特性/一般只能用在 "MRC"
 6>.assign - 不会帮我们生成 “setter方法” 内存管理的代码/仅仅会生成普通的 “setter/getter方法”/表示赋值特性/一般用于基本数据类型（无论是 ARC 还是 MRC）/默认
 // ARC
 7>.strong - 强引用/表示持有属性/相当于 “MRC模式” retain
 8>.weak - 弱引用/相当于 “MRC模式” assign/指向的对象随时可能消失（如果指向的对象被释放该指针自动置为 nil）/一般用于delegate
 assign - 用于基本数据类型
 
 9>.atomic - 原子性/线程安全（对当前属性 "setter方法" 加锁）/性能低
 10>.nonatomic - 非原子性/线程不安全（不对当前属性setter方法加锁）/性能高/UI所有的属性都要用nonatomic
 
 11>.copy - 会生成不可变对象/字符串使用copy修饰（防止内部修改内部数据）/block使用copy（从栈区转移到堆区）
 12>.mutableCopy - 会生成可变对象/生成一个新的对象
 
 2.注意
 1>.多个属性x修饰符用 ‘,’ 隔开
 2>.如果需要对传入的数据进行过滤必须重写setter/getter方法
 3>.如果重写setter/getter方法@property将不会再生成setter/getter方法
 */
@property (strong, nonatomic, setter=isName:, getter=getName) NSString *name;
/**
 3.类的本质和对象存储细节
 1>.类的本质也是一个对象（类对象）/类对象会在这个类第一次被使用的时候创建（创建在堆区），在程序运行时一直存在/类对象代表类（Class类型）
 2>.通过类对象可以创建实例对象/每个实例对象的 “isa指针” 指向该实例的 “类对象”
 3>.实例对象中保存着该实例对象的所有属性、isa指针和引用计数器/类对象中保存着该实例对象的所有实例方法
 4>.类也是一种对象/也有isa指针/指向元类（元类中没有属性（也有isa指针）/只有类方法的方法列表）
 5>.元类也是一种对象/也有isa指针/指向根元类对象（根元类对象中没有属性（也有isa指针）/只有类方法的方法列表）
 6>.根元类对象（NSObject元类对象）也有isa指针指向自身
 7>.类对象的继承关系就是元类的继承关系（为了更好的方法查找）
 */
/**
 调用对象方法 - /实例对象（成员变量） -> isa指针 -> 类对象（属性信息 + 对象方法列表） -> 方法列表 -> 父类 -> 方法列表 -> 没找到（报错）
 调用类方法 - /类对象 -> isa指针 -> 元类（类方法） -> isa指针 -> 根元类对象
 */
/**
 实例对象 - 手动创建/包含成员变量 + isa指针 + 引用计数器
 类对象 - 系统自动创建/ 包含属性信息 + 对象方法列表 + isa指针
 元类对象 - 包含类方法列表 + isa指针
 根元类对象 - NSObject元类对象
 */
/**
 成员方法/类方法是共有的（整个内存只有一份/存放在类对象/元类中）
 成员变量是私有的（每个对象都有一份成员变量/存放在实例对象中）
 */
/**
 4.获取类对象/一个类在内存中只有一份类对象
 // 获取类对象的两种方式 - [类名 class]/[实例对象 class]
 WMGameProxy *wm1 = [[WMGameProxy alloc]init];
 WMGameProxy *wm2 = [[WMGameProxy alloc]init];
 Class c1 = [wm1 class];
 Class c2 = [wm2 class];
 Class c3 = [WMGameProxy class];
 // 用于创建实例对象
 WMGameProxy *wm3 = [[c3 alloc]init];
 // 用于调用类方法
 [c3 test];
 // 做为函数参数 - 用于创建实例对象/用于调用类方法
 */
/**
 5.类的启动过程
 1>.只要程序启动就会将类的代码加载到内存（放在代码区）/ load方法会在当前类被加载到内存的时候调用（有且仅有一次）
 2>.当当前类第一次被调用的时候就会调用（创建类对象的时候）/ initialize方法只会被调用一次
 3>.加载调用load方法->使用调用initialize方法
 */
@end

NS_ASSUME_NONNULL_END
