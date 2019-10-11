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
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimer) userInfo:nil repeats:true];
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

@end
