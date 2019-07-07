//
//  MainController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import "MainController.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/// 体验iOS开发
// 打电话
-(void)experienceIOS {
    // sms://10010
    NSURL *url = [NSURL URLWithString:@"tel://10010"];
    [[UIApplication sharedApplication] openURL:url];
}
// 3D
-(void)iphone3D {
    // 创建一个多度动画
    CATransition *animation = [CATransition animation];
    // 设置动画类型
    animation.type = @"cube";
    // 设置动画时间
    animation.duration = 5;
    // 添加动画
    [self.view.layer addAnimation:animation forKey:nil];
}
// 帧动画
// UIImageView
-(void)frameAnimation {
    NSMutableArray *pics = [NSMutableArray array];
    for (int i=1; i<=36; i++) {
        NSString *pic = [[NSString alloc]initWithFormat:@"xxx_%d", i];
        [pics addObject:pic];
    }
    //接下来怎么执行
}

#pragma mark - Objective-C语言专用注释

#warning -还没有写完的代码

@end
