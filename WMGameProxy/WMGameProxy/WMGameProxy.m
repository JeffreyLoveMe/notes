//
//  WMGameProxy.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

// 需要使用 xxx 文件就导入 xxx.h
// 实际是将 WMGameProxy.h 文件拷贝到当前文件
#import "WMGameProxy.h"
#import "MainController.h"
// 类名
@implementation WMGameProxy
// 方法实现

/// 程序启动就会将所有类的代码加载到内存中
// 放在代码区
+ (void)load {
    // 先调用父类的load()->子类的load()
    // 有且仅有一次：加载到内存
    /////////////////////////////////
    // 匿名对象：当对象只需要使用一次的时候/对象作为实参传入方法中
    // 每次使用 new 都会创建一个新对象
    [MainController new];
}

/// 创建类对象的时候调用
// 不需要创建对象（不需要开辟存储空间/优化性能）
// ？？？类方法为什么不能直接访问属性？？？
// ？？？类方法怎么访问属性？？？（可以通过类方法调用对象方法间接调用属性/不建议这样写）
// 如果方法中没有使用到成员变量，尽量使用类方法。因为类方法执行效率高（为什么？）
// 类方法一般用于工具方法的定义
+ (void)initialize {
    if (self == [WMGameProxy class]) {
        // 有且仅有一次
        // 先调用父类的load()->子类的load()
    }
}

/// 对象的初始化方法/以init开头的方法（必须的）
// 只能调用一次、从父类继承
// id类型通用类型：一般用于"参数类型"/"返回值类型"
- (instancetype)init {
    self = [super init]; // self代表当前对象本身
    if (self) {
        // 写在函数或者代码块中的变量称为局部变量
        // 作用域：从定义开始到函数结束（遇到 {} / return）
        // 可以先定义再初始化也可以定义的同时初始化
        // 存储在栈区：系统会自动释放
        /////////////////////////////////////////////////
        // 写在函数和大括号外部的变量称为全局变量
        // 作用域：从定义的那一行开始到文件末尾
        // 可以先定义再初始化也可以定义的同时初始化
        // 存储在静态区：程序一启动就会分配存储空间，直到程序结束才会释放
        MainController *vc = [MainController alloc]; // 分配内存：创建对象后返回对象地址/堆空间
        vc = [vc init]; // 初始化
    }
    return self;
}

// 对象方法中访问当前对象的属性_xxx
-(void)loginWithGameId:(NSString *)gameId GameKey:(NSString *)gameKey {
    NSLog(@"login");
}


/// 初始化方法
// id/instancetype有什么区别？？？
-(id)initWithSdk:(NSString *)sdk {
    // 子类重写父类方法想要保留父类的对象方法
    // super在类方法中调用父类方法
    // super在对象方法中调用父类对象方法
    self = [super init];
    // self不能离开类
    // self在对象方法中指向当前对象（谁调用对象方法 self指向谁）
    // self在类方法中指向当前类
    // 不能在对象方法/类方法中使用 self调用自身（死循环）
    if (self) {
        _name = @"";
        _age = @"";
        _height = @"";
        _sdk = sdk;
    }
    return self;
}

/// 单例方法：程序运行过程中，对象只有一个
// swift可以声明全局静态变量/OC不允许声明全局变量
// 以单例->全局变量
// 面试：手写单例方法
+(instancetype)getInstance {
    // static声明静态变量：在函数结束变量不消失
    static WMGameProxy *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WMGameProxy alloc]init];
    });
    // 第一次进入创建对象
    // 后续调用：不需要再创建对象、因为static修饰的对象在函数结束不消失
    if (instance == nil) {
        instance = [[WMGameProxy alloc]init];
    }
    return instance;
}

// 不会输出self/会死循环
// NSLog()输出<类名:地址>/<Person: 0x100202310>
- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", _height];
}

// 整型NSInteger
// 布尔类型BOOL
// 结构体NSRange
-(void)showRange {
    NSRange range0 = {1,5};
    NSRange range1 = NSMakeRange(1, 5);
    NSLog(@"%ld,%ld", range0.length, range1.location);
}

// 如果需要给属性赋值、可以使用set方法
// 封装：屏蔽内部实现细节，对外提供共有的方法和接口
// 一定是对象方法：有参数无返回值
-(void)setSdk:(NSString * _Nonnull)sdk {
    _sdk = sdk;
//    // set方法的实质
//    // 可以自己操作一把
//    if (_sdk != sdk) {
//        [_sdk release];
//        _sdk = [sdk retain];
//    }
}
// 获取属性内容、可以使用get方法
// 一定是对象方法：无参数有返回值
-(NSString * _Nonnull)getSdk {
    return _sdk;
}

/// 点语法
// 点语法的实质：是调用 setter/getter 方法
// 仅仅可以调用这两个方法、别的方法不可以调用
// 点语法是一个编译器的特征：会在程序翻译成二进制的时候转换成 setter/getter 方法
// 给成员变量赋值：一般情况下如果不是给成员变量赋值不建议使用点语法
-(void)pointWay {
    WMGameProxy *wm = [[WMGameProxy alloc]init];
    wm.sdk = @"xxx"; // 在等号左边：编译器自动转换成 setter方法
    NSString *name = wm.sdk; // 在等号右边：编译器自动转换成 getter方法
    NSLog(@"%@", name);
}

// 实现类结束的标志
@end
