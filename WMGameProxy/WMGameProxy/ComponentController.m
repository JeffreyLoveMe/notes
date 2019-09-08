//
//  ComponentController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/7/31.
//  Copyright © 2019 zali. All rights reserved.
//

#import "ComponentController.h"

@interface ComponentController () <UITextFieldDelegate, UIScrollViewDelegate>

@end

@implementation ComponentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - 基础属性
// 定时器
-(void)createTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimer) userInfo:nil repeats:true];
    [timer invalidate];
}
-(void)onTimer {
    UILabel *myLabel = [self.view viewWithTag:0];
    myLabel.text = @"我过分";
}
/// UIView
// UIView是所有视图的父类/UIView的属性是子视图共有的
// 1.UIView的基本属性
// 2.父视图/子视图之间的转化
// 3.形变属性
// 4.动画
// 5.停靠模式
-(void)setupView {
    UIView *view = [[UIView alloc]init];
    /// 设置是否能接受事件/UIView默认是true
    // 如果父视图不能接受事件、则子视图不能接受事件
    // 子视图超出父视图部分不能接受事件
    // 如果覆盖上面的视图可以接受事件、则下面视图不会再收到事件
    // UILabel/UIImageView默认是false
    view.userInteractionEnabled = true;
    // 可以控制位置&尺寸
    // 以父控件的左上角为原点
    view.frame = CGRectMake(100, 100, 100, 50);
    // 可以控制尺寸
    // 以自己左上角为坐标原点：x和y永远为0
    view.bounds = CGRectMake(0, 0, 100, 50);
    // 可以控制位置
    // 控件的中心点：以父控件左上角为坐标原点
    view.center = CGPointMake(100, 40);
    // 获取父视图对象：一个视图最多只有一个父视图
    // 一旦一个视图被添加到一个父视图上就会从上一个父视图移除
    UIView *superView = [view superview];
    NSLog(@"%@", NSStringFromCGRect(superView.bounds));
    // 背景颜色
    view.backgroundColor = UIColor.redColor;
    // 获取子控件对象：一个视图可以有多个子视图
    NSArray *subViews = [view subviews];
    // 如果父视图隐藏，子视图也会隐藏
    // 设置父视图alpha = 0.5/子视图alpha = 0.8，则真实alpha = 0.5 * 0.8 = 0.4
    // 一般我们是相对父视图布局：所以父视图移动，子视图跟着移动
    // 先添加到父视图的子视图会被后添加的视图覆盖
    // 一个父视图会有多个子视图、一个子视图只能有一个父视图
    for (view in subViews) {
       NSLog(@"%@", NSStringFromCGRect(view.bounds));
    }
    // 把视图放在最上面
    [self.view bringSubviewToFront:superView];
    // 把视图放在最下面
    [self.view sendSubviewToBack:superView];
    // 交换两个视图位置
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:2];
    // 插入一个视图在另一个视图上面
    [self.view insertSubview:view aboveSubview:superView];
    // 插入一个视图在另一个视图下面
    [self.view insertSubview:view belowSubview:superView];
    // 插入子视图：默认会添加
    [self.view insertSubview:superView atIndex:0];
    // 注意：父视图不能移除子视图
    // 子视图可以从父视图中移除
    [superView removeFromSuperview];
    view.tag = 0;
    /// 形变属性：一次只能利用一个形变属性
    // xxxMakexxx相对于UIView的初始状态进行形变
    // 可以用于动画
    // 缩放形变
    // 0.5 -相对于水平x方向缩放的比例
    // 2 -相对于垂直y方向缩放的比例
    view.transform = CGAffineTransformMakeScale(0.5, 2);
    // 相对于superView进行形变
    view.transform = CGAffineTransformScale(superView.transform, 0.5, 2);
    // 旋转形变
    // 参数是弧度
    view.transform = CGAffineTransformMakeRotation(M_PI);
    /// 平移形变
    // 2 -相对于水平x方向平移
    // 5 -相对于垂直y方向平移
    view.transform = CGAffineTransformMakeTranslation(2, 5);
    /// 渐变动画
    // 只能修改关于坐标系的属性、色彩和透明度
    // 第一种方式：通过delegate/先不实现
    // 第二种方式：通过block
    // 这里不会引起循环引用：为什么？组织一下语言
    // 目前有三种形式：应用也很多
    // 支持嵌套
    [UIView animateWithDuration:2 animations:^{
        // 这里还可以设置形变属性
        NSLog(@"这里可以改变坐标/色彩/透明度");
    } completion:^(BOOL finished) {
        if (finished) {
            NSLog(@"动画完成");
        }
    }];
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
    /*
     NSTextAlignmentRight
     NSTextAlignmentCenter
     NSTextAlignmentLeft
     */
    label.textAlignment = NSTextAlignmentCenter;
    // 自适应宽度：字体会缩小、不会放大
    label.adjustsFontSizeToFitWidth = true;
    label.tag = 0;
    label.hidden = false;
    // 指定label的行数
    label.numberOfLines = 0;
    // 指定换行模式
    label.lineBreakMode = NSLineBreakByWordWrapping;
    /// 阴影
    label.shadowOffset = CGSizeMake(5, 5); // 阴影的偏移量
    label.shadowColor = UIColor.grayColor;// 设置阴影颜色
}
// UIButton
// 有那些类可以"事件监听"
// 继承于UIControl都可以"事件监听"
// UIButton/UITextField/UISlider/UISwitch...
// ！！！需求：将常见UI控件分类（按照父类）！！！
-(void)setupButton {
//    // 尽量使用快速定义方法、如果没有快速定义方法、再考虑init
//    UIButton *btn = [[UIButton alloc]init];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:btn];
    /*
     button有四种状态
     这个很重要：可以用来做很多事情
     UIControlStateNormal -正常状态
     UIControlStateHighlighted -高亮状态/长按
     UIControlStateSelected -选择状态
     UIControlStateDisabled -禁用状态
     */
    [btn setTitle:@"普通" forState:UIControlStateNormal];
    [btn setTitle:@"高亮" forState:UIControlStateHighlighted];
    [btn setTitle:@"选择" forState:UIControlStateSelected];
    [btn setTitle:@"禁用" forState:UIControlStateDisabled];
    btn.selected = false; // 选择状态
    [btn setTitleColor:UIColor.greenColor forState:UIControlStateNormal];
    btn.enabled = true; // 非禁用状态
    /// 背景颜色
    // 仅仅自定义类型有效
    btn.backgroundColor = UIColor.grayColor;
    /// 设置button图像
    // 居中显示在button中央位置
    // 如果按钮足够大、同时设置文字和图片、文字/图片会并列显示
    // 如果按钮不够大、优先显示图像
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    /// 设置背景图像
    // 根据按钮的尺寸拉伸
    [btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    // 点击事件：记下来就好
    // 最多只能携带一个参数
    // TouchUpInside
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)btnAction:(UIButton *)btn {
    NSLog(@"button被点击");
}
// UIImageView -控件
// UIImage -二进制的图像数据
-(void)setupImageView {
    /// 创建图片对象
    // 该方法只能加载占用内存小的图片
    UIImage *image0 = [UIImage imageNamed:@"image_demo"];
    // 打印图片大小
    NSLog(@"%@", NSStringFromCGSize(image0.size));
    /// 如果图片占用内存较大、使用下列方法
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image_demo" ofType:@"png"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIImage *image1 = [UIImage imageWithData:data];
    NSLog(@"%@", image1);
    /// UIImageView
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:imageView];
    imageView.backgroundColor = UIColor.redColor;
    imageView.image = [UIImage imageNamed:@"image_demo"];
    /*
     填充模式：
     UIViewContentModeScaleToFill -拉伸填充/图片会变形/默认
     UIViewContentModeScaleAspectFit -按比例填充/宽|高一边靠近
     UIViewContentModeScaleAspectFill -按比例填满/宽&高全部靠近/会超出
     */
    // 裁剪超出部分
    imageView.clipsToBounds = true;
    /// 帧动画
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"DOVE/image_bg.jpg"]];
    // 拿到数组
    NSMutableArray *photos = [NSMutableArray array];
    for (NSInteger i = 1; i < 19; i++) {
        UIImage *birdImaga = [UIImage imageNamed:[NSString stringWithFormat:@"DOVE.bundle/DOVE %ld", (long)i]];
        [photos addObject:birdImaga];
    }
    // 动画数组
    imageView.animationImages = photos;
    // 动画执行时间
    imageView.animationDuration = 0.5;
    // 播放动画次数/0为无数次
    imageView.animationRepeatCount = 0;
    // 启动动画
    [imageView startAnimating];
//    // 停止动画
//    [imageView stopAnimating];
}
// UITextField/文本框控件
-(void)setupTextField {
    UITextField *tf = [[UITextField alloc]init];
    tf.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:tf];
//    // 这两个方法正好相反
//    [tf removeFromSuperview];
    tf.text = @"我是文本框";
    tf.font = [UIFont systemFontOfSize:20];
    // 文本颜色
    tf.textColor = UIColor.redColor;
    // 文本对齐方式
    tf.textAlignment = NSTextAlignmentLeft;
    // 占位符
    tf.placeholder = @"请输入用户名";
    // 边框类型
    tf.borderStyle = UITextBorderStyleBezel;
    // 宽度自适应
    tf.adjustsFontSizeToFitWidth = true;
    // 开始编辑的时候清除文本框文字
    tf.clearsOnBeginEditing = true;
    // 设置清除UIButton
    tf.clearButtonMode = UITextFieldViewModeAlways;
    // 设置键盘外观
    tf.keyboardAppearance = UIKeyboardAppearanceDark;
    // 设置键盘类型
    tf.returnKeyType = UIReturnKeyDone;
    // 设置密文显示
    tf.secureTextEntry = true;
    // 设置代理
    tf.delegate = self;
    // 变成第一响应者
    [tf becomeFirstResponder];
}
// UITextView
// UISlider/滑块
// UISwitch/开关
// UIStepper
// UISegmentControl/选项卡
// UIAlertView/中间弹窗
// UIActionSheet/底部弹窗
// UIProgressView
// UIActivityIndicatorView/圈圈
// UIWebView/WKWebView
// UIMenuController
// UIPageControl/分页控件
// UIRefreshControl
// UIAlertController
// UIImagePickerController
// UIPickView/选择器
// UIDatePicker/时间选择器
// UIToolBar/工具条
// UINavigationBar/导航条
// UIScrollView/滚动视图
-(void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
}
// UIStackView
// keyBoard
-(void)keyBoard {
    // 强行关闭键盘：设置为YES/NO都可以关闭键盘
    // 但是发生界面死锁NO可能不会关闭、永远设置为NO
    // 只要调用：就可以强制退出键盘
    [self.view endEditing:YES];
}
// UIViewControllView
-(void)setupController {
    // 颜色
    self.view.backgroundColor = UIColor.grayColor;
    /// 跳转
    // 模态跳转
}


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    /// 点击return的时候调用该方法
    // 放弃第一响应者
    [textField resignFirstResponder];
    return true;
}


#pragma mark - UIScrollViewDelegate
/// 通过这三个代理方法可以唯一确定上滑/下滑
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 不管怎么操作：只要拥有偏移量就执行
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    // 停止拖拽的时候执行
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 减速结束的时候执行
}

@end
