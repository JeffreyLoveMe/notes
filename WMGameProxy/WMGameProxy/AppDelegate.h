//
//  AppDelegate.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

/// 每个App至少一个UIWindow：一般只创建一个
// 包含App中的可视化内容
// keyWindow：用来管理键盘以及非触摸类的消息、只能有一个
// UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
// UIWindow有3个级别：UIWindowLevelAlert > UIWindowLevelStatusBar > UIWindowLevelNormal
@property (strong, nonatomic) UIWindow *window;


@end

