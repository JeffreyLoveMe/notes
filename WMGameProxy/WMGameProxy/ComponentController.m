//
//  ComponentController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/7/31.
//  Copyright © 2019 zali. All rights reserved.
//

#import "ComponentController.h"
#import "SySkillController.h"

@interface ComponentController () <UITextFieldDelegate, UIAlertViewDelegate, UIActionSheetDelegate, UIScrollViewDelegate>

@end

@implementation ComponentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTextField];
}

#pragma mark - 基础属性
/// 定时器
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
// 0.以父视图左上角为原点
// 1.UIView的基本属性
// 2.父视图/子视图之间的转化
// 3.形变属性
// 4.动画
// 5.停靠模式
-(void)setupView {
    UIView *view = [[UIView alloc]init];
    /// 坐标系
    // 结构体
//    CGPoint point = CGPointMake(100, 100);
//    CGSize size = CGSizeMake(100, 100);
//    CGRect rect = CGRectMake(100, 100, 100, 100);
    /// 设置是否能接受事件/UIView默认是true
    // 如果父视图不能接受事件、则子视图不能接受事件
    // 子视图超出父视图部分不能接受事件
    // 如果覆盖上面的视图可以接受事件、则下面视图不会再收到事件
    // UILabel/UIImageView默认是false
    view.userInteractionEnabled = true;
    // 是否开启多点触摸
    view.multipleTouchEnabled = true;
    // 可以控制位置&尺寸
    // 以父控件的左上角为原点
    view.frame = CGRectMake(100, 100, 100, 50);
    // 可以控制尺寸
    // 以自己左上角为坐标原点：x和y永远为0
    view.bounds = CGRectMake(0, 0, 100, 50);
    // 可以控制位置
    // 控件的中心点：以父控件左上角为坐标原点
    // 默认情况下：子视图的边框不会被父视图的边框裁剪
    view.center = CGPointMake(100, 40);
    // 获取父视图对象：一个视图最多只有一个父视图
    // 一旦一个视图被添加到一个父视图上就会从上一个父视图移除
    UIView *superView = [view superview];
    NSLog(@"%@", NSStringFromCGRect(superView.bounds));
    /// 背景颜色
    // 这个已经封装
    view.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
    /// 0-透明、1-不透明
    // 如果设置为0则不响应事件：所以一般不设置View透明度、而设置View背景透明度
    view.alpha = 0;
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
    }];
    [UIView animateWithDuration:2 animations:^{
        // 这里还可以设置形变属性
        NSLog(@"这里可以改变坐标/色彩/透明度");
    } completion:^(BOOL finished) {
        if (finished) {
            NSLog(@"动画完成");
        }
    }];
    /// UIViewAnimationOptions - 动画属性设置
    // https://www.jianshu.com/p/ec73573e112a
    [UIView animateWithDuration:2 delay:0.5 options:UIViewAnimationOptionOverrideInheritedCurve animations:^{
        // 这里还可以设置形变属性
        NSLog(@"这里可以改变坐标/色彩/透明度");
    } completion:^(BOOL finished) {
        if (finished) {
            NSLog(@"动画完成");
        }
    }];
}
/// UILabel
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
    // 必须设置偏移量
    label.shadowOffset = CGSizeMake(5, 5); // 阴影的偏移量
    label.shadowColor = UIColor.grayColor;// 设置阴影颜色
}
/// UIButton
// 有那些类可以"事件监听"？？？
// 继承于UIControl都可以"事件监听"
// UIButton/UIDatePicker/UIPageControl/UISegmentControl/UITextField/UISlider/UISwitch
// ！！！需求：将常见UI控件分类（按照父类）！！！
-(void)setupButton {
//    // 尽量使用快速定义方法、如果没有快速定义方法、再考虑init
//    UIButton *btn = [[UIButton alloc]init];
    /// 工厂方法
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
    btn.selected = YES; // 选择状态
    [btn setTitleColor:UIColor.greenColor forState:UIControlStateNormal]; // 文字颜色
    btn.enabled = NO; // 非禁用状态
    /// 背景颜色
    // 仅仅自定义类型有效
    btn.backgroundColor = UIColor.grayColor;
    /// 设置button图像：内容图像
    // 居中显示在button中央位置
    // 如果按钮足够大、同时设置文字和图片、文字/图片会并列显示
    // 如果按钮不够大、优先显示图像
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    /// 设置背景图像
    // 根据按钮的尺寸拉伸
    [btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    // 内边距
    btn.contentEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, 0); // 内容
    btn.imageEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, 0); // 图片
    btn.titleEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, 0); // title
    // 点击事件：记下来就好
    // 最多只能携带一个参数
    // TouchUpInside
    /*
     // 基于触摸
     UIControlEventTouchDown // 用户按下时触发
     UIControlEventTouchDownRepeat // 点击次数大于1时触发
     UIControlEventTouchDragInside // 当触摸在控件内拖动时触发
     UIControlEventTouchDragOutside // 当触摸在控件外拖动时触发
     UIControlEventTouchDragEnter // 当触摸在控件外拖动到控件内时触发
     UIControlEventTouchDragExit // 当触摸在控件内拖动到控件外时触发
     UIControlEventTouchUpInside // 控件内部触摸抬起时(☑️)
     UIControlEventTouchUpOutside // 控件外部触摸抬起时
     UIControlEventTouchCancel // 触摸取消事件：设置上锁、电话呼叫中断等
     // 基于值
     UIControlEventValueChanged // 当控件的值发生改变：一般用于滑块和分段视图(☑️)
     // 基于编辑
     UIControlEventEditingDidBegin // 文本控件开始编辑时
     UIControlEventEditingChanged  // 文本控件中文本发生改变时
     UIControlEventEditingDidEnd // 文本控件中编辑结束时
     UIControlEventEditingDidEndOnExit // 文本控件内通过按下回车键结束编辑时
     UIControlEventAllTouchEvents // 所有触摸事件
     UIControlEventAllEditingEvents //文本编辑的所有事件
     UIControlEventAllEvents // 所有事件
     */
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    // 移除某个事件
    [btn removeTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)btnAction:(UIButton *)btn {
    NSLog(@"button被点击");
}
/// UIImageView -控件
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
     UIViewContentModeScaleToFill - 拉伸填满/不会超出：图片会变形/默认
     UIViewContentModeScaleAspectFit -按比例填充/宽、高一边靠近
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
/// UITextField/文本框控件
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
    tf.keyboardType = UIKeyboardTypeNumberPad;
    tf.returnKeyType = UIReturnKeyDone;
    // 设置密文显示
    tf.secureTextEntry = true;
    // 自动大写类型
    tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
    // 设置代理
    tf.delegate = self;
    // 变成第一响应者
    [tf becomeFirstResponder];
    /// 自定义清除按钮
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    view.backgroundColor = UIColor.yellowColor;
    tf.rightView = view;
    tf.rightViewMode = UITextFieldViewModeWhileEditing;
    /// 自定义键盘
    // 一般银行App使用较多
    UIView *csView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 20)];
    csView.backgroundColor = UIColor.redColor;
    tf.inputView = csView;
    // 自定义键盘Bar
    UIView *barView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 44)];
    barView.backgroundColor = UIColor.blueColor;
    tf.inputAccessoryView = barView;
}
// UITextView
// UISlider/滑块
// UISwitch/开关
// UIStepper
// UISegmentControl/选项卡
/// UITextView
-(void)setupTextView {
    
}
/// UISlider/滑块
-(void)setupSlider {
    UISlider *slider = [[UISlider alloc]init];
    slider.frame = CGRectMake(100, 100, 100, 50);
    slider.maximumValue = 100; // 设置最大值
    slider.minimumValue = 0;   // 设置最小值
    slider.value = 20;  // 设置当前值
    // 设置颜色
    slider.maximumTrackTintColor = UIColor.purpleColor;
    slider.minimumTrackTintColor = UIColor.blueColor;
    slider.thumbTintColor = UIColor.greenColor;
    // 设置图片
    slider.maximumValueImage = [UIImage imageNamed:@""]; // 右边（最大）图片
    slider.minimumValueImage = [UIImage imageNamed:@""]; // 左边（最小）图片
    [slider setThumbImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    slider.continuous = NO; // 不接受连续点击
    // 滑块拖动时的事件
    [slider addTarget:self action:@selector(onSliderChanged:) forControlEvents:UIControlEventValueChanged];
    // 滑块拖动后的事件
    // 一般都选择UIControlEventTouchUpInside
    [slider addTarget:self action:@selector(onSliderUp:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)onSliderChanged:(UISlider *)slider {
    NSLog(@"滑块拖动时的事件");
}
-(void)onSliderUp:(UISlider *)slider {
    NSLog(@"滑块拖动后的事件");
}
/// UISwitch/开关
-(void)setupSwitch {
    UISwitch *sw = [[UISwitch alloc]init];
    sw.frame = CGRectMake(100, 100, 100, 50);
    sw.on = true; // 是否打开
    sw.onTintColor = UIColor.orangeColor;
    sw.tintColor = UIColor.greenColor;
    sw.thumbTintColor = UIColor.purpleColor;
    [sw addTarget:self action:@selector(onSwitchChange:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)onSwitchChange:(UISwitch *)sw {
    NSLog(@"打开开关");
}
/// UIStepper/步数器
-(void)setupStepper {
    
}
/// UISegmentControl/多段选择视图
>>>>>>> a948d57d93e373466ffd1feda10064e35f0eaee0
-(void)setupSegmentControl {
    
}
///// UIAlertView/中间弹窗
//// 不需要添加到父试图/不需要设置坐标
//-(void)setupAlertView {
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"输入密码错误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",@"OK", nil];
//    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
//    [alert show];
//}
// UIActionSheet/底部弹窗
-(void)setupActionSheet {
    
}
// UIProgressView
// UIActivityIndicatorView/圈圈
// UIWebView/WKWebView
// UIMenuController
// UIRefreshControl
// UIAlertController
// UIImagePickerController
// UIPickView/选择器
// UIDatePicker/时间选择器
// UIToolBar/工具条
// UINavigationBar/导航条
///// UIActionSheet/底部弹窗
//-(void)setupActionSheet {
//    UIActionSheet *alert = [[UIActionSheet alloc]initWithTitle:@"你确定需要删除吗？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles:@"确定", nil];
//    [alert showInView:self.view];
//}
/// UIProgressView/进度条
-(void)setupProgressView {
    UIProgressView *progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    progressView.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:progressView];
    // 当前进度
    progressView.progress = 0.5;
    progressView.tag = 0;
    progressView.progressTintColor = UIColor.orangeColor;
}
/// UIActivityIndicatorView/活动指示器
-(void)setupActivityIndicatorView {
    UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    view.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:view];
    view.hidesWhenStopped = YES;
    // 开始动画
    [view startAnimating];
//    // 结束动画
//    [view stopAnimating];
}
/// UIMenuController
/// UIRefreshControl
/// UIAlertController
/// UIImagePickerController
/// UIPickView/选择器
/// UIDatePicker/时间选择器
/// UIToolBar/工具条
/// UINavigationBar/导航条
>>>>>>> a948d57d93e373466ffd1feda10064e35f0eaee0
/// UIScrollView/滚动视图
// 用于显示超出App程序窗口大小的内容
// 允许用户通过拖动手势滚动查看内容
// 允许用户通过捏合手势缩放内容
-(void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.backgroundColor = UIColor.grayColor; // 设置颜色
    scrollView.contentOffset = CGPointZero; // 偏移量：内容和控件的距离/记录滚动的位置
    scrollView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);  // 内边距：cell到边的距离/增加
    scrollView.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width * 2, [[UIScreen mainScreen] bounds].size.height);  // 设置内容大小
    scrollView.bounces = NO;  // 设置是否反弹
    scrollView.pagingEnabled = NO; // 设置按页滚动
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite; // 设置滚动条样式
    scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 30); // 一般不需要设置
    // 设置隐藏滚动条
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.scrollEnabled = true; // 设置是否可以滚动
    scrollView.scrollsToTop = true;  // 是否滚动到顶部
    scrollView.delegate = self;
    //！！！以下一般不设置！！！//
    /// 设置缩放功能：需要两步
    // 1.设置pinch缩放属性
    scrollView.minimumZoomScale = 0.5; // 缩小的最小比例
    scrollView.maximumZoomScale = 5;    // 放大的最大比例
    // 减速率：一般数值越大、停下来的时间越长
    scrollView.decelerationRate = 0;
    // 按住手指还没有开始拖动是YES
    // 是否正在被拖拽
    // 是否正在减速
    // 是否正在缩放
    NSLog(@"%d, %d, %d, %d", scrollView.tracking, scrollView.dragging, scrollView.decelerating, scrollView.zooming);
    [self.view addSubview:scrollView];
}
/// UIPageControl/分页控件
-(void)setupPageControl {
    // UIPasteboard
    UIPageControl *pc = [[UIPageControl alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    pc.currentPage = 5;  // 当前页码
    pc.numberOfPages = 10; // 总共页码
    pc.hidesForSinglePage = YES; // 只有一页时是否隐藏视图
    pc.pageIndicatorTintColor = UIColor.greenColor; // 控件颜色
    pc.currentPageIndicatorTintColor = UIColor.orangeColor; // 当前选中颜色
    [pc addTarget:self action:@selector(updatePageChanged:) forControlEvents:UIControlEventValueChanged];
    pc.tag = 100;
    [self.view addSubview:pc];
}
-(void)updatePageChanged:(UIPageControl *)pc {
    NSLog(@"%ld", (long)pc.currentPage);
}
/// UIStackView
-(void)setupStackView {
    
}
/// UIPopoverContrller
// 继承于NSObject
-(void)setupPopoverContrller {
    
}
/// keyBoard
-(void)keyBoard {
    // 强行关闭键盘：设置为YES/NO都可以关闭键盘
    // 但是发生界面死锁NO可能不会关闭、永远设置为NO
    // 只要调用：就可以强制退出键盘
    [self.view endEditing:YES];
}
/// UIViewControllView
// UITabBarController
// UINavigationController
// ？？？先执行init()方法、还是先执行loadView()？？？
-(void)setupController {
    // 颜色
    self.view.backgroundColor = UIColor.grayColor;
    /// 跳转
    // 模态跳转
    SySkillController *conroller = [[SySkillController alloc]init];
    conroller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:conroller animated:YES completion:^{
        NSLog(@"模态跳转");
    }];
    // push
}
/// UIGestureRecognizer
// 事件传递流程：当前视图->视图控制器->窗口->UIApplication对象->不处理
-(void)setupGestureRecognizer {
    

    
}
/// 停靠模式
// 主要处理父子视图
-(void)setupAutoresize {
    // 创建父视图
    UIView *superView = [[UIView alloc] init];
    superView.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:superView];
    // 创建子视图
    UIView *subView = [[UIView alloc] init];
    subView.frame = CGRectMake(0, 0, 50, 25);
    [superView addSubview:subView];
    // 设置停靠模式
    subView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
>>>>>>> a948d57d93e373466ffd1feda10064e35f0eaee0
}


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    /// 能否能够开始编辑
    // YES代表可以成为第一响应者
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    // 开始编辑
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    /// 是否能够结束编辑
    // NO代表可以失去第一响应者
    return NO;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    // 结束编辑
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    /// 点击return的时候调用该方法
    // 放弃第一响应者
    [textField resignFirstResponder];
    return true;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return YES;
}

/// ！！！重点！！！
// xxx
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return YES;
}


//#pragma mark - UIAlertViewDelegate
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    // 点击第几个button
//}

//#pragma mark - UIActionSheetDelegate
//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
//    // 点击第几个button
//}
//
//- (void)actionSheetCancel:(UIActionSheet *)actionSheet {
//    // 有系统事件（来电）时调用
//}

#pragma mark - UIScrollViewDelegate
/// 1&2&3 -通过这三个代理方法可以唯一确定上滑/下滑
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 1.不管怎么操作：只要拥有偏移量就执行
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    // 2.停止拖拽的时候执行
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 3.减速结束的时候执行
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 将要拖动的时候执行
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    // 将要减速的时候执行
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    // 是否允许回到顶部：一般不用设置
    return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    // 已经回到顶部开始执行
}

//！！！以下处理缩放逻辑！！！//
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    // 2.设置对哪个视图缩放、返回缩放的视图对象
    return scrollView.subviews.firstObject;
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    // 将要开始缩放
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    // 已经开始缩放/正在缩放
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    // 已经结束缩放
}

@end
