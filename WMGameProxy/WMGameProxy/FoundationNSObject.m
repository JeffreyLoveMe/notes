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
// NSString/NSMutableString/字符串
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
    // 通过索引获取相应字符
    unichar c1 = [str4 characterAtIndex:1];
    NSLog(@"%c", c1);
    // unicode万国码：使用更大的存储空间存储各国字符
    // mac默认编码格式：UTF-8
    /// 字符串判断
    // 1.判断字符串内容是否相同
    if ([str0 isEqualToString:str1]) {
        NSLog(@"内容相同");
    } else {
        NSLog(@"内容不相同");
    }
    // 2.判断字符串是否属于同一个对象
    if (str1 == str0) {
        NSLog(@"属于同一对象");
    } else {
        NSLog(@"不属于同一对象");
    }
    // 3.字符串比较
    NSComparisonResult result = [str0 compare:str1];
    switch (result) {
        case NSOrderedAscending: {
            NSLog(@"升序");
        }
            break;
        case NSOrderedSame: {
            NSLog(@"相同");
        }
            break;
        case NSOrderedDescending: {
            NSLog(@"降序");
        }
            break;
    }
    // 转化为基本数据类型
    [str0 intValue]; // 字符串转化为数字
    [str0 integerValue]; // 字符串转化为数字
    [str0 floatValue];   // 字符串转化为浮点数
    [str0 boolValue];    // 字符串转化为布尔类型
    [str0 doubleValue]; // 字符串转化为double
    [str0 longLongValue]; // 字符串转化为长整型
    // 2).可变字符串
    // NSMutableString继承于NSString
    // 初始化字符串：必须初始化
    NSMutableString *mStr0 = [[NSMutableString alloc]init];
    NSMutableString *mStr1 = [NSMutableString string];
    // 可以初始化带有字符串的可变字符串
    NSMutableString *mStr2 = [NSMutableString stringWithFormat:@"%@", [NSString stringWithFormat:@"%@", mStr0]];
    NSMutableString *mStr3 = [NSMutableString stringWithFormat:@"%@", [NSString stringWithFormat:@"%@", mStr1]];
    // 重置字符串
    [mStr2 setString:@"xwj"];
    // 指定位置插入字符串
    [mStr3 insertString:mStr2 atIndex:0];
    // 追加部分字符串
    [mStr3 appendString:mStr2];
    // 追加部分内容
    [mStr3 appendFormat:@"%@", mStr2];
    // 删除字符串部分
    // 1.找到删除的范围
    // NSRange是一个结构体
    NSRange range0 = [mStr3 rangeOfString:@"222"];
    NSRange range1 = {1, 2};
    // 2.删除
    [mStr3 deleteCharactersInRange:range0];
    // 替换字符串
    [mStr3 replaceCharactersInRange:range1 withString:@"xxx"];
}

// NSArray/NSMutableArray/数组
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
    
    // 2).可变数组NSMutableArray：
    // 概念：数组的长度不确定
    // 数组元素：不能是基本数据类型(int/float)/只能是对象的引用(指针)
    // 继承NSArray
    // 1.创建空数组
    NSMutableArray *mArray1 = [[NSMutableArray alloc]init];
    NSMutableArray *mArray2 = [NSMutableArray array];
    // 2.创建有数据的数组
    NSMutableArray *mArray3 = [[NSMutableArray alloc]initWithObjects:@"data1", @"data2", @"data3", nil];
    // 数组允许数组重复
    NSMutableArray *mArray4 = [NSMutableArray arrayWithObjects:@"data",@"data", nil];
    // 添加元素
    [mArray1 addObject:@"data1"];
    // 插入元素
    [mArray3 insertObject:@"data1" atIndex:1];
    // 删除元素
    [mArray4 removeObjectAtIndex:0]; // 删除指定元素
    [mArray2 removeAllObjects]; // 删除所有元素
    [mArray1 removeLastObject]; // 删除最后一个元素
    [mArray3 removeObject:@"data"]; // 删除指定元素：如果数组中有两个呢？都删除吗？如果数组没有该元素呢？一个都不删除吗？
    // 替换指定下标元素
    [mArray3 replaceObjectAtIndex:0 withObject:@"hello"];
    // 查找
    NSLog(@"%@", [mArray3 objectAtIndex:0]);
    // 元素个数
    NSUInteger count = [mArray3 count];
    NSLog(@"%lu", count);
    // 交换元素
    [mArray3 exchangeObjectAtIndex:0 withObjectAtIndex:1];
}

// NSDictionary/NSMutableDictionary/字典
-(void)showDictionary {
    
}

// NSSet/集合
-(void)showSet {
    
}

// NSNumber
// NSDate

@end
