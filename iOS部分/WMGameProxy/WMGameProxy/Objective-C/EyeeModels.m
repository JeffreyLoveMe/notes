//
//  EyeeModels.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/2/3.
//  Copyright © 2019 zali. All rights reserved.
//

#import "EyeeModels.h"
#import "EyeeCommunity.h"

@implementation EyeeModels

// 数组
-(void)showArray {
    // init创建空数组
    NSMutableArray *array01 = [NSMutableArray array];
    NSMutableArray *array02 = [[NSMutableArray alloc]init];
    // nil表示结束
    // 对于可变数组nil不能省略
    array01 = [[NSMutableArray alloc]initWithObjects:@"123",@"144", nil];
    // 类方法
    array02 = [NSMutableArray arrayWithObject:@"s1"];
    array02 = [NSMutableArray arrayWithObjects:@"s1",@"s2",@"s3",nil];
    // 添加元素：最后面添加
    [array01 addObject:@"123"];
    // 插入元素：向可变数组插入
    [array01 insertObject:@"123" atIndex:1];
    
}

-(void)showAll {
    /*
     [EyeeCommunity alloc] // 创建对象：返回对象的地址|堆空间
     init // 初始化对象：返回对象的地址
     */
//    EyeeCommunity *community = [[EyeeCommunity alloc]init]; // 创建对象同时init
    EyeeCommunity *community = [EyeeCommunity alloc]; // 类方法
    community = [community init]; // 对象方法
    
    [community onLine:18]; // [对象指针 对象方法名]
    
}

@end
