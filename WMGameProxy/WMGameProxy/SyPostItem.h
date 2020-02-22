//
//  SyPostItem.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/2/22.
//  Copyright © 2020 zali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SyPostItem : NSObject
// 1.新建字段
// 保持 "属性" 和 "字段" 保持一致
@property (strong, nonatomic) NSArray *citys;
@property (strong, nonatomic) NSString *name;

// 2.字典转模型
// 在 controller 中可以通过 “循环” 创建出更多 model
// 利用 model 可以实现数据源
-(instancetype)itemWithDict:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
