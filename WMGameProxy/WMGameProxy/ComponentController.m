//
//  ComponentController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/7/31.
//  Copyright © 2019 zali. All rights reserved.
//

#import "ComponentController.h"

@interface ComponentController ()

@end

@implementation ComponentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

//定时器
-(void)createTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimer) userInfo:nil repeats:true];
    [timer invalidate];
}
-(void)onTimer {
    UILabel *myLabel = [self.view viewWithTag:0];
    myLabel.text = @"我过分";
}
//UIView
-(void)setupView {
    UIView *view = [[UIView alloc]init];
    // 可以控制位置&尺寸
    view.frame = CGRectMake(100, 100, 100, 50); // 以父控件的左上角为原点
    // 可以控制尺寸
    view.bounds = CGRectMake(0, 0, 100, 50); // 以自己左上角为坐标原点：x和y永远为0
    // 可以控制位置
    view.center = CGPointMake(100, 40);  // 控件的中心点：以父控件左上角为坐标原点
    UIView *superView = [view superview]; // 获取父视图对象：一个视图最多只有一个父视图
    NSLog(@"%@", NSStringFromCGRect(superView.bounds));
    NSArray *subViews = [view subviews];  // 获取子控件对象：一个视图可以有多个子视图
    for (view in subViews) {
       NSLog(@"%@", NSStringFromCGRect(view.bounds));
    }
    view.tag = 0;
}
// UILabel
-(void)setupLabel {
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:label];
    label.backgroundColor = UIColor.whiteColor;
    label.text = @"hello world";
    label.textColor = UIColor.yellowColor;
    label.font = [UIFont fontWithName:@"" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    // 自适应宽度：字体会缩小、不会放大
    label.adjustsFontSizeToFitWidth = true;
    label.tag = 0;
    label.hidden = false;
    /// 阴影
    label.shadowOffset = CGSizeMake(5, 5); // 阴影的偏移量
    label.shadowColor = UIColor.grayColor;// 设置阴影颜色
}
// UIButton
// UIImageView/UIImage

// UITextField
// UITextView
// UISlider
// UISwitch
// UIStepper
// UISegmentControl
// UIAlertView
// UIActionSheet
// UIProgressView
// UIActivityIndicatorView
// UIWebView/WKWebView
// UIMenuController
// UIPageControl
// UIRefreshControl
// UIAlertController
// UIImagePickerController
// UIPickView
// UIDatePicker
// UIToolBar
// UINavigationBar

// 键盘
-(void)keyBoard {
    // 让视图关闭键盘
    [self.view endEditing:YES];
}

@end
