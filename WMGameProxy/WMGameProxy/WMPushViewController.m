//
//  WMPushViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/17.
//  Copyright © 2020 zali. All rights reserved.
//

#import "WMPushViewController.h"

@interface WMPushViewController ()

@end

@implementation WMPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
}


#pragma mark - 本地通知
// 发送通知
-(void)sendNotification {
    // 需要主动的请求授权才可以发送本地通知
    // 该方法一般放在 AppDelegate.h 中 - 表示程序一启动就主动请求授权
    if (@available(iOS 8.0, *)) {
        // 创建一组操作行为
        UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
        // 设置组标识
        category.identifier = @"select";
        // 设置组的操作行为
        UIMutableUserNotificationAction *actionA = [[UIMutableUserNotificationAction alloc]init];
        actionA.identifier = @"A";
        actionA.title = @"同意";
        UIMutableUserNotificationAction *actionB = [[UIMutableUserNotificationAction alloc]init];
        actionB.identifier = @"B";
        actionB.title = @"撤回";
        NSArray *array = @[actionA, actionB];
        /**
         UIUserNotificationActionContextDefault - 代表最多可以显示4个
         UIUserNotificationActionContextMinimal - 代表最多可以显示2个
         */
        [category setActions:array forContext:UIUserNotificationActionContextDefault];
        NSSet *categories = [NSSet setWithObject:category];
        UIUserNotificationSettings *set = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:categories];
        [[UIApplication sharedApplication] registerUserNotificationSettings:set];
    }
    if (@available(iOS 10.0, *)) {
        
    } else {
        // 1.创建本地通知
        UILocalNotification *notice = [[UILocalNotification alloc]init];
        // 设置本地通知必选项
        notice.alertBody = @"顺子要不要";
        // 设置本地通知的发送时间
        notice.fireDate = [NSDate dateWithTimeIntervalSinceNow:2];
        // 设置重复周期
        notice.repeatInterval = NSCalendarUnitMinute;
        // 设置锁屏滑动文字
        notice.alertAction = @"回复";
        // 启动图片/直接填写图片名称
        notice.alertLaunchImage = @"DOVE.png";
        // 设置通知弹窗的标题
        // 只对 “通知中心” 有效
        notice.alertTitle = @"斗地主";
        // 设置通知的声音
        notice.soundName = @"win.mp3";
        // 设置图标右上角的数字
        notice.applicationIconBadgeNumber = 10;
        // 2.发送本地通知
        [[UIApplication sharedApplication] scheduleLocalNotification:notice];
    }
    // 查看通知
    NSLog(@"%@", [[UIApplication sharedApplication] scheduledLocalNotifications]);
}
// 取消发送
-(void)cancelNotification {
    // 取消所有的计划通知
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}


#pragma mark - 远程通知

@end
