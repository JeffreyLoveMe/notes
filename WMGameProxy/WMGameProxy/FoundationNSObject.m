//
//  FoundationNSObject.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/7/22.
//  Copyright © 2019 zali. All rights reserved.
//

#import "FoundationNSObject.h"

/// Foundation框架提供很多官方Api
// 继承与NSObject
// iOS开发-Foundation框架 + UIKit框架
// Mac开发-Foundation框架 + AppKit框架
// 想要操作Foundtion框架最常使用的方法就是Category
@implementation FoundationNSObject
/// 0.NSObject
// 一切类的基类：没有父类
// 所有OC对象都直接/间接继承NSObject
-(void)showObject {
    NSObject *obj0 = [[NSObject alloc]init];
    NSObject *obj1 = [[NSObject alloc]init];
    if ([obj0 isEqual:obj1]) {
        // 两个对象是否为同一个对象
    }
    // 调用一个无参方法
    [obj0 performSelector:@selector(log)];
    // 调用一个有参方法：方法名带冒号
    [obj1 performSelector:@selector(logger:) withObject:@"xwj"];
    // 延迟执行：不会停止在这里
    // 使用较多
    [obj1 performSelector:@selector(logger:) withObject:@"xwj" afterDelay:1.5];
    // 让执行过程停在此处
    [[NSRunLoop currentRunLoop] run];
    /// 两者有什么不同？？？
    // 判断obj0对象是否NSObject类的子类创建
    if ([obj0 isKindOfClass:[NSObject class]]) {
        
    }
    // 判断对象是否是某一个类创建的
    if ([obj0 isMemberOfClass:[NSObject class]]) {
        
    }
    /// 判断obj0对象中是否实现了log方法
    // 包括父类继承下来的方法
    if ([obj0 respondsToSelector:@selector(log)]) {
        
    }
}
-(void)log {
    
}
-(void)logger:(NSString *)text {
    
}



/// 1.NSString/NSMutableString/字符串
-(void)showString {
    /// 1).不可变字符串
    // 只有官方类才能这样创建
    // 存储在常量区：多个内容相同的对象指向同一块存储空间
    NSString *str0 = @"iOS";
    // 这样不算修改：只能算变量重新赋值
    str0 = @"Android";
    /// 通过一个字符串创建另一个字符串
    // 存储在堆区：多个内容相同的对象指向不同存储空间
    NSString *str1 = [[NSString alloc]initWithString:str0];
    NSString *str2 = [NSString stringWithString:str1];
    NSLog(@"%@", str2);
    /// 将C语言字符串转OC字符串
    // C语言字符串和OC字符串可以相互转换
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
    // mac默认编码格式：UTF-8/unicode的分支
    /// 字符串判断
    // 1.判断字符串内容是否相同：区分大小写
    if ([str0 isEqualToString:str1]) {
        NSLog(@"内容相同");
    } else {
        NSLog(@"内容不相同");
    }
    // 2.判断字符串是否属于同一个对象：不是比较内容是否相同
    // swift可以这样比较字符串内容是否相同
    if (str1 == str0) {
        NSLog(@"属于同一对象（地址相同）");
    } else {
        NSLog(@"不属于同一对象（地址不同）");
    }
    // 3.字符串比较
//    NSComparisonResult result0 = [str0 caseInsensitiveCompare:str1]; // 忽略大小写比较大小
    // 字符串可以大小写转换：需要时可以自行百度
    NSComparisonResult result = [str0 compare:str1];  // 直接比较
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
    /// 字符串的截取
    NSString *subStr0 = [str0 substringFromIndex:1]; // 从字符串的开始位置截取到指定位置（不包含指定位置）
    NSString *subStr1 = [str0 substringToIndex:1];   // 从字符串的开始位置截取到指定位置（包含指定位置）
    NSRange range = {1, 4};  // 1.指定位置/2.需要截取的字符长度
    NSString *subStr2 = [str0 substringWithRange:range]; // 截取指定位置字符串
    NSLog(@"%@,%@,%@", subStr0, subStr1, subStr2);
    /// 字符串的查找
    NSString *str5 = @"www.iphone.com";
    NSRange range3 = [str5 rangeOfString:@"ios"];
    if (range3.location == NSNotFound) {
        // 没有找到这个数
    } else {
        NSLog(@"%lu === %lu", range3.location, range3.length);
    }
    // 字符串替换
    // A被B替换
    // 不会改变str5
    NSString *str6 = [str5 stringByReplacingOccurrencesOfString:@"A" withString:@"B"];
    // 应用：去掉空格
    str6 = [str5 stringByReplacingOccurrencesOfString:@" " withString:@""];
    // 去掉首尾空格
    str3 = [str5 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSLog(@"%@", str6);
    
    
    /// 2).可变字符串
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
    NSRange range1 = {1, 2}; // { 位置 , 长度 }
    // 2.删除
    [mStr3 deleteCharactersInRange:range0];
    // 替换字符串
    [mStr3 replaceCharactersInRange:range1 withString:@"xxx"];
}



/// 2.NSArray/NSMutableArray/数组
// 有序的对象集合：不能存放基本数据类型（如果需要存放只能通过NSNumber、NSValue进行数据的封装）
// 有序、不唯一
-(void)showArray {
    /// 1).不可变数组
    // OC数组和C数组有什么区别？
    // 1.NSArray是一个类：任意类型对象地址的集合
    // 2.NSArray不能存放简单的基本数据类型（int、float、NSInteger）
    // NSInteger不是类吗？
    // 3.C数组是相同类型变量的有序集合，可以保存任意类型的数据
    // 4.NSArray下标越界不会有警告（运行直接会报错）
    // 创建数组
    // 1.创建空数组
    NSArray *array1 = [[NSArray array]init];
    NSArray *array2 = [NSArray array];
    // 2.指定对象创建数组
    NSArray *array3 = [NSArray arrayWithObjects:@"xxx", @"yyy", nil];
    NSArray *array4 = [[NSArray alloc]initWithObjects:@"xxx",@"yyy", nil];
    NSLog(@"%@", array4.description);
    // 3.指定数组创建数组
    NSArray *array5 = [[NSArray alloc]initWithArray:array1];
    NSArray *array6 = [NSArray arrayWithArray:array2];
    NSArray *array7 = @[@(1),@(2)]; // 这样数字int就可以放入数组中、与array4是等价的
    NSLog(@"%@ == %@ == %@ == %@ == %@", array3, array4, array5, array6, array7);
    /// 判断数组中是否包含某一个对象
    // 方法一
    if ([array4 containsObject:@"xxx"]) {
        // 找到
    }
    // 方法二
    NSUInteger index = [array4 indexOfObject:@"xxx"];
    if (index == NSNotFound) {
        // 没有找到
    }
    /// ！！！很重要 - start - ！！！
    // 将数组中的字符串用 , 连接
    // 要求：数组中的元素必须全部是字符串
    NSString *str0 = [array4 componentsJoinedByString:@","];
    // 将字符串分割创建数组
    // 原字符串不变（str0不变）
    NSArray *componentArray = [str0 componentsSeparatedByString:@","];
    NSLog(@"%@", componentArray);
    /// ！！！很重要 - end - ！！！
    // 数组中第一个元素、最后一个元素
    NSString *firstStr = [array4 firstObject];
    NSString *lastStr = [array4 lastObject];
    NSLog(@"%@===%@", firstStr, lastStr);
    
    /// 2).可变数组NSMutableArray：
    // 概念：数组的长度不确定
    // 数组元素：不能是基本数据类型(int/float)/只能是对象的引用(指针)
    // 继承NSArray
    // 1.创建空数组
    NSMutableArray *mArray1 = [[NSMutableArray alloc]init]; // 默认会开辟多个（具体几个不知道）
    NSMutableArray *mArray2 = [NSMutableArray array];
    // 2.创建有数据的数组
    NSMutableArray *mArray3 = [[NSMutableArray alloc]initWithObjects:
                               @"data1",
                               @"data2",
                               @"data3", nil];
    // 数组允许数组重复
    NSMutableArray *mArray4 = [NSMutableArray arrayWithObjects:@"data",@"data", nil];
    NSMutableArray *mArray5 = [NSMutableArray arrayWithCapacity:5]; // 默认会开辟5个（超过5个会自动增大）
    // 添加元素
    // 添加在最后一个元素后面
    [mArray1 addObject:@"data1"];
    // 添加数组
    [mArray5 addObjectsFromArray:mArray1];
    // 插入元素
    [mArray3 insertObject:@"data1" atIndex:1];
    // 删除元素
    [mArray4 removeObjectAtIndex:0]; // 删除指定元素
    [mArray2 removeAllObjects]; // 删除所有元素
    [mArray1 removeLastObject]; // 删除最后一个元素
    [mArray3 removeObject:@"data"]; // 删除指定元素：如果数组中有两个呢？都删除吗？如果数组没有该元素呢？一个都不删除吗？
    // 替换指定下标元素
    [mArray3 replaceObjectAtIndex:0 withObject:@"hello"];
    // 重置数组
    [mArray1 setArray:mArray2];
    /// 查找
    // 防止数组越界：严谨写法
    // 不可变数组也可以直接使用下标取
    // id obj = array4[5];
    NSUInteger index0 = 5;
    if (index0 < array4.count) {
        [array4 objectAtIndex:index0];
    }
    NSLog(@"%@", [mArray3 objectAtIndex:0]);
    // 元素个数
    NSUInteger count = [mArray3 count];
    NSLog(@"%lu", count);
    // 交换元素
    [mArray3 exchangeObjectAtIndex:0 withObjectAtIndex:1];
    /// 数组遍历
    // 1.普通遍历
    for (int index = 0; index < mArray3.count; index++) {
        
    }
    // 2.快速遍历
    for (NSString *obj in mArray3) {
        NSLog(@"%@", obj);
    }
    // 3.枚举器法
    // 获取一个枚举器
    NSEnumerator *enumerator = [mArray3 objectEnumerator];
    while ([enumerator nextObject]) {
        
    }
    // 正序
    for (id obj in [mArray3 objectEnumerator]) {
        [mArray3 addObject:obj];
    }
    // 逆序
    for (id obj in [mArray3 reverseObjectEnumerator]) {
        [mArray3 addObject:obj];
    }
}



/// 3.NSDictionary/NSMutableDictionary/字典
// dictionary的数据是无序的
// 字典：任何类型的对象地址构成键值对的集合结构
// 键值对key/value必须一一对应
// key必须保持唯一
-(void)showDictionary {
    /// 1).不可变字典
    // 创建NSDictionary
    NSDictionary *dic0 = [[NSDictionary alloc]init];
//    NSDictionary *dic = [NSDictionary dictionary];
    // 全部是","
    NSDictionary *dic1 = [[NSDictionary alloc]initWithObjectsAndKeys:
                          @"key0", @"value0",
                          @"key1", @"value1",
                          nil];
    // 优化语法
    NSDictionary *dic2 = @{@"key0":@"value0", @"key1":@"value1",
                           @"key2":@"value2", @"key3":@"value3",
                           @"key4":@"value4"};
    // 获取value
    NSString *value0 = [dic1 objectForKey:@"key0"];
    NSLog(@"obj == %@", dic1[@"key0"]);
    // 返回键值总数
    NSUInteger count = [dic1 count];
    // 返回所有的键
    // key必须是唯一的
    NSArray *keys = [dic0 allKeys];
    // 返回所有的值
    NSArray *values = [dic2 allValues];
    NSLog(@"%ld==%@==%@==%@==%@==%@", count, value0, keys, values,[dic1 objectForKey:@"key0"], dic1[@"key1"]);
    
    /// 2).可变字典
    // 如果key同名则后面的会覆盖前面的
    NSMutableDictionary *mDict = [[NSMutableDictionary alloc]init];
    // 重置字典
    [mDict setDictionary:dic2];
    // 将dic2中所有的数据添加到mDict中
    // 相同key的元素在字典中不能重复添加：会被覆盖
    [mDict addEntriesFromDictionary:dic2];
    // 修改、添加
    [mDict setObject:@"key1" forKey:@"value"];
    // 根据key删除数据
    [mDict removeObjectForKey:@"key1"];
    // 全部删除
    [mDict removeAllObjects];
    
    /// 遍历字典
    // 第一种方法（快速遍历：推荐使用）
    for (NSString *key in mDict) {
        NSLog(@"%@", [mDict objectForKey:key]);
    }
    // 第二种方法（普通遍历）
    for (int index = 0; index < mDict.allKeys.count; index++) {
        NSLog(@"%@", [mDict objectForKey:[mDict.allKeys objectAtIndex:index]]);
    }
    // 第三种方法（枚举器法）
    // 获取所有的key
    NSEnumerator *enumerator = [mDict keyEnumerator];
    while ([enumerator nextObject]) {
        // 循环体
    }
}



/// 4.NSSet/集合（了解）
// 无序、不能存放重复对象
/*
 NSSet和NSArray的区别：
 1.NSArray有下标、NSSet没有下标
 2.NSArray是有序、NSSet无序
 3.NSArray可以重复存储一个对象、NSSet不行
 */
-(void)showSet {
    /// 1).不可变集合
    NSString *s1 = @"zhangsan";
    NSString *s2 = @"lisi";
    NSSet *set0 = [[NSSet alloc]initWithObjects:s1, s2, nil];
    NSSet *set1 = [NSSet setWithObjects:s1, s2, nil];
    // 可以将NSSet转换成NSArray
    NSArray *array1 = [set0 allObjects];
    // 返回元素个数
    NSUInteger count = [set1 count];
    // 从集合中随机取一个元素
    NSString *s3 = [set0 anyObject];
    NSLog(@"%@==%ld==%@", array1, count, s3);
    
    /// 1).可变集合
    
    
    // 遍历集合
}


/// 5.NSNumber
// 1.明白什么是NSNumber、为什么要引入NSNumber？
// 2.NSNumber/NSInteger/int三者之间的区别？
// 3.NSNumber怎么包装？怎么解包？怎么简化写法@()
// NSNumber是类：可以设置nil
-(void)showNumber {
    /// 包装基本数据类型
    // 包含int/float/long/bool
    NSNumber *intNumber0 = [NSNumber numberWithInt:100];
    NSNumber *floatNumber0 = [NSNumber numberWithDouble:100.00];
    // 包装以后可以存入数组
    NSArray *array0 = @[intNumber0, floatNumber0];
    NSLog(@"%@", [array0 description]);
    // 解包
    int intValue = [intNumber0 intValue];
    float floatValue = [floatNumber0 floatValue];
    NSLog(@"%d, %f", intValue, floatValue);
    // 优化语法
    NSNumber *intNumber1 = @(12); // 等价于[NSNumber numberWithInt:100]
    NSNumber *floatNumber1 = @(3.14f); // 等价于[NSNumber numberWithDouble:100.00]
    NSArray *array1 = @[intNumber1, floatNumber1];
    NSLog(@"%@", [array1 description]);
}


/// 6.NSValue（了解）
// 可以对结构体进行包装
// NSValue是NSNumber的父类
-(void)showValue {
    // 结构体能不能存入数组：不能
    // 包装结构体
    // 封包
    NSRange range0 = {10, 20};
    NSValue *value = [NSValue valueWithRange:range0];
    // 解包
    NSRange range1 = [value rangeValue];
    NSLog(@"%lu, %lu", (unsigned long)range1.location, range0.length);
    /// 自定义结构体
    // &p -结构体的指针
    // @encode(struct WXPoint) -结构体的类型
    struct WXPoint {
        float x;
        float y;
    };
    struct WXPoint p = {1, 2};
    NSValue *pointValue = [NSValue value:&p withObjCType:@encode(struct WXPoint)];
    [pointValue getValue:&p];
    NSLog(@"%f, %f", p.x, p.y);
}


/// 7.NSNull
// 万物皆对象：空也是对象
// nil不能存入字典/数组中
-(void)showNull {
    // 将nil封装成对象
    NSNull *null = [NSNull null];
    NSArray *array = @[null, @(12)];
    NSLog(@"%@", [array description]);
}


/// 8.NSDate
-(void)showDate {
    // 1.当前设备的时间点
    // 北京时间：东八区
    NSDate *date0 =[NSDate date];
    NSDate *date1 = [[NSDate alloc]init];
    // 明天 = 当前设备的时间点 + 24小时
    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:24 * 60 * 60];
    // 昨天 = 当前设备的时间点 - 24小时
    NSDate *date3 = [NSDate dateWithTimeIntervalSinceNow:-(24 * 60 * 60)];
    NSLog(@"%@===%@===%@===%@", date0, date1, date2, date3);
    // 2.时间戳：某一日期到1970年的秒数大小成为该日期的时间戳
    // 通过时间戳创建一个NSDate
    NSDate *date4 = [NSDate dateWithTimeIntervalSince1970:0];
    // 获取日期的时间戳
    NSTimeInterval t0 = [date0 timeIntervalSince1970];
    // 明天到现在的i秒数
    NSTimeInterval t1 = [date2 timeIntervalSinceNow];
    NSLog(@"%f===%f", t0, t1);
    // 3.日期的比较
    // 第一种方式
    NSComparisonResult result = [date3 compare:date4];
    if (result == NSOrderedAscending) {
        NSLog(@"date3 < date4");
    } else if (result == NSOrderedSame) {
        
    } else {
        
    }
    // 第二种方式：比较时间戳
    // 4.日期的格式化
    NSDate *nowDate = [NSDate date];
    NSString *defaultStr = nowDate.description;
    NSLog(@"%@", defaultStr);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    // 参考"时间格式说明符对照统一表.png"
    // zz时区
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss zz"];
    // 设置时区
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Pacific/Funafuti"];
    [dateFormatter setTimeZone:timeZone];
    // 获取所有时区的名称
    for (NSString *timeZone in [NSTimeZone knownTimeZoneNames]) {
        NSLog(@"%@", timeZone);
    }
    // 字符串 -> 日期对象
    NSString *dateStr = @"2013年04月08日 18:30:25";
    NSLog(@"时间===%@/对象===%@", [dateFormatter stringFromDate:nowDate], [dateFormatter dateFromString:dateStr]);
}

@end
