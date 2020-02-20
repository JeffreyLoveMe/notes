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

- (void)layoutSubviews {
    [super layoutSubviews];
    // 3.这里设置尺寸
    // 也可以在这里设置约束
}

@end
