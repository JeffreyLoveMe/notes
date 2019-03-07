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
