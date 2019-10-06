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


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /// 程序启动时首先调用该方法
    // [[UIScreen mainScreen] bounds]只能使用该方法获取设备尺寸
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = UIColor.whiteColor;
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:[[ComponentController alloc]init]];
    /// 当前UIWindow的根视图控制器rootViewController
    // self.window.windowLevel
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
//    // WMGameProxy借用地盘
//    WMGameProxy *wm = [[WMGameProxy alloc]init];
//    WMGameProxy *wm = [WMGameProxy new]; // 不推荐使用new
//    wm.sdk = @"sdk"; // 不推荐直接赋值
//    [wm setSdk:@"sdk"];
//    NSString *sdk = wm.sdk; // 点语法就是get方法
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /// App将要进入非活动状态
    // 该期间App不接受消息和事件
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /// App进入后台
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // App进入前台
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /// App进入活动状态
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /// App将要退出调用
    // 保存数据、清理缓存
}


@end
