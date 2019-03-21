//
//  AppDelegate.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2018/12/31.
//  Copyright © 2018 zali. All rights reserved.
//

#import "AppDelegate.h"
#import "EyeeHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
// 程序启动后就会调用
// 对界面进行init
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor]; //目前特别流行whiteColor
    /*
     所有的ViewController命名：名称+Controller|controller
     */
    EyeeHomeViewController *homeController = [[EyeeHomeViewController alloc]init]; // 创建对象的同时直接init
    self.window.rootViewController = homeController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

// 非活动状态：程序在后台|暂停程序
-(void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"程序将要进入后台");
}

// 程序已经进入后台：记录对象状态
-(void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"程序已经进入后台");
}

// 程序将要进入前台：恢复对象的状态
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"程序将要进入前台");
}

// 程序已经变成活动状态：启动定时器|恢复任务
-(void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"程序进入活动状态");
}

// 程序将要终止|保存数据
-(void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"程序将要中止");
}

// 程序内存不足：释放程序中可以释放的内存|如果没有内存可以释放，程序会crash
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    NSLog(@"内存不足");
}

@end
