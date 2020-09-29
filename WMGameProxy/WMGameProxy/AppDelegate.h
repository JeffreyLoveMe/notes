//
//  AppDelegate.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

/**
 1.UIWindow
 1>.https://www.jianshu.com/p/af2a6a438a0a - 可以重写UIWindow
 2>.UIWindow是一种特殊的 UIView
 3>.每个App至少一个UIWindow：一般只创建一个
 4>.启动原理：iOS程序启动完毕以后创建的第一个UIView就是UIWindow -> 接着创建 view 加到 UIWindow
 5>.包含 App 中的可视化内容
 6>.keyWindow：用来管理键盘以及非触摸类的消息，只能有一个
 7>.UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
 8>.UIWindow有3个级别：UIWindowLevelAlert > UIWindowLevelStatusBar > UIWindowLevelNormal
 */
@property (strong, nonatomic) UIWindow *window;


@end

