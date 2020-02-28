//
//  SyCustomCell.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/2/10.
//  Copyright © 2020 zali. All rights reserved.
//

#import "SyCustomCell.h"

@interface SyTableViewCell ()
// 1.这里使用 weak
@property (weak, nonatomic) UIImageView *iconImageView;

@property (weak, nonatomic) UILabel *titleLabel;

@end

@implementation SyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 2.这里必须这样写
        UIImageView *imageView = [[UIImageView alloc]init];
        [self.contentView addSubview:imageView];
        self.iconImageView = imageView;
        // 也可以这里直接设置尺寸
        // 一般控件只要4个约束就行
        // 必须先添加到父控件->再添加约束
//        // ！！！注意：记住这些写法！！！
//        CGRect rect = self.iconImageView.frame;
//        CGRectGetMaxX(rect);
//        CGRectGetMidX(rect);
//        CGRectGetMinX(rect);
        // 动态 cell
        // 静态 cell
    }
    return self;
}

// 该方法调用必须保证在 -(void)config; 方法之后
// 因为必须有 model 才可以设置坐标
/**
  先调用 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath; 方法以后才会接着
 调用 - (void)layoutSubviews;
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    // 3.这里设置尺寸
    // 也可以在这里设置约束
}

// 赋值方法
// 此处可以使用该方法，也可以使用 setter 方法
// 为防止 “循环引用”：有 if 就会有 else
-(void)config {
    /**
     不想要显示某个控件
     1.移除该控件
     2.将该控件的高度设置为0
     3.设置 hidden = YES/该方法性能最高：因为当 hidden = YES 系统就不再绘制该控件
     */
}

@end
