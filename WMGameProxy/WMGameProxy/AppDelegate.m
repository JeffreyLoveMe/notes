//
//  AppDelegate.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import "AppDelegate.h"
#import "ComponentController.h"
#import "WMGameProxy.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/// SceneDelegate
// https://blog.csdn.net/weixin_38735568/article/details/101266408
// 程序开始启动 0 - 4
// 程序进入后台 1 - 2
// 程序进入前台 3 - 4
// 程序杀死 1 - 2 - 5
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /// 0.程序启动时首先调用该方法
    // [[UIScreen mainScreen] bounds]只能使用该方法获取设备尺寸
    // 问题： iOS9.0以后，如果添加多个窗口，控制器会自动把状态栏隐藏
    // 解决办法：把状态栏交给应用程序管理
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = UIColor.whiteColor;
    
    // 底层调用 [navigationController pushViewController:[[ComponentController alloc]init] animated:true];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:[[ComponentController alloc]init]];
    /// 当前 UIWindow 的根视图控制器rootViewController
    // self.window.windowLevel
    self.window.rootViewController = navigationController;
    
//    /// 通过 UIStoryboard 加载程序
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"main" bundle:nil];
//    // 加载箭头指向的 UIStoryboard
//    [sb instantiateInitialViewController];
//    // 加载指定 UIStoryboard
//    [sb instantiateViewControllerWithIdentifier:@"main"];
    
    /// 显示 UIWindow
    // 1.将当前 self.window 设置成当前App主窗口：这样在别的控制器就可以通过 [UIApplication sharedApplication].keyWindow 取到
    // 2.将 rootViewController 添加到当前App主窗口
    [self.window makeKeyAndVisible];
    
//    // WMGameProxy借用地盘
//    /**
//     [WMGameProxy alloc] // 创建对象并返回对象地址/堆内存/类方法
//     [WMGameProxy init]   // 初始化对象并返回对象地址/对象方法
//     */
//    WMGameProxy *wm = [[WMGameProxy alloc]init];
//    /**
//     不推荐使用 new
//     1.为WMGameProxy类创建出来的对象分配存储空间 + alloc()方法/1.开辟存储空间；2.将所有属性设置为0
//     2.初始化WMGameProxy类创建出来的对象的属性 + init()方法/1.初始化成员变量（默认情况下什么都没做）；2.返回初始化后的实例对象地址
//     3.返回WMGameProxy类创建出来的对象对应的地址
//     */
//    WMGameProxy *wm = [WMGameProxy new];
//    wm.sdk = @"sdk"; // 不推荐直接赋值
//    /// "调用方法"在OC中叫做"发送消息"
//    // ？？？OC中调用方法的原理？？？
//    [wm setSdk:@"sdk"];
//    NSString *sdk = wm.sdk; // 点语法就是调用 setter / getter方法
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /// 1.App将要进入非活动状态
    // 该期间App不接受消息和事件
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /// 2.App进入后台（比如按home键）
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // 3.App进入前台
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /// 4.App进入活动状态
    // 能否与用户进行交互
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /// 5.App将要退出调用
    // 保存数据、清理缓存
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    // 6.App接收到内存警告
    // 清理缓存
    // 内存警告2次你还没有操作会闪退
}

@end
