//
//  SySkillController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/8/5.
//  Copyright © 2019 zali. All rights reserved.
//

#import "SySkillController.h"
#import "UIImage+animatedGIF.h"
#import "MainController.h"

@interface SySkillController ()

@end

@implementation SySkillController
/// ViewController的生命周期
- (void)loadView {
    [super loadView];
    // 初始化控制器的self.view/创建self.view
    // 当self.view第一次使用的时候调用
    // self.view是lazy
    // ！！！self.view还没有加载完成！！！
    /*
     底层原理：
     先判断当前VC是不是从storyboard中加载的？
     1.如果是：把storyboard中的view设置为self.view
     2.如果不是：创建一个空白的View
     */
    /// 一旦重写该方法：需要自定义View
    self.view = [[UIView alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 2.控制器View加载完毕：创建所有子视图
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 3.视图将要出现
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 4.视图已经出现
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 5.控制器的View将要布局子视图
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // 6.控制器的View布局子视图结束
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 7.视图将要消失
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    // 8.视图已经消失
}

/// 定时器
-(void)createTimer {
    // 创建定时器
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimer) userInfo:nil repeats:true];
    // 停止定时器
    [timer invalidate];
}
-(void)onTimer {
    UILabel *myLabel = [self.view viewWithTag:0];
    myLabel.text = @"我过分";
}

/// MPMoviePlayerController

/// iOS自动布局框架 - Masonry详解
// https://www.jianshu.com/p/ea74b230c70d

/// 使用gif
// 一般使用"帧动画"替代gif
-(void)shouGIF {
    // 每个本地文件都可以通过该方法转换成url
    // 利用url生成对象本身
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"FlagZombie" withExtension:@"gif"];
    UIImage *image = [UIImage animatedImageWithAnimatedGIFURL:url];
    UIImageView *gifImageView = [[UIImageView alloc]initWithImage:image];
    gifImageView.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:gifImageView];
}

/// 传值
// 1.普通传值
// 2.delegate传值
// 3.block传值
-(void)jumpPage {
    /// 1.普通传值
    MainController *controller = [[MainController alloc]init];
    controller.mainText = @"普通传值";
    [self.navigationController pushViewController:controller animated:YES];
    /// 2.delegate传值
    // 那个页面需要调用该方法就需要遵循该delegate
    // 2.调用delegate
    [_delegate jumpPage:@"delegate传值"];
    /// bolck（与delegate一样）
    // 调用block
    self.myBlock(YES);
}

/// 异常处理
-(void)hock {
    NSArray *array = [NSArray array];
    @try {
        // 可能会出现异常的代码
        [array objectAtIndex:5];
    } @catch (NSException *exception) {
        // 如果捕捉到错误：执行此处的代码
        NSLog(@"%@", exception);
    } @finally {
        // 可选：必执行代码
        NSLog(@"finally");
    }
}

/// 数据持久化
// 1.NSUserDefaults
// 保存一些简单数据
-(void)showNSUserDefaults {
    /// 写入数据
    // 实例化
    [[NSUserDefaults standardUserDefaults] setObject:@"value" forKey:@"key0"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"key1"];
    [[NSUserDefaults standardUserDefaults] setValue:@(10) forKey:@"key2"];
    [[NSUserDefaults standardUserDefaults] setInteger:10 forKey:@"key3"];
    // 同步到持久状态
    [[NSUserDefaults standardUserDefaults] synchronize];
    /// 读取数据
    NSString *value = [[NSUserDefaults standardUserDefaults] objectForKey:@"key0"];
    BOOL shouldHide = [[NSUserDefaults standardUserDefaults] boolForKey:@"key1"];
    NSInteger count = [[NSUserDefaults standardUserDefaults] integerForKey:@"key2"];
    NSLog(@"%@===%d===%ld", value, shouldHide, count);
}
// 2.plist
// 1).plist的手动创建
// 2).plist用什么接收
// 3).存储在沙盒中
-(void)showPlist {
#warning - 代码过几天补充
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"myConfig" ofType:@"plist"];
    // 通过路径转化数组（字典）
    // 如果root是dic使用NSMutableDictionary接收
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    // 如果root是Array使用NSMutableArray接收
    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:path];
    NSLog(@"%@===%@", dic, array);
}
/// 协议protocol一般是用来增加类方法
-(void)showProtocol {
    MainController *controller = [[MainController alloc]init];
    // 必须实现方法
    [controller jumpPage:@""];
    // 可选方法
    if ([self respondsToSelector:@selector(finishTask)]) {
        [controller finishTask];
    }
}
/// 内存管理
// 基本数据类型不需要管理内存
// 自动调用dealloc方法
// ARC/MRC混合编程-选中工程->TARGET->Build Settings->Automatic Reference Counting->NO
-(void)memoryManager {
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
    // 释放对象所有权：做出release/autorelease操作就会 释放该对象的所有权
///     内存管理的黄金法则：如果对一个对象使用了alloc/copy[mutable]/retain那么必须使用release/autorelease释放
///     ！！！反之如果没有使用alloc/copy/retain就不能使用release/autorelease！！！
    // 怎么持有对象？？？
    // 对象销毁相当于野指针：调用野指针会crash
    /*
     1.多release导致野指针程序crash
     2.少release导致内存泄漏对象不会被销毁
     */
    /// 数组的内存管理
    // 向一个数组中加入一个元素，数组会对元素retain(引用计数+1)
    // 数组销毁的时候会将数组中每个元素release(引用计数-1)
    // 将元素移除数组会对元素release(引用计数-1)
    /// 自动释放池
    // 定义：oc的一种内存管理机制
    // 当自动释放池销毁时会对池子中每一个对象调用一次release方法
}
/// 逆序一个字符串
-(NSString *)reverseWord:(NSString *)word Oprater:(NSString *)oprater {
    NSArray *array = [word componentsSeparatedByString:oprater];
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSString *str in [array reverseObjectEnumerator]) {
        [mArray addObject:str];
    }
    return [mArray componentsJoinedByString:oprater];
}

- (void)dealloc {
    // 对象销毁之前自动调用该方法
    
}

@end
