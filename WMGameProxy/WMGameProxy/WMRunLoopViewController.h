//
//  WMRunLoopViewController.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/25.
//  Copyright © 2020 zali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 0.RunLoop
 1>.概念 - 运行循环/实质是一个死循环
 2>.作用 - 保持程序的持续运行（ UIApplicationMain方法中开启RunLoop ）/处理App中的各种事件
 */
/**
 1.RunLoop与线程
 1>.每条线程都有唯一的一个与之对应的RunLoop对象/一一对应
 2>.主线程的RunLoop已经自动创建完成/子线程的RunLoop需要主动创建
 3>.RunLoop在第一次获取的时候创建，线程结束的时候销毁
 */
@interface WMRunLoopViewController : UIViewController

@end

NS_ASSUME_NONNULL_END