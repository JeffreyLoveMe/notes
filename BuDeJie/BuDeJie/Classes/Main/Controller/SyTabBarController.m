//
//  SyTabBarController.m
//  BuDeJie
//
//  Created by 谢吴军 on 2020/3/10.
//  Copyright © 2020 谢吴军. All rights reserved.
//

#import "SyTabBarController.h"
#import "SyNavigationController.h"
#import "SyHomeViewController.h"
#import "SyMineViewController.h"

@interface SyTabBarController ()

@end

@implementation SyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.添加子控制器
    [self addChildViewController];
    
    self.selectedIndex = 1;
}

// 添加子控制器
-(void)addChildViewController {
    /// 因为此处代码过于重复我们可以考虑封装
    // 1.首页
    SyHomeViewController *home_VC = [[SyHomeViewController alloc]init];
    [self addOneChildViewController:home_VC image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""] title:@"首页"];

    // 5.我的
    SyMineViewController *mine_VC = [[SyMineViewController alloc]init];
    [self addOneChildViewController:mine_VC image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""] title:@"我的"];
}


#pragma mark -
-(void)addOneChildViewController:(UIViewController *)childController image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title {
    // 包装成导航控制器
    // 内容由 "栈顶控制器" 决定
    UINavigationController *navigationController = [[SyNavigationController alloc]initWithRootViewController:childController];
    if ([childController isKindOfClass:[SyMineViewController class]]) {
        navigationController = [[UINavigationController alloc]initWithRootViewController:childController];
    }
//     /// 下面需要在 “每个子控制器里面设置”
//     // 1.添加导航控制器的title
//    navigationController.navigationItem.title = @"首页";
//     /// 下面需要在 “自定义UINavigationController” 中设置
//     // 2.添加导航控制器背景图片
//    // 1>.这里必须使用 UIBarMetricsDefault -> 不透明/背景图片显示 -> "子控制器self.view"坐标从导航栏底部一直到屏幕底部（不包含导航栏）{0,64}
//    // 2>.UIBarMetricsCompact -> 透明/背景图片不显示 -> "子控制器self.view"坐标从导航栏顶部一直到屏幕底部（包含导航栏）{0,0}
//    /**
//     [UIScreen mainScreen].bounds - 取决于"启动图"/只要"启动图"没问题就一直等于屏幕大小
//     self.view大小取决于导航栏 != [UIScreen mainScreen].bounds
//     */
//    [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
//     // 3.处理导航控制器的title文字样式/富文本
//    NSMutableDictionary *attrs = [[NSMutableDictionary alloc]init];
//    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
//    [navigationController.navigationBar setTitleTextAttributes:attrs];
    [self addChildViewController:navigationController];
    // UITabBarController的内容由 “相应子控制器的UITabBarItem” 决定
    // UITabBarItem是 “子控制器” 的属性
    childController.tabBarItem.image = image;
    childController.tabBarItem.selectedImage = selectedImage;
    childController.tabBarItem.title = title;
}


@end
