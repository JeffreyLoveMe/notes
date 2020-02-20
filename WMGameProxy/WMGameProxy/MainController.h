//
//  MainController.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import <UIKit/UIKit.h>
///// 不要在这里导入 SySkillController.h，因为这里没有用到 SySkillController.h/m
//#import "SySkillController.h"

// 1.在这里只需要告诉 MainController 类 SySkillControllerProtocol 是一个协议
@protocol SySkillControllerProtocol;

NS_ASSUME_NONNULL_BEGIN
// 中间不需要 ,
@interface MainController: UIViewController <SySkillControllerProtocol>

@property (strong, nonatomic) NSString *mainText;

@end

NS_ASSUME_NONNULL_END
