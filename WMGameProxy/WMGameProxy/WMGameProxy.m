//
//  WMGameProxy.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

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
}

/// 创建类对象的时候调用
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
        MainController *vc = [MainController alloc]; // 分配内存：创建对象后返回对象地址/堆空间
        vc = [vc init]; // 初始化
    }
    return self;
}

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
-(NSString * _Nonnull)getSdk {
    return _sdk;
}

/// 点语法
// 点语法的实质：是调用setting/getting方法
// 仅仅可以调用这两个方法、别的方法不可以调用
-(void)pointWay {
    WMGameProxy *wm = [[WMGameProxy alloc]init];
    wm.sdk = @"xxx"; // setting方法
    NSString *name = wm.sdk; // getting方法
    NSLog(@"%@", name);
}

// 实现类结束的标志
@end
