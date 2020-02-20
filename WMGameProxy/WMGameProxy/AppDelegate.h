//
//  AppDelegate.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

// UIWindow是一种特殊的 UIView
// 每个App至少一个 UIWindow：一般只创建一个
// 启动原理： iOS程序启动完毕以后创建的第一个 UIView 就是 UIWindow->接着创建 view 加到 UIWindow
// 包含App中的可视化内容
// keyWindow：用来管理键盘以及非触摸类的消息，只能有一个
// UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
// UIWindow有3个级别：UIWindowLevelAlert > UIWindowLevelStatusBar > UIWindowLevelNormal
@property (strong, nonatomic) UIWindow *window;


@end

