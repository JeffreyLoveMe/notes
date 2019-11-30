//
//  SySkillController.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/8/5.
//  Copyright © 2019 zali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// 1.定义代理delegate/协议protocol
// 协议本身不是类
// 类似java中的接口
// 作用：给类增加方法（外部可以用类的对象调用该协议方法）
// 规范方法的声明：可以实现多继承和对象间通信
// 只声明方法不实现方法/也不能实现属性
// 遵从协议的类必须导入协议头文件
// 可以实现多继承
// 父类遵循某个协议子类也遵循该协议
@protocol SySkillControllerDelegate <NSObject>
// 必须实现协议
// 缺省
@required
-(void)jumpPage:(NSString *)text;
// 可选实现协议
@optional
-(void)finishTask;

@end

@interface SySkillController : UIViewController
// 委托方：持有协议/该类就是委托方
// 使用weak防止内存泄漏？？？说明原因？？？/会被赋值成xxx
// 代理方：遵从协议、实现方法
// 持有协议的id指针
// 不能retain
@property (weak, nonatomic) id <SySkillControllerDelegate> delegate;

// 1.定义block
// block和delegate的区别：block紧凑一些
@property (copy, nonatomic) void (^myBlock)(BOOL isBlue);

-(void)shouGIF;

@end

NS_ASSUME_NONNULL_END
