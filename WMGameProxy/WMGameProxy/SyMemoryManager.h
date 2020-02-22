//
//  SyMemoryManager.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/2/21.
//  Copyright © 2020 zali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SyMemoryManager : NSObject
// 使用 copy 外部修改了字符串不会影响内部
// copy 会判断字符串是不可变字符串还是可变字符串
// 不可变字符串直接赋值
// 可变字符串生成新的对象
@property (copy, nonatomic) NSString *name;

@end

NS_ASSUME_NONNULL_END
