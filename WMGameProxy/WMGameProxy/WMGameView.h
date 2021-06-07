//
//  WMGameView.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/1/13.
//  Copyright © 2020 zali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMGameView : UIView
// 第一种方式
// 可以通过setter设置数据
@property (strong, nonatomic) UIImageView *icon;
// 第二种方式
// 通过config设置数据
@property (strong, nonatomic) UILabel *name;

@end

NS_ASSUME_NONNULL_END
