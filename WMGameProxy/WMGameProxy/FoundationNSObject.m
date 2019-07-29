//
//  FoundationNSObject.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/7/22.
//  Copyright © 2019 zali. All rights reserved.
//

#import "FoundationNSObject.h"

@implementation FoundationNSObject

/// Foundation框架提供很多官方Api
-(void)showString {
    // 1.字符串
    // 1).不可变字符串
    // 只有官方类才能这样创建
    NSString *str0 = @"iOS";
    // 通过一个字符串创建另一个字符串
    NSString *str1 = [[NSString alloc]initWithString:str0];
    NSString *str2 = [NSString stringWithString:str1];
    NSLog(@"%@", str2);
    // 将C语言字符串转OC字符串
    
    
    // 2).可变字符串
}

-(void)showArray {
    
}

-(void)showDictionary {
    
}






// 2.数组
// 3.字典

@end
