//
//  ShopView.m
//  netDemo
//
//  Created by 谢吴军 on 2019/1/31.
//  Copyright © 2019 zali. All rights reserved.
//

#import "ShopView.h"

@interface ShopView ()

@property (strong,nonatomic) UIImageView *iconView; // 头像icon
@property (strong,nonatomic) UILabel *textLabel; // 标题

@end

@implementation ShopView

-(instancetype)init {
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI {
    
    _iconView = [[UIImageView alloc]init];
    _iconView.backgroundColor = UIColor.redColor;
    [self addSubview:_iconView];
    
    _textLabel = [[UILabel alloc]init];
    _textLabel.backgroundColor = UIColor.blueColor;
    [self addSubview:_textLabel];
}



@end
