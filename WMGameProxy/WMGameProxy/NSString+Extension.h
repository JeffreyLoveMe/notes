//
//  NSString+Extension.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/10/23.
//  Copyright © 2019 zali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)
// 可以扩展原有类的方法
// 可以重写原有类的方法
// 不能添加属性（实例变量）：有方法可以添加（高级部分）
-(void)validateEmail;

@end

NS_ASSUME_NONNULL_END
