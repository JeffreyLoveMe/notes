//
//  WMGameView.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/1/13.
//  Copyright © 2020 zali. All rights reserved.
//

#import "WMGameView.h"

@implementation WMGameView

/// 1.通过该方法 init 控件
// 然后直接 frame 在该方法中拿不到尺寸
- (instancetype)init {
    self = [super init];
    if (self) {
//        [self layoutSubviews];
        // 在这里 init
    }
    return self;
}

/// 2.通过该方法 init 控件
// 可以直接拿到 frame
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 这里添加控件
    }
    return self;
}

/// 如果子控件从 xib 中创建则处于未唤醒状态
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}
/// 从 xib 中唤醒
// 添加 xib 中子控件的子控件
- (void)awakeFromNib {
    [super awakeFromNib];
    
}

/// 通过 "方法1" 只能在该方法中拿到 frame
// 必须到这里布局子控件
- (void)layoutSubviews {
    // 0.一定要调用super
    [super layoutSubviews];
    // 在这里布局
}

@end
