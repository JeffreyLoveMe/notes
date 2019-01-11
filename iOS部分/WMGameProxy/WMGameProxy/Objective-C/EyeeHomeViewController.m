//
//  EyeeHomeViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2018/12/21.
//  Copyright © 2018 zali. All rights reserved.
//

#import "EyeeHomeViewController.h"

@interface EyeeHomeViewController ()

@end

@implementation EyeeHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -- UILabel
-(void)setupLabel {
    //1.创建UILabel：必须设置坐标
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(25, 150, 100, 50)];
    //2.添加到父视图
    [self.view addSubview:label];
    //3.设置背景颜色
    label.backgroundColor = [UIColor grayColor];
    //4.设置文字
    label.text = @"test";
    //5.设置文字颜色
    label.textColor = [UIColor yellowColor];
    //6.设置字体
    label.font = [UIFont systemFontOfSize:15];
    //7.对齐方式
    label.textAlignment = NSTextAlignmentLeft;
    //8.自适应宽度：文字过多会自动变小适应label宽度
    label.adjustsFontSizeToFitWidth = YES;
    //9.一般不使用：比较消耗性能
    label.tag = 1;
    //10.设置阴影：一般使用图片实现
    label.shadowOffset = CGSizeMake(5, 5); //阴影的偏移量
    label.shadowColor = [UIColor grayColor]; //阴影颜色
//    //11.隐藏label
//    label.hidden = YES;
}

#pragma mark -- UIButton
-(void)setupButton {
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(25, 150, 100, 50)];
    [self.view addSubview:btn];
    
    
}

#pragma mark -- UIView(UIView是所有控件的父控件)
-(void)setupView {
    //1.创建UIView
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(25, 150, 100, 50)];
    //2.添加到父视图
    [self.view addSubview:view];
    //3.设置背景颜色
    view.backgroundColor = [UIColor blueColor];
    //4.以自己为坐标系：相对于自己
    view.bounds = CGRectMake(0, 0, 150, 100);
    //5.中心点：相对于父视图
    view.center = CGPointMake(100, 200);
    //6.打印
}

#pragma mark --transform(形变属性)
-(void)setupTransform {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(25, 150, 100, 50)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor blueColor];
    //拉伸形变
    //view.transform =
    //旋转属性
}

#pragma mark -- UITextField
-(void)setupTextField {
    UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(25, 150, 100, 50)];
    [self.view addSubview:tf];
    tf.text = @"xxx";
    tf.font = [UIFont systemFontOfSize:15];
    tf.textColor = [UIColor redColor];
    tf.textAlignment = NSTextAlignmentCenter;
    //设置占位符：
    tf.placeholder = @"请输入名字";
}

#pragma mark -- UIImageView
-(void)setupImageView {
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(25, 150, 100, 50)];
    [self.view addSubview:image];
    image.image = [UIImage imageNamed:@"DOVE 1"];
    /*
     填充模式：
     UIViewContentModeScaleToFill 拉伸填充
     UIViewContentModeScaleAspectFit 按比例填充
     UIViewContentModeScaleAspectFill 按比例填满
     */
    image.contentMode = UIViewContentModeScaleToFill;
    //裁减超出父视图部分
    image.clipsToBounds = YES;
    //帧动画
    NSMutableArray *array = [NSMutableArray array]; // NSMutableArray只用新建一个
    for (NSInteger index = 1; index <= 18; index++) {
        UIImage *birdImage = [UIImage imageNamed:[NSString stringWithFormat:@"DOVE %ld",index]];
        [array addObject:birdImage];
    }
    image.animationImages = array; // 动画数组
    image.animationDuration = 0.5; //动画执行时间
    image.animationRepeatCount = 0; //动画执行次数：0是循环执行
    [image startAnimating]; // 开始执行动画
//    [image stopAnimating];
}

#pragma mark -- NSTimer
-(void)setupTimer {
    //1.创建NSTimer
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

-(void)onTimer {
    UILabel *label = [self.view viewWithTag:1];
    label.text = @"定时器";
}

























@end
