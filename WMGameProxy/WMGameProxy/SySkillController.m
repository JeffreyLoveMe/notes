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
#import "WMGameProxy.h"

@interface SySkillController ()

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation SySkillController
#pragma mark - ViewController的生命周期
- (void)loadView {
    // 保留父类方法
    // 一般都需要调用
    [super loadView];
    // 0.初始化控制器的 self.view/创建self.view
    // 当 self.view 第一次使用的时候调用
    // self.view是lazy
    // ！！！ self.view还没有加载完成 ！！！
    /*
     底层原理：
     先判断当前VC是不是从 storyboard 中加载的？？？
     1.如果是：把storyboard中的view设置为self.view
     2.如果不是：创建一个空白的View
     */
    // 系统调用：当控制器 View 第一次使用的时候调用该方法
    // 一旦重写该方法：需要自定义View
    self.view = [[UIView alloc]init];
    // 通过该方法设置 alpha = 0 不能响应事件
    self.view.alpha = 0;
    // 如果需要透明控件响应事件：颜色透明/可以处理事件
    self.view.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.控制器View加载完毕：创建所有子视图
    // 控件的初始化
    // 数据的初始化
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 2.视图将要出现
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 5.视图已经出现/显示完毕
    // 只能在这里移除 self.view
    // 只有有父视图都可以移除
    // self.view的父视图是 self.window
    [self.view removeFromSuperview];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 3.控制器的View将要布局子视图
    // 会调用多次
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // 4.控制器的View布局子视图结束
    // 会调用多次
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 6.视图将要消失
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    // 7.视图已经消失
}


#pragma mark - 定时器
// 频繁的销毁和创建"定时器"
// https://blog.csdn.net/zhuzhihai1988/article/details/7742881
-(void)createTimer {
    /// 创建定时器
    // NSTimer可以直接用 weak
    // 定时器会在 1s 以后开始
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
    // 解决定时器在主线程不工作的原因
    // ！！！主线程无论在处理什么操作都会抽时间处理 NStimer！！！
    // 有点不太明白
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    // 立即开始
    [timer fire];
    // 停止定时器
    // NSTimer 停止以后就不能再使用（需要再重新创建一个）
    [timer invalidate];
    // 开启定时器
    // 骚操作
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimer:)
                                           userInfo:@"123" repeats:YES];
}
-(void)onTimer:(NSTimer *)timer {
    NSLog(@"%@", timer.userInfo);
    // 比较消耗性能
    // 容易乱
    // 会递归一直遍历
    UILabel *myLabel = [self.view viewWithTag:0];
    myLabel.text = @"我过分";
}


#pragma mark - MPMoviePlayerController


#pragma mark - iOS自动布局框架 / Masonry详解
// https://www.jianshu.com/p/ea74b230c70d


#pragma mark - 使用 gif
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


#pragma mark - 传值
// 1.普通传值
// 2.delegate传值
// 3.block传值
-(void)jumpPage {
    /// 1.普通传值
    MainController *controller = [[MainController alloc]init];
    controller.mainText = @"普通传值";
    [self.navigationController pushViewController:controller animated:YES];
    /// 2.delegate传值
    // 那个页面需要调用该方法就需要遵循该 delegate
    // 2.调用delegate
    // delegate 是否实现了该方法
    if ([_delegate respondsToSelector:@selector(jumpPage:)]) {
        [_delegate jumpPage:@"delegate传值"];
    }
    /// bolck（与 delegate 一样）
    // 调用 block
    self.myBlock(YES);
}


#pragma mark - 异常处理
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


#pragma mark - 数据持久化
/// 0.为什么有 “数据持久化”？
// 通常程序在运行中或者程序结束以后，需要保存一些信息（登录信息、播放记录）
/// 1.“数据持久化” 存放的位置？
// 数据存放在 “沙盒” 中
/// 2.沙盒机制？
// 定义：“沙盒机制”是一种安全体系，规定应用程序只能在该应用程序创建的文件夹内读取文件，不可以访问其他地方的内容。
// 所有的非代码文件都保存在沙盒：比如图片、声音、属性列表和文本文件等
// Documents-保存应用程序运行时生成的需要持久化的数据（持久化数据/会备份）
// tmp-保存应用程序运行时所需要的临时数据（临时文件/不会备份）
// Library/Caches-保存应用程序运行时生成的需要持久化的数据（不会备份/缓存/一般较大）
// Library/Preference-保存应用的所有偏好设置（缓存/会备份）
/**
 1.每个应用程序都有自己的沙盒；
 2.不能随意跨越自己的沙盒去访问别的应用程序沙盒的内容；
 3.应用程序向外请求或接收数据都需要经过权限认证；
 */
-(void)showSandBox {
    NSLog(@"获取该应用沙盒根目录===%@", NSHomeDirectory());
    NSString *string = @"我的小可爱";
    /**
     获取 ../Documents
     第一个参数：搜索的目录
     第二个参数：搜索的范围
     第三个参数：是否展开路径
     */
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask, YES).firstObject;
//    // 获取 ../Library
//    NSString *libarayPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,
//    NSUserDomainMask, YES).firstObject;
//    // 获取 ../tmp
//    NSString *tempPath = NSTemporaryDirectory();
    // 拼接一个文件名
    NSString *filePath = [documentPath stringByAppendingPathComponent: @"nick.txt"];
    // 路径是沙盒路径
    if ([string writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil]) {
        NSLog(@"存储成功");
    }
}

/// 3.“数据持久化” 常用方法
// 0.文件操作
-(void)showFile {
    
}
// 1.Preference偏好设置
// 保存一些简单数据
// 不能保存自定义对象（自定义对象使用 “归档” 保存）
-(void)showPreference {
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
// 2.XML属性列表归档plist
// 只能存放 NSString/NSNumber/NSDate/NSArray/NSDictionary
// 不能保存自定义对象（自定义对象使用 “归档” 保存）
// plist的手动创建（右键 -> New File -> Resource -> Property List）
-(void)showPlist {
    /// 1.写入数据 myConfig.plist
    // 把 NSDictionary/NSArray 写入到 myConfig.plist
    NSArray *names = @[@"yjn", @"mj", @"gxq", @"nj"];
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                            NSUserDomainMask, YES).firstObject;
    // 拼接一个文件名
    NSString *filePath = [documentPath stringByAppendingPathComponent: @"myConfig.plist"];
    // 路径是沙盒路径
    [names writeToFile:filePath atomically:YES];
    
    /// 2.获取 myConfig.plist 数据
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"myConfig" ofType:@"plist"];
    // 通过路径转化数组（字典）
    // 如果 root 是 dic 使用 NSMutableDictionary 接收
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithContentsOfFile:path];
    // 如果 root 是 Array 使用 NSMutableArray 接收
    NSMutableArray *array = [[NSMutableArray alloc]initWithContentsOfFile:path];
    NSLog(@"%@===%@", dic, array);
}
// 3.归档NSCoding
// 一种序列化与反序列化
// 可以用来保存 “对象”
// 对象必须实现 "NSCoding协议" 才可以
// https://www.jianshu.com/p/3e08fa21316d
-(void)showCoding {
    // 新建对象
    WMGameProxy *wm0 = [WMGameProxy new];
    wm0.userName = @"谢吴军";
    wm0.weight = 150;
    // 如果需要保存 SyPostItem 对象
    // SyPostItem也需要实现 “NSCoding协议”
    // 实现 "NSCoding协议" 就是告诉用户：我准备存储哪个属性
    SyPostItem *item = [SyPostItem new];
    item.citys = @[@"A", @"B", @"C"];
    item.name = @"安庆";
    wm0.item = item;
    // 获取 “沙盒目录”
    NSString *tempPath = NSTemporaryDirectory();
    // 拼接文件
    NSString *filePath = [tempPath stringByAppendingPathComponent:@"sdk.data"];
    // 归档
    // 会调用 - (void)encodeWithCoder:(NSCoder *)coder 方法
    [NSKeyedArchiver archiveRootObject:wm0 toFile:filePath];
    // 解档
    // 会调用 - (instancetype)initWithCoder:(NSCoder *)coder 方法
    WMGameProxy *wm1 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@", wm1.userName);
}
// 4.数据库SQLite3
-(void)showSqlite {
    
}
// 5.Core Data
-(void)showCoreData {
    
}


/// 协议 protocol 一般是用来增加类方法
-(void)showProtocol {
#warning - 代码过几天补充
    MainController *controller = [[MainController alloc]init];
    // 必须实现方法
    [controller jumpPage:@""];
    // 可选方法
    if ([self respondsToSelector:@selector(finishTask:)]) {
        [controller finishTask:self];
    }
}


// id动态类型
// 可以调用任何方法（包括私有方法）
-(void)dynamic {
    id obj = [WMGameProxy new];
    // 这样可以避免调用方法出现崩溃
    if ([obj isKindOfClass:[WMGameProxy class]]) {
        [obj loginWithGameId:@"" GameKey:@""];
    }
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
    WMGameProxy *proxy = [[WMGameProxy alloc]init];
    proxy.mheight = 100;
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
/// 逆序一个字符串
-(NSString *)reverseWord:(NSString *)word Oprater:(NSString *)oprater {
    NSArray *array = [word componentsSeparatedByString:oprater];
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSString *str in [array reverseObjectEnumerator]) {
        [mArray addObject:str];
    }
    return [mArray componentsJoinedByString:oprater];
}

/// 几种延迟的对比
-(void)afterDelay {
    /// 第一种延迟方法
    // @selector(onStand) Selector方法
    // nil 参数
    // 0.5 延迟时间
    [self performSelector:@selector(onStand) withObject:nil afterDelay:0.5];
    /// 第二种延迟方法
    /// 第三种延迟方法
}
-(void)onStand {
    
}


/// block
// 1.block是iOS中一种比较特殊的数据类型/官方特别推荐使用
// 2.用来保存 “代码段”，在恰当的时候再取出来调用/类似于函数/效率高
-(void)shouBlock {
    // 3.block的基本写法
    // 1).无参数无返回值
    /**
     void - 表示 myBlock 保存的代码没有返回值
     (^myBlock) - 代表 myBlock 是一个 "block变量"，可以保存一段block代码
     (void) - 表示 myBlock 保存的代码没有形参
     */
    void (^myBlock)(void);
    // 只能保存 “block代码段”
    // ！！！如果没有 “形参” 的话 () 可以省略！！！
    myBlock = ^(){
        NSLog(@"这是一个block");
    };
    // 想要执行 “block保存的代码”，需要调用 block
    myBlock();
    // 2).无参数有返回值
    // ！！！如果没有 “形参” 的话 () 可以省略！！！
    NSString* (^plus)(void);
    plus = ^ {
        return @"这是一个block";
    };
    plus();
    // 3).有参数无返回值
    void (^add)(int, int);
    add = ^ (int value1, int value2){
        NSLog(@"这是一个block");
    };
    add(10, 20);
    // 4).有参数有返回值
    int (^sum)(int, int);
    sum = ^ (int value1, int value2){
        return value1 + value2;
    };
    sum(10, 20);
    
    // 4.因为 block 是一种数据类型
    // 1).先定义再初始化
    int (^log)(int, int);
    log = ^ (int value1, int value2){
        return value1 + value2;
    };
    log(10, 20);
    // 2).定义的同时初始化
    int (^request)(int, int) = ^ (int value1, int value2){
        return value1 + value2;
    };
    request(10, 20);
    
    // 5.利用 "typedef" 给 "block取别名"
    // “block变量名” 就是别名
    typedef int (^sumBlock)(int, int);
    sumBlock sumP = ^ (int value1, int value2){
        return value1 + value2;
    };
    sumP(10, 20);
    
    // 6.block作为函数参数
    // 普通数据类型作为函数参数只可以传递 “数字/字符串”
    // block作为函数参数直接可以传递 “代码块”
    
    // 7.注意事项
    // 1).block中可以访问外部的变量
    // 如果想要在 block 中修改外部变量的值，必须在外界变量前面加上 __block
    // 如果在 block 中修改了外部变量的值，会影响到外部变量的值
    /**
     不加 __block 是值传递 - 不能被内部修改
     加 __block 是地址传递 - 能够被外部修改
     */
    __block int m1 = 10;
    void (^yourBlock)(void) = ^{
//        // 2).block中可以定义和外界同名的变量/就近原则
//        int m1 = 20;
        
        // 3).默认情况下，不可以在 block 中修改外部的变量
        // 因为 block 中的变量和外界的变量并不是同一个变量
        // 如果 block 中访问到外界的变量会将外界的变量 copy 一份到堆内存
        m1 = 30;
        NSLog(@"m1 = %d", m1);
    };
    // 因为 block 使用外界的变量是 copy 的，所以此处修改变量值不会影响 block 中变量值
    m1 = 20;
    yourBlock();
    
    // 8.面试题
    // 1>.block是存储在 “堆内存” 还是 “栈内存” 中
    /**
     1.默认情况下 block 存储在栈中，如果对 block 进行一个 copy 操作就会转移到 堆中；
     2.如果 block 在栈中访问了外部的对象，那么不会对外部的对象进行 retain 操作；
     3.如果 block 在堆中访问了外部的对象，那么会对外部的对象进行 retain 操作；
     */
//    // 如果在 block 中访问外部的对象，一定需要给对象加上 __block，只要加上 __block 哪怕 block 在堆中也不会对外界的对象进行 retain 操作
//    WMGameProxy *wm = [WMGameProxy new];
//    NSLog(@"retainCount = %lu", [wm retainCount]);
//    void (^proxy)(void) = ^ {
//        NSLog(@"%@", wm);
//        NSLog(@"retainCount = %lu", [wm retainCount]);
//    };
//    Block_copy(proxy);
//    proxy();
    // 2>.什么是 “值传递”？什么是 “地址传递”？
    /**
     fixme
     */
}
// 将 “void (^myBlock)(void)” 中 myBlock 取出来即可
-(void)completeBlock:(void (^)(void))myBlock {
    // 代码块
    
    myBlock();
    
    // 代码块
}


/// 通知机制
/**
 常见的几种 “消息通信” 的方式的区别？？？
 0>.利用 “通知”/“代理” 都可以实现对象之间的通信
 1>.“通知”可以一对多，全局都可以接收到通知；
 2>.“代理”只能一对一，执行效率比通知高；
 */
// 1.每个 App 都有一个通知中心，负责不同对象之间的消息通信
// 2.任何对象都可以发布通知，其他对象（观察者）都可以接收该通知/一对多
// 3.可以降低对象之间的耦合度/解耦
-(void)showNotification {
    WMGameProxy *wm = [WMGameProxy new];
    // 一、监听通知
    // ！！！先注册 “接收通知”，再 “发送通知”！！！
    // 另外一个对象接收通知
    /**
     参数一/添加的观察者、接收通知的对象（ “响应方法”一般在 “该类” 中实现 ）
     参数二/观察者的响应方法、一旦被观察者消息发生变化就会触发该方法
     参数三/通知的名称（可以为 nil/不关注是 “什么通知”）/明确告诉系统想要监听 “什么通知”
     参数四/通知的发布者（可以为 nil/不关注是 “谁发布的通知”）/被观察者/明确告诉系统想要监听 “谁发布的通知”
     */
    // 此处不接收 “匿名通知”
    [[NSNotificationCenter defaultCenter] addObserver:wm selector:@selector(onChange:) name:@"network3" object:wm];
    // 此处接收 “匿名通知”
    [[NSNotificationCenter defaultCenter] addObserver:wm selector:@selector(onChange:) name:@"network3" object:nil];
    // 二、创建通知对象
    /**
     参数一/通知的名称
     参数二/通知的发布者（可以为 nil）
     参数三/通知传递的参数
     */
    NSNotification *notification1 = [[NSNotification alloc]initWithName:@"network1" object:wm userInfo:@{@"title": @"中国大佬"}];
    NSNotification *notification2 = [NSNotification notificationWithName:@"network2" object:nil userInfo:@{@"title": @"中国大佬"}];
    // 三、发送通知
    // 任何对象 -> “通知中心[NSNotificationCenter defaultCenter]” -> 另外一个对象/观察者
    [[NSNotificationCenter defaultCenter] postNotification:notification1];
    // 匿名通知
    [[NSNotificationCenter defaultCenter] postNotification:notification2];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"network3" object:wm userInfo:@{@"title": @"中国大佬"}];
    /// 四、移除通知（ iOS9.x以后可以不做 ）
    // ！！！一般在 “被观察者对象wm” 的 “- (void)dealloc;” 方法中移除移除通知！！！
    // ！！！移除通知必须要在 “wm被销毁” 之前！！！
    // 移除 “network3通知”
    [[NSNotificationCenter defaultCenter] removeObserver:wm name:@"network3" object:nil];
    // 移除 “wm所有监听的通知”
    [[NSNotificationCenter defaultCenter] removeObserver:wm];
    /// 常见通知
    /**
     UIDevice对象不间断发布以下通知
     1.UIDeviceOrientationDidChangeNotification - 设备旋转
     2.UIDeviceBatteryStateDidChangeNotification - 电池状态改变
     3.UIDeviceBatteryLevelDidChangeNotification - 电池电量改变
     4.UIDeviceProximityStateDidChangeNotification - 近距离传感器
     */
     /**
      // 键盘对象会发布以下通知
      1.UIKeyboardWillShowNotification - 键盘即将显示
      2.UIKeyboardDidShowNotification - 键盘显示完毕
      3.UIKeyboardWillHideNotification - 键盘即将隐藏
      4.UIKeyboardDidHideNotification - 键盘隐藏完毕
      5.UIKeyboardDidChangeFrameNotification - 键盘的位置尺寸即将发生改变
      6.UIKeyboardWillChangeFrameNotification - 键盘的位置尺寸改变完毕
      // 系统会附带一些额外信息
      1.UIKeyboardFrameBeginUserInfoKey - 键盘刚开始的 frame
      2.UIKeyboardFrameEndUserInfoKey - 键盘最终的 frame
      3.UIKeyboardAnimationDurationUserInfoKey - 键盘动画的时间
      4.UIKeyboardAnimationCurveUserInfoKey - 键盘动画的执行节奏/快慢
      */
}


/// KVC/KVO
// 1>.KVC - Key Value Coding/键值编码
// 间接访问属性的方法
-(void)showKVC {
    // 1.常规赋值
    WMGameProxy *wm = [[WMGameProxy alloc]init];
    wm.publishName = @"谢吴军";
    wm.publishAge = 18;
    // 常规赋值的也可以使用 KVC 取到值
    NSLog(@"%@",[wm valueForKeyPath:@"publishName"]);
    // model -> NSDictionary
    NSDictionary *dict = [wm dictionaryWithValuesForKeys:@[@"publishName", @"publishAge"]];
    NSLog(@"%@", dict);
    // 可以取出 “数组” 中所有对象的某个属性
    NSArray *array = @[wm, wm, wm];
    NSArray *arrayPublishName = [array valueForKeyPath:@"publishName"];
    NSLog(@"%@", arrayPublishName);
    // 2.KVC赋值
    // key属性值千万不能写错、不然会崩溃
    [wm setValue:@"谢吴军" forKey:@"publishName"];
    // KVC可以自动类型转换
    // 对于 “网络请求” 十分有用（我们不用特别关注后台返回的数据类型/只用保证 key 一致即可）
    [wm setValue:@"18" forKey:@"publishAge"];
    NSLog(@"%@===%ld", wm.publishName, (long)wm.publishAge);
    // ‘forKeyPath’ 包含 ‘forKey’ 的功能/尽量使用 ‘forKeyPath’
    // ‘forKeyPath’ 进行内部的点语法可以层层访问内部的属性
    // “key” 必须在 “属性” 中找到、不然会崩溃
    [wm setValue:@"小陈" forKeyPath:@"item.name"];
    
    // 3.使用 KVC 给私有属性赋值
    // nbplus
    // 两种方式都可以
    [wm setValue:@"88" forKeyPath:@"_gameCount"];
    [wm setValue:@"88" forKeyPath:@"gameCount"];
    
    /**
     KVC的底层原理/可以通过重写 “set方法” 做一些操作
     1.查看当前 key 值的 set方法，如果有 set方法就会调用 set方法，给对应的属性赋值
     2.如果没有 set方法 就会去查看是否有与 key值 相同并且带有下划线的成员属性，给对应的属性赋值
     3.如果没有与 key值 相同并且带有下划线的成员属性，就会去查看有没有与 key值 相同名称的成员属性，给对应的属性赋值
     4.如果还是没有找到会调用 “- (void)setValue:(nullable id)value forUndefinedKey:(NSString *)key” / 默认抛出异常
     */
}
// 2>.KVO - Key Value Observing/键值监听
// 监听某个对象的属性值变化
/**
 ！！！可以监听 “系统类/比如 UIScrollView/UITableView ” 的一些属性去做一些特定操作！！！
 比如有 contentOffset
 */
-(void)showKVO {
    WMGameProxy *wm = [WMGameProxy new];
    // 1.先绑定监听器
    /**
     给 “对象wm” 绑定一个监听器（观察者）
     第一个参数 - 观察者
     第二个参数 - 需要监听的属性
     第三个参数 - 选项
     第四个参数 - XXX
     */
    [wm addObserver:self forKeyPath:@"publishName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    // 2.再修改属性值
    wm.publishName = @"wj";
    wm.publishName = @"fj";
    // 3.移除监听
    [wm removeObserver:self forKeyPath:@"publishName"];
}
/**
 当监听的属性值发生改变调用
 @param keyPath - 要改变的属性 / publishName
 @param object - 要改变的属性所属的对象 / wm地址
 @param change - 改变的内容 / NSDictionary / change[NSKeyValueChangeNewKey] / change[NSKeyValueChangeOldKey]
 @param context - 上下文
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
}


/// 懒加载：重写 getter 方法/如果为空加载数据/如果不为空直接返回数据
// 1.用到的时候再加载
// 2.全局只会被加载一次
// 3.全局都可以使用
- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = @[@"", @"", @""];
    }
    return _dataArray;
}


/**
 泛型 - 1.限制类型；2.提高代码规范；3.迎合swift
 类型 <限制类型>
 最大作用 - 限制集合类型
 https://blog.csdn.net/imkata/article/details/78859482
 __covariant协变
 __contravariant逆变
 */
// 自定义泛型
-(void)showObj {
    WMGameProxy<NSString *> *wm = [WMGameProxy new];
    wm.obj = @"哈哈";
}


/// UIApplication
// UIApplication对象是应用程序的象征
// iOS程序启动以后创建的第一个对象就是UIApplication对象
// https://www.cnblogs.com/wendingding/p/3766347.html
- (void)showApplication {
    // 单例
    // 不可以手动创建
    UIApplication *app = [UIApplication sharedApplication];
    // 设置 “App图标” 右上角的红色提醒数字
    // 之前必须注册用户通知
    // 会弹出 “是否允许通知” 弹窗
    UIUserNotificationSettings *notice = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [app registerUserNotificationSettings:notice];
    app.applicationIconBadgeNumber = 400;
    // 设置联网指示器的可见性
    // 状态栏会出现一个"菊花"
    app.networkActivityIndicatorVisible = YES;
    // 设置状态栏
    // iOS7.0以后系统提供2种管理状态栏的方法
    // 1.通过 UIViewController 管理：每个 UIViewController 可以拥有自己不同的状态栏
    // 2.通过 UIApplication 管理：一个App的状态栏统一管理
    // 默认通过 “方法1” 管理状态栏
    // 如果使用 “方法2” 需要配置 info.plist 文件
    app.statusBarHidden = YES;
    app.statusBarStyle = UIStatusBarStyleLightContent;
    // 打开其他App
    [app openURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    // App很容易受到打扰
    // 来电、锁屏
}
/// 方法一
// 状态栏样式
// UIStatusBarStyleDarkContent黑色
// UIStatusBarStyleLightContent白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
// 是否隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}


/// UIDevice
// [UIDevice currentDevice]代表设备，通过它可以获取一些设置相关信息
-(void)showDevice {
    // 当前设置的 “系统版本”
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 9.0) {
        NSLog(@"系统版本大于等于9.0");
    }
    [[UIDevice currentDevice] localizedModel]; // 什么设备
    [[UIDevice currentDevice] systemName]; // 系统名称
}


/// 程序崩溃
// NSException
-(void)showException {
    // 新建异常
    NSException * exception = [NSException exceptionWithName:@"异常名称" reason:@"异常原因" userInfo:nil];
    // 抛出异常
    // 就会崩溃
    [exception raise];
}


/// 架构思想
/// 1.MVC
// 1>.概念
// MVC是一种设计思想，贯穿整个iOS开发中；
// 2>.作用
// Model数据改变View的显示状态也需要随之改变；
// View视图上面显示什么取决于Model；
// Controller负责初始化Model，将Model传递给View；
// 3>.宗旨
// Model数据和View视图一一对应，以Model数据驱动View视图/防止发生复用；
/// 2.MVP
/// 3.MVVM


- (void)dealloc {
    // 对象销毁之前自动调用该方法
    
}


- (void)didReceiveMemoryWarning {
    // 系统调用
    // 当控制器接收到内存警告调用
    // 去掉一些不必要/耗时的内存
}

@end
