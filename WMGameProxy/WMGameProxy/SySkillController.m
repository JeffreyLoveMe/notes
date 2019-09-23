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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
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

@end
