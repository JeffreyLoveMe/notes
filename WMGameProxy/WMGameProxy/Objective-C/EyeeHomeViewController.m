//
//  EyeeHomeViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2018/12/21.
//  Copyright © 2018 zali. All rights reserved.
//

#import "EyeeHomeViewController.h"
#import "EyeeNetworkController.h"
#import "UIImage+animatedGIF.h" //category

@interface EyeeHomeViewController () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate, UIActionSheetDelegate>

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
    /*
     UIButton的四种状态：很重要
     normal
     highlight
     select
     disable
     */
    // 每种状态都可以设置文字|也可以不设置文字
    // 可以根据各种状态：修改UIButton的文字|图片|颜色
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(25, 150, 100, 50)];
    [self.view addSubview:btn];
    [btn setTitle:@"normal" forState:UIControlStateNormal]; // 普通状态
    [btn setTitle:@"highlight" forState:UIControlStateHighlighted]; // 按下的时候
    [btn setTitle:@"select" forState:UIControlStateSelected]; // btn.selected = YES;
    [btn setTitle:@"disable" forState:UIControlStateDisabled]; // btn.enabled = NO;
    [btn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    btn.titleLabel.adjustsFontSizeToFitWidth = YES;
    btn.backgroundColor = UIColor.redColor;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}
    
-(void)btnAction:(UIButton *)btn {
    // 获取UILabel
    UILabel *label = [self.view viewWithTag:100];
    label.text = @"xxx";
    
    // 模态跳转
    EyeeNetworkController *controller = [[EyeeNetworkController alloc]init];
    /*
     跳转动画：
     UIModalTransitionStyleCoverVertical = 0
     UIModalTransitionStyleFlipHorizontal
     UIModalTransitionStyleCrossDissolve
     UIModalTransitionStylePartialCurl
     */
    controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:controller animated:YES completion:^{
        
    }];
    
}

#pragma mark -- UIView(UIView是所有控件的父控件)
-(void)setupView {
    //1.创建UIView
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(25, 150, 100, 50)];
    //2.添加到父视图
    [self.view addSubview:view];
    //3.设置背景颜色
    view.backgroundColor = [UIColor blueColor];
    //4.0.以自己为坐标系：相对于自己
    view.bounds = CGRectMake(0, 0, 150, 50);
//    //4.1.以父视图为坐标原点
//    view.frame = CGRectMake(25, 150, 100, 50);
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
    tf.font = [UIFont systemFontOfSize:15];// 设置字体
    tf.textColor = [UIColor redColor]; // 设置文本颜色
    tf.textAlignment = NSTextAlignmentCenter; // 设置对齐方式
    tf.placeholder = @"请输入名字"; // 设置占位符
    tf.borderStyle = UITextBorderStyleBezel; // 设置边框类型
    tf.adjustsFontSizeToFitWidth = YES; // 设置宽度自适应
    tf.clearsOnBeginEditing = YES; // 开始编辑的时候清除文本框内容
    tf.clearButtonMode = UITextFieldViewModeAlways; // 设置清除UIButton
    tf.secureTextEntry = YES; // 设置密文模型
    tf.keyboardType = UIKeyboardTypeNumberPad; // 设置键盘类型
    tf.keyboardAppearance = UIKeyboardAppearanceDark; // 设置键盘外观
    tf.returnKeyType = UIReturnKeyNext; // 设置返回键类型
    tf.tag = 10;
    tf.delegate = self;
}

#pragma mark -- UITextFieldDelegate
// 当键盘点击return键的时候调用该方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // 文本框放弃第一响应者：什么意思？
    [textField resignFirstResponder];
    return YES;
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
        UIImage *birdImage = [UIImage imageNamed:[NSString stringWithFormat:@"DOVE %ld",(long)index]];
        [array addObject:birdImage];
    }
    image.animationImages = array; // 动画数组
    image.animationDuration = 0.5; //动画执行时间
    image.animationRepeatCount = 0; //动画执行次数：0是循环执行
    [image startAnimating]; // 开始执行动画
//    [image stopAnimating];
}
    
#pragma mark -- 图片加载
-(void)loadPhoto {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];// 一般使用自定义UIButton
    btn.frame = CGRectMake(25, 150, 100, 50);
    [self.view addSubview:btn];
    // 只能加载小图片|使用该方法加载的图片一直存在内存中、不会释放
    UIImage *image = [UIImage imageNamed:@"1.png"];
    [btn setImage:image forState:UIControlStateNormal];
    // 如果图片占用内存较大，使用该方法
    NSString *path = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"png"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIImage *image_01 = [UIImage imageWithData:data];
    [btn setImage:image_01 forState:UIControlStateHighlighted];
}

#pragma mark -- gif
-(void)setupGif {
    UIImageView *gifImageView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 150, 100, 50)];
    gifImageView.image = [UIImage animatedImageWithAnimatedGIFURL:[[NSBundle mainBundle] URLForResource:@"FlagZombie" withExtension:@"gif"]];
    [self.view addSubview:gifImageView];
}

#pragma mark --基本控件
-(void)setupUI {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", @"OK", nil];
    alert.alertViewStyle = UIAlertViewStyleDefault; // 有多种类型
    [alert show];
}

#pragma mark -- UIScrollView
-(void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
}

#pragma mark -- UITableView
-(void)setupTableView {
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.rowHeight = 200; // 一般不要设置：内容自适应
    
    tableView.separatorColor = UIColor.lightGrayColor; // 设置分割线颜色
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone; // 设置分割线样式
    // 设置UITableViewd头部视图：高度起作用
    tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    // 设置UITableViewd尾部视图：高度|横坐标起作用
    tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 100)];
    
    tableView.delegate = self;
    tableView.dataSource = self;
}
    
#pragma mark -- UITableViewDelegate|UITableViewDataSource

// 返回分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 返回分区有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}

// 返回row的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

// 设置分区头标题的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

// 设置分区尾标题的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 100;
}

// 设置分区的头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"大佬";
}

// 设置分区的尾标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"我是谢吴军";
}

// 设置右侧索引
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return @[@"A",@"V",@"F"];
}

// 响应事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击row");
}

// 取消选中状态
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true]; // 取消选中状态：这个会发生死循环？？？
}

#pragma mark -- NSTimer
-(void)setupTimer {
    //1.创建NSTimer
    //    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

-(void)onTimer {
    UILabel *label = [self.view viewWithTag:1];
    label.text = @"定时器";
}

@end
