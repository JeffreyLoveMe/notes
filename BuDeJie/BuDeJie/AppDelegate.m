//
//  AppDelegate.m
//  BuDeJie
//
//  Created by 谢吴军 on 2020/3/10.
//  Copyright © 2020 谢吴军. All rights reserved.
//

#import "AppDelegate.h"
#import "SyTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/**
 1.确定开发方式和语言
 2.确定主框架
 3.工程基础配置
 4.划分文件结构MVC/按照模块划分
 5.
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1.创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    // 2.设置窗口的根视图控制器
    SyTabBarController *tabBarController = [[SyTabBarController alloc]init];
    self.window.rootViewController = tabBarController;
//    /**
//     iOS开发不推荐这样写
//     1.开发遵循原则“谁事谁管”
//     2.添加“子控制器”应该由 UITabBarController 管理
//     */
//    /**
//     此处需要"自定义"
//     1.自定义控件 - 系统不能满足要求的时候需要在保留系统原有方法的基础上增加自己的方法
//     2.自定义控制器 - 都需要自定义来处理复杂业务逻辑
//     */
//    UIViewController *vc1 = [[UIViewController alloc] init];
//    vc1.view.backgroundColor = UIColor.redColor;
//    [tabBarController addChildViewController:vc1];
//    UIViewController *vc2 = [[UIViewController alloc] init];
//    vc2.view.backgroundColor = UIColor.yellowColor;
//    [tabBarController addChildViewController:vc2];
//    UIViewController *vc3 = [[UIViewController alloc] init];
//    vc3.view.backgroundColor = UIColor.greenColor;
//    [tabBarController addChildViewController:vc3];
//    UIViewController *vc4 = [[UIViewController alloc] init];
//    vc4.view.backgroundColor = UIColor.orangeColor;
//    [tabBarController addChildViewController:vc4];
    // 3.显示窗口
    [self.window makeKeyAndVisible];
    return YES;
}

@end
