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
//    // 第一种方式
//    // 1.key 容易写错
//    item.citys = dic[@"citys"];
//    item.name = dic[@"name"];
//    return item;
    
    // 第二种方式
    // 1.字典中的 key 必须在 model 中的属性中找到
    // 2.不适用于 model 中嵌套 model
    // 3.应用场景 - 简单的 字典 转 model ---> MJExtention框架 / JSONModel框架
    // 原理 - 遍历 dic 给每个 dic 赋值
    [item setValuesForKeysWithDictionary:dic]; // KVC
    return item;
}

+(instancetype)itemWithDict:(NSDictionary *)dic {
    return [[self alloc]init];
}
/// 防止 dic 中的 key 在 model 中找不到属性对应崩溃就必须实现以下两个方法
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
- (id)valueForUndefinedKey:(NSString *)key {
    return @"没有key";
}


/// 归档部分 - start - 与上面部分内容无关
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
