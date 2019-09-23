//
//  SySkillController.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/8/5.
//  Copyright © 2019 zali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// 1.定义delegate
@protocol SySkillControllerDelegate <NSObject>

-(void)jumpPage:(NSString *)text;

@end

@interface SySkillController : UIViewController

@property (weak, nonatomic) id <SySkillControllerDelegate> delegate;

// 1.定义block
// block和delegate的区别：block紧凑一些
@property (copy, nonatomic) void (^myBlock)(BOOL isBlue);

-(void)shouGIF;

@end

NS_ASSUME_NONNULL_END
