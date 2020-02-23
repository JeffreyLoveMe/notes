//
//  SyPostItem.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/2/22.
//  Copyright © 2020 zali. All rights reserved.
//

#import "SyPostItem.h"

@implementation SyPostItem

-(instancetype)itemWithDict:(NSDictionary *)dic {
    SyPostItem *item = [[SyPostItem alloc]init];
    // 第一种方式
    [item setValuesForKeysWithDictionary:dic];
    return item;
//    // 第二种方式
//    item.citys = dic[@"citys"];
//    item.name = dic[@"name"];
//    return item;
}


/// 归档部分 - start - 与上面部分内容无关
/// 归档
// 告诉需要保存当前对象的哪些属性
- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.citys forKey:@"citys"];
    [coder encodeObject:self.name forKey:@"name"];
}
// 当解析一个文件的时候调用
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.citys = [coder decodeObjectForKey:@"citys"];
        self.name = [coder decodeObjectForKey:@"name"];
    }
    return self;
}
/// 归档部分 - end - 与下面部分内容无关

@end
