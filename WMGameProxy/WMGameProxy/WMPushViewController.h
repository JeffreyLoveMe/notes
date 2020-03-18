//
//  WMPushViewController.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/17.
//  Copyright © 2020 zali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 1.推送通知
 1>.概念 - 向用户发送一条消息来通知用户某件事情
 2>.NSNotification是抽象的一种模式/推送通知是可见的
 3>.推送通知可以在App退到后台/App关闭发送消息告诉用户
 */
/**
 2.推送分类
 1>.本地推送 - 不用联网也可以推送通知消息/开发人员负责在App内发送/确定在未来某个时间点应该提醒用户做什么
 2>.远程推送 - 必须在联网情况下才会向用户推送通知消息/服务器通过 "远程推送服务APNs" 发送
 */
/**
 3.推送通知的呈现效果设置 - 由用户自行设置（设置 - 通知中心）/开发人员无法由代码确认
 */

@interface WMPushViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
