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

@end
