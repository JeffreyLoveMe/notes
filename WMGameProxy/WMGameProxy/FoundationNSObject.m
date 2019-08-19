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
// 1.NSString
-(void)showString {
    // 1).不可变字符串
    // 只有官方类才能这样创建
    NSString *str0 = @"iOS";
    // 通过一个字符串创建另一个字符串
    NSString *str1 = [[NSString alloc]initWithString:str0];
    NSString *str2 = [NSString stringWithString:str1];
    NSLog(@"%@", str2);
    // 将C语言字符串转OC字符串
    NSString *str3 = [[NSString alloc]initWithUTF8String:"我是c语言字符串"];
    //const char *c = [str3 UTF8String]; // 这是C语言字符串
    // 拼接字符串：很重要
    NSString *str4 = [[NSString alloc]initWithFormat:@"我是万能拼接字符串：%@", str3];
    // 字符串长度：汉字长度也的是1
    NSUInteger str4Count = [str4 length];
    NSLog(@"%lu", (unsigned long)str4Count);
    
    // 2).可变字符串
}

// 2.NSArray
-(void)showArray {
    // 1).不可变数组
    // OC数组和C数组有什么区别？
    // 1.NSArray是一个类：任意类型对象地址的集合
    // 2.NSArray不能存放简单的基本数据类型（int、float、NSInteger）
    // NSInteger不是类吗？
    // 3.C数组是相同类型变量的有序集合，可以保存任意类型的数据
    // 4.NSArray下标越界不会有警告（运行会报错）
    
    // 创建数组
    // 1.创建空数组
    NSArray *array1 = [[NSArray array]init];
    NSArray *array2 = [NSArray array];
    // 2.指定对象创建数组
    NSArray *array3 = [NSArray arrayWithObjects:@"xxx", @"yyy", nil];
    NSArray *array4 = [[NSArray alloc]initWithObjects:@"xxx",@"yyy", nil];
    // 3.指定数组创建数组
    NSArray *array5 = [[NSArray alloc]initWithArray:array1];
    NSArray *array6 = [NSArray arrayWithArray:array2];
    NSArray *array7 = @[@(1),@(2)]; // 这样数字int就可以放入数组中
    NSLog(@"%@ == %@ == %@ == %@ == %@", array3, array4, array5, array6, array7);
}

// 3.NSDictionary
-(void)showDictionary {
    
}

// 4.NSSet

@end
