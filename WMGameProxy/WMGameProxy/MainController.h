//
//  MainController.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SySkillController.h"

NS_ASSUME_NONNULL_BEGIN
// 中间不需要 ,
@interface MainController : UIViewController <SySkillControllerDelegate>

@property (strong, nonatomic) NSString *mainText;

@end

NS_ASSUME_NONNULL_END
