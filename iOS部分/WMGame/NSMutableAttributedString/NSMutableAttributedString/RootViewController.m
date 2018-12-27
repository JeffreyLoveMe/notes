//
//  RootViewController.m
//  NSMutableAttributedString
//
//  Created by 谢吴军 on 2018/12/21.
//  Copyright © 2018 zali. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     富文本：展示一些特殊形式字符串
     https://www.jianshu.com/p/8c7dd7d8501b
     */
    //1.段落排版
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    style.firstLineHeadIndent = 20;
    style.lineSpacing = 20;
    style.alignment = NSTextAlignmentCenter;
    //2.字体属性：NSFontAttributeName
    //3.字体颜色：NSForegroundColorAttributeName
    //4.字体所在区域背景颜色：NSBackgroundColorAttributeName
    //5.连体属性：NSLigatureAttributeName
    //6.字符间距：NSKernAttributeName
    //7.删除线：NSStrikethroughStyleAttributeName
    //8.删除线颜色：NSStrikethroughColorAttributeName
    //9.下划线：NSUnderlineStyleAttributeName
    //10.下划线颜色：NSUnderlineColorAttributeName
    //11.笔画宽度：NSStrokeWidthAttributeName
    //12.填充部分颜色：NSStrokeColorAttributeName
    //13.阴影属性：NSShadowAttributeName
    //14.字形倾斜度：NSObliquenessAttributeName
    //15.横向拉伸属性：NSExpansionAttributeName
    //16.文字排版方向：NSVerticalGlyphFormAttributeName
    //17.文本特殊效果：NSTextEffectAttributeName
    //18.基线偏移值：NSBaselineOffsetAttributeName
    //19.文字书写方向：NSWritingDirectionAttributeName
    //20.链接属性：NSLinkAttributeName
    //21.文本附件：NSAttachmentAttributeName
    _textLabel.numberOfLines = 0; // 自动换行
    NSString *text = @"我们的家";
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:text];
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:40] range:NSMakeRange(0, 2)];//设置字体大小
    [attr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(2, 2)];//设置字体颜色
}

@end
