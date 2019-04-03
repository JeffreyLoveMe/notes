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
/*
 学生信息主要包括：姓名，学号、年龄、OC成绩
 现要求设计学生管理系统：
 1、把创建的学生信息都保存下来
 2、能够把已经创建的学生给删除掉
 3、可根据学号查找某个学生的信息
 4、可根据学号修改某个学生的信息
 5、可显示所有学生的信息
 */
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
    // 取值
    // id是一个泛型指针，可以指向任何对象
    id obj = [array01 objectAtIndex:0];
    NSLog(@"%@",obj);
    // 元素个数
//    NSUInteger count = [array01 count];
    // 删除指定索引的元素
    [array01 removeObjectAtIndex:0];
    // 删除最后一个元素
    [array01 removeLastObject];
    // 指定删除某一个元素
    [array01 removeObject:@"123"];
    // 删除所有元素
    [array01 removeAllObjects];
    // 替换元素->指定下标
    [array01 replaceObjectAtIndex:2 withObject:@"hello"];
    // 交换两个下标位置的元素
    [array01 exchangeObjectAtIndex:2 withObjectAtIndex:0];
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
