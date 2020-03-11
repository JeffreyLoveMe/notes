//
//  SyNavigationController.m
//  BuDeJie
//
//  Created by 谢吴军 on 2020/3/11.
//  Copyright © 2020 谢吴军. All rights reserved.
//

#import "SyNavigationController.h"

@interface SyNavigationController ()

@end

@implementation SyNavigationController
// 保证不管 “SyNavigationController创建多少次“ 统一风格设置都只会调用一次
+ (void)initialize {
    if (self == [SyNavigationController class]) {
//        // 1.获取App所有导航条标识
//        // appearance是一个协议/遵循该协议都会有该方法
//        // 统一定制风格/代码不够灵活/没有遵循自己的事情自己做原则
//        UINavigationBar *navigationBar = [UINavigationBar appearance];
        // self在类方法中代表 “类对象” / [SyNavigationController class]也代表类对象
        // 这样可以分别 “自定义导航控制器”
        UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
         // 2.添加导航控制器背景图片
        UIImage *originalImage = [UIImage imageNamed:@"navigationBarBg"];
        UIImage *image = [originalImage resizableImageWithCapInsets:UIEdgeInsetsMake(originalImage.size.height *0.5, originalImage.size.width * 0.5, originalImage.size.height * 0.5, originalImage.size.width * 0.5) resizingMode:UIImageResizingModeStretch];
        [navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
         // 3.处理导航控制器的title文字样式/富文本
        NSMutableDictionary *attrs = [[NSMutableDictionary alloc]init];
        attrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
        attrs[NSForegroundColorAttributeName] = UIColor.orangeColor;
        [navigationBar setTitleTextAttributes:attrs];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // “统一风格设置”不能设置在该方法中
    // 因为 “统一风格设置” 会调用多次
}



@end
