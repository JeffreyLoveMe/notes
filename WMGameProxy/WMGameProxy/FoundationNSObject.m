//
//  FoundationNSObject.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/7/22.
//  Copyright © 2019 zali. All rights reserved.
//

#import "FoundationNSObject.h"

/// Foundation框架提供很多官方Api
// 继承与 NSObject
// iOS开发-Foundation框架 + UIKit框架
// Mac开发-Foundation框架 + AppKit框架
// 想要操作 Foundtion 框架最常使用的方法就是 Category
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
    // 判断 obj0对象 是否 NSObject类的子类 创建
    if ([obj0 isKindOfClass:[NSObject class]]) {
        
    }
    // 判断对象是否是某一个类创建的
    if ([obj0 isMemberOfClass:[NSObject class]]) {
        
    }
    /// 判断 obj0对象 中是否实现了 log方法
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
    /// 字符串的创建：有三种方式/每种方式创建存储的位置不一样
    // 只有官方类才能这样创建
    // 常量区的内容一定不一样
    // 存储在常量区：多个内容相同的对象指向同一块存储空间 / str0 & str00 存储地址相同
    // 1.第一种创建方法
    NSString *str0 = @"iOS";
    NSString *str00 = @"iOS";
    // 这样不算修改：只能算变量重新赋值
    str0 = @"Android";
    str00 = @"Android";
    /// 通过一个字符串创建另一个字符串
    // 存储在堆区：多个内容相同的对象指向不同存储空间
    // 2.第二种创建方法
    NSString *str1 = [[NSString alloc]initWithString:str0];
    // 3.第三种创建方法
    // 类工厂方法：快速创建对象的方法
    // 用于给对象分配存储空间和初始化存储空间
    
    NSString *str2 = [NSString stringWithString:str1];
    NSLog(@"%@", str2);
    // C语言字符串 <==> OC字符串
    NSString *str3 = [[NSString alloc]initWithUTF8String:"我是c语言字符串"];
    //const char *c = [str3 UTF8String]; // 这是C语言字符串
    // 拼接字符串：很重要
    NSString *str4 = [[NSString alloc]initWithFormat:@"我是万能拼接字符串：%@", str3];
    // 字符串长度
    // ！！！汉字长度也的是 “1”！！！
    NSUInteger str4Count = [str4 length];
    NSLog(@"%lu", (unsigned long)str4Count);
    // 通过索引获取相应字符
    unichar c1 = [str4 characterAtIndex:1];
    NSLog(@"%c", c1);
    // unicode万国码：使用更大的存储空间存储各国字符
    // mac默认编码格式：UTF-8/unicode的分支
    // UTF-8编码：不同的字符使用不同的字节存储（比如1个汉字占3个字节/1个英文字符占1个字节），但是都是一个字符
    /// 字符串判断
    // 1.判断字符串“内容”是否相同：区分大小写
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
//    // 3.字符串比较
//    NSComparisonResult result0 = [str0 caseInsensitiveCompare:str1]; // 忽略大小写比较大小
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
    /// 字符串转换
    // 1.转化为基本数据类型
    // 如果不是 int/integer/float/bool/double/longLong 这些类型不要乱用
    [str0 intValue]; // 字符串转化为数字
    [str0 integerValue]; // 字符串转化为数字
    [str0 floatValue];   // 字符串转化为浮点数
    [str0 boolValue];    // 字符串转化为布尔类型
    [str0 doubleValue]; // 字符串转化为double
    [str0 longLongValue]; // 字符串转化为长整型
    // 2.大小写转换
    [str0 uppercaseString]; // 字符串转化为大写
    [str0 lowercaseString]; // 字符串转化为小写
    [str0 capitalizedString]; // 字符串首字母转化为大写
    /// 字符串的查找
    if ([str0 hasPrefix:@"http://"]) {
        NSLog(@"是一个以“http://”开头");
    } else if ([str0 hasSuffix:@".png"]) {
        NSLog(@"是一个以“.png”结尾");
    }
    // 判断字符串中是否包含 “xxx”
    // range.location 从 0 开始/ range.length 从 1 开始
    NSString *str5 = @"www.iphone.com";
    NSRange range3 = [str5 rangeOfString:@"ios"]; // ！！！找到第一个就不再接着找！！！
    NSLog(@"location = %lu, length = %lu", range3.location, range3.length);
    if (range3.location == NSNotFound) {
        NSLog(@"没有找到这个字符串");
    } else {
        NSLog(@"%lu === %lu", range3.location, range3.length);
    }
//    // 从后想向前找
//    NSRange range4 = [str0 rangeOfString:@"<" options:NSBackwardsSearch];
    /// 字符串的截取
    // 从 0 开始
    // 未修改原有字符串
    NSString *subStr0 = [str0 substringFromIndex:1]; // 从字符串的指定位置截取到最后（包含 1）
    NSString *subStr1 = [str0 substringToIndex:1];   // 从字符串的开始位置截取到指定位置（不包含 1）
//    // 不常用
//    NSRange range = {1, 4};  // 1.指定位置/2.需要截取的字符长度
//     在 Objective-C 语言中结构体的创建基本都可以使用 NSMakeXxx(,)
    NSRange range = NSMakeRange(1, 4);
    NSString *subStr2 = [str0 substringWithRange:range]; // 截取指定位置字符串
    NSLog(@"%@,%@,%@", subStr0, subStr1, subStr2);
    // 动态获取起始位置 & 动态获取长度
    // 字符串替换
    // A 被 B 替换
    // 不会改变 str5
    NSString *str6 = [str5 stringByReplacingOccurrencesOfString:@"A" withString:@"B"];
    // 应用：去掉空格
    str6 = [str5 stringByReplacingOccurrencesOfString:@" " withString:@""];
    // 去掉首尾空格
    // 还可以去掉首尾大小写
    str3 = [str5 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSLog(@"%@", str6);

    /// 2).可变字符串
    // NSMutableString继承于NSString
    // 初始化字符串：必须初始化
    NSMutableString *mStr0 = [[NSMutableString alloc]init];
    NSMutableString *mStr1 = [NSMutableString string];
    // 可以初始化带有字符串的可变字符串
    NSMutableString *mStr2 = [NSMutableString stringWithFormat:@"%@", [NSString stringWithFormat:@"%@", mStr0]];
    NSMutableString *mStr3 = [NSMutableString stringWithString:mStr1];
    // 追加部分字符串
    [mStr3 appendString:mStr2];
    // 追加部分内容
    [mStr3 appendFormat:@"%@", mStr2];
    // 删除字符串部分
    // 1.找到删除的范围
    // NSRange是一个结构体
    NSRange range0 = [mStr3 rangeOfString:@"222"];
    NSRange range1 = {1, 2}; // { 位置 , 长度 }
    // 2.！！！删除：开发中经常使用！！！
    // 返回删除以后的字符串为一个新字符串
    [mStr3 deleteCharactersInRange:range0];
    // 重置字符串
    [mStr2 setString:@"xwj"];
    // 指定位置插入字符串
    [mStr3 insertString:mStr2 atIndex:0];
    // 替换字符串
    // 返回替换以后的字符串为一个新字符串
    // 没有 * 的属性一般为 枚举/如果不想使用枚举可以设置为 0
    [mStr3 replaceCharactersInRange:range1 withString:@"xxx"];
    [mStr3 stringByReplacingOccurrencesOfString:@"xwj" withString:@"xxx"];
    
    /// 3).字符串的读写
//    // 一、第一种方式
//    /**
//     从文件中读取字符串
//     第一个参数 - 文件路径/必须传 “绝对路径”
//     第二个参数 - 编码/英文编码 - iOS-5988-1/中文 - GBK（一般填写UTF8）
//     第三个参数 - 错误信息（如果有）/ &error表示 “两个 *”
//     */
//    NSString *filePath = @"/Users/xiewujun/Desktop/技术部-iOS开发组-第1周-周报.docx";
//    NSError *error = nil;
//    NSString *fileString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
//    NSLog(@"获取的字符串==%@/真正的错误原因==%@", fileString, [error localizedDescription]);
//    /**
//     将字符串写入到文件中
//     第一个参数 - 文件路径/必须传 “绝对路径”
//     第二个参数 - YES(字符串写入文件过程中没有写完不会生成文件)/NO(字符串写入文件过程中没有写完会生成文件)
//     第三个参数 - 错误信息（如果有）/ &error表示 “两个 *”
//     */
//    [fileString writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    // 二、第二种方式
    // 该方法既可以加载 “本地资源” 也可以加载 ”网络资源“
    /**
    1.file:// - 协议头
    2.192.168.5.102 - 主机域名
    3./Users/xiewujun/Desktop/技术部-iOS开发组-第1周-周报.docx - 路径
    file://192.168.5.102/Users/xiewujun/Desktop/技术部-iOS开发组-第1周-周报.docx
    file:///Users/xiewujun/Desktop/技术部-iOS开发组-第1周-周报.docx
    */
    /**
     从文件中读取字符串
     第一个参数 - URL/统一资源定位符/互联网上每个资源都有一个y唯一的url/协议头://主机域名/路径
     第二个参数 - 编码/英文编码 - iOS-5988-1/中文 - GBK（一般填写UTF8）
     第三个参数 - 错误信息（如果有）/ &error表示 “两个 *”
     */
    // 创建 url
//    // 第一种方式（手动）
//    // 因为 url 不支持中文，如果包含中文则无法访问
//    NSString *path = @"file://192.168.5.102/Users/xiewujun/Desktop/技术部-iOS开发组-第1周-周报.docx";
////    // 如果加载本机上资源，那么 url 中的主机地址可以省略
////    NSString *path = @"file:///Users/xiewujun/Desktop/技术部-iOS开发组-第1周-周报.docx";
//    // 如果 path 包含中文需要手动给 path 进行转码
//    NSString *path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *url = [NSURL URLWithString:path];
    // 第二种方式（推荐使用/自动 - 使用该方法就算 url 包含中文也可以进行访问，系统内部会自动对 url 的中文进行处理）
    // 如果通过该方法 “创建url” 系统会自动添加 “协议头”（ file:// ）
    NSString *filePath = @"192.168.5.102/Users/xiewujun/Desktop/技术部-iOS开发组-第1周-周报.docx";
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error = nil;
    NSString *fileString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"获取的字符串==%@/真正的错误原因==%@", fileString, [error localizedDescription]);
    /**
     将字符串写入到文件中
     第一个参数 - 文件路径/必须传 “绝对路径”
     第二个参数 - YES(字符串写入文件过程中没有写完不会生成文件)/NO(字符串写入文件过程中没有写完会生成文件)
     第三个参数 - 错误信息（如果有）/ &error表示 “两个 *”
     */
    // 多次往同一个文件中写入内容，那么后一次会覆盖前一次
    [fileString writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    /// 4).字符串和绝对路径
    // ！！！记住 - 字符串和路径之间有很多方法可以使用！！！
    // 1.判断是否为绝对路径
    // 本质就是判断字符串是否以 “/” 开头
    NSString *str = @"/Users/xiewujun/Desktop/技术部-iOS开发组-第1周-周报.docx";
    if ([str isAbsolutePath]) {
        NSLog(@"绝对路径");
    } else {
        NSLog(@"不是绝对路径");
    }
    // 2.获取文件路径的最后一个目录
    NSString *newString = [str lastPathComponent];
    NSLog(@"%@", newString);
    // 3.删除文件路径中的最后一个目录
    // 本质就是删除 “/XXX” 所有内容
    newString = [str stringByDeletingLastPathComponent];
    // 4.给文件路径添加一个目录
    // 本质就是在字符串的末尾加上一个 "/XXX"
    // 如果路径后面已经有一个或者多个 “/” 都会把 “/” 删除
    newString = [str stringByAppendingPathComponent:@"xmg"];
    // 5.获取路径中文件的扩展名
    // 本质就是从字符串的末尾开始截取到第一个 "."
    newString = [str pathExtension];
    // 6.删除路径中文件的扩展名
    // 本质就是从字符串的末尾开始查找第一个 "."，删除掉 “.” 和 “,” 后面的字符串
    newString = [str stringByDeletingPathExtension];
    // 7.给路径添加一个扩展名
    // 本质就是在路径结尾添加 ".XXX"
    newString = [str stringByAppendingPathExtension:@"png"];
}



/// 2.NSArray/NSMutableArray/数组
// 有序的对象集合：不能存放基本数据类型（如果需要存放只能通过 NSNumber、NSValue 进行数据的封装）
// 有序、不唯一
-(void)showArray {
    /// 1).不可变数组
    // OC数组和C数组有什么区别？
    // 1.NSArray是一个类：任意类型对象地址的集合
    // 2.NSArray不能存放简单的基本数据类型（int、float、NSInteger）
    // NSInteger不是类吗？
    // 3.C数组是相同类型变量的有序集合，可以保存任意类型的数据
    // 4.NSArray下标越界不会有警告（运行直接会报错）
    /// 创建数组
    // 使用数组之前必须 init
    // 1.创建空数组
    // 一般不会这样创建：因为这样创建出来的数组不可变而且又是空数组没有意义
    NSArray *array1 = [[NSArray array]init];
    NSArray *array2 = [NSArray array];
    // 2.指定对象创建数组
    // 数组中 nil 就是结束符：遇到第一个 nil 数组就会结束
    // 可以存放不同数据类型？？？可以
    NSArray *array3 = [NSArray arrayWithObjects:@"xxx", @"yyy", nil]; // ！！！最常用！！！
    NSArray *array4 = [[NSArray alloc]initWithObjects:@"xxx",@"yyy", nil];
    NSLog(@"%@", array4.description); // 以 ( 开头/ 以 ) 结尾
    // 3.指定数组创建数组
    NSArray *array5 = [[NSArray alloc]initWithArray:array1];
    NSArray *array6 = [NSArray arrayWithArray:array2];
    // 4.快速创建数组
    NSArray *array7 = @[@(1),@(2)]; // 这样数字 int 就可以放入数组中、与 array4 是等价的
    NSLog(@"%@ == %@ == %@ == %@ == %@", array3, array4, array5, array6, array7);
    /// 判断数组中是否包含某一个对象
    // 方法一
    if ([array4 containsObject:@"xxx"]) {
        // 找到
    }
    // 方法二
    // 1.获取某个元素的 index
    NSUInteger index = [array4 indexOfObject:@"xxx"];
    if (index == NSNotFound) {
        // 没有找到
    } else {
//        // 2.通过 index 获取元素
//        id obj = [array4 objectAtIndex:index];
//        id obj = array4[index];
    }
    
    /// NSString 和 NSArray 之间的转化
    // 将数组中的字符串用 , 连接
    // 要求：数组中的元素必须全部是字符串
    NSString *str0 = [array4 componentsJoinedByString:@","]; // 数组->字符串
    // 将字符串分割创建数组
    // 原字符串不变（ str0 不变）
    NSArray *componentArray = [str0 componentsSeparatedByString:@","]; // 字符串->数组
    NSLog(@"%@", componentArray);
    
    // 数组中第一个元素、最后一个元素
    // 这里 NSString 可以改成 id
    NSString *firstStr = [array4 firstObject];
    NSString *lastStr = [array4 lastObject];
    NSLog(@"%@===%@", firstStr, lastStr);
    // 元素个数
    NSUInteger count = [array4 count];
    NSLog(@"%lu", count);
    
    // 数组排序
    // 1.使用方法对数组元素排序
    // 数组元素必须是 Foundation 框架中的对象
    // 自定义对象不能排序
    NSArray *newArray01 = [array1 sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@", newArray01);
    /// ！！！必须掌握！！！
    // 每次调用 block 都会取出数组中两个元素出来
    // 可以对自定义对象的某个属性排序
    // 二分排序
    NSArray *newArray02 = [array1 sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSLog(@"obj1 = %@, obj2 = %@", obj1, obj2);
        // 这里也可以让 “对象的属性” 相互比较
        return obj1 > obj2;
    }];
    NSLog(@"%@", newArray02);
    

    /// 2).可变数组NSMutableArray：
    // 概念：数组的长度不确定
    // 数组元素：不能存放基本数据类型 (int/float) / 只能是对象的引用 (指针)
    // 继承 NSArray
    // 1.创建空数组
    NSMutableArray *mArray1 = [[NSMutableArray alloc]init]; // 默认会开辟多个（具体几个不知道）
    NSMutableArray *mArray2 = [NSMutableArray array];
    // 2.创建有数据的数组
    NSMutableArray *mArray3 = [[NSMutableArray alloc]initWithObjects:
                               @"data1",
                               @"data2",
                               @"data3", nil];
//    // 不能把不可变数组当作可变数组使用：会发生运行时错误
//    NSMutableArray *arrM = @[@"", @""];
    // 数组允许数组重复
    NSMutableArray *mArray4 = [NSMutableArray arrayWithObjects:@"data",@"data", nil];
    NSMutableArray *mArray5 = [NSMutableArray arrayWithCapacity:5]; // 默认会开辟 5 个（超过 5 个会自动增大）
    
    // 添加元素
    // 添加在最后一个元素后面
    [mArray1 addObject:@"data1"];
    // 添加数组
    // 将 “数组mArray1” 元素取出来添加到 “数组mArray5” 中
    // 不是将 “数组mArray1” 加到 “数组mArray5” 中
    [mArray5 addObjectsFromArray:mArray1];
    // 插入一个元素
    [mArray3 insertObject:@"data1" atIndex:1];
    // 插入一组元素
     NSRange range = NSMakeRange(2, 2);
     NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:range];
    [mArray3 insertObjects:@[@"data1", @"data2"] atIndexes:set];
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
    // 交换元素
    [mArray3 exchangeObjectAtIndex:0 withObjectAtIndex:1];
    
    /// 数组遍历
    // https://blog.csdn.net/ioszzzh/article/details/52136131
    // 1.普通遍历
    for (int index = 0; index < mArray3.count; index++) {
        NSLog(@"%@", [mArray3 objectAtIndex:index]);
    }
    // 2.快速遍历
    // 增加 for 循环
    for (NSString *obj in mArray3) {
        NSLog(@"%@", obj);
    }
    // 3.迭代器
    [mArray3 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 1) {
            // 停止遍历
            *stop = YES;
        }
        NSLog(@"obj = %@, idx = %lu", obj, idx);
    }];
    // 4.枚举器法
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
    
//    // 让数组中的每个元素都调用 isOneway 方法
//    // 如果数组中某个元素没有 isOneway 方法就会报错
//    // 最多只可以传递 1 个参数
//    // 数组中的对象必须是相同类型，不然会报错
//    [mArray3 makeObjectsPerformSelector:@selector(isOneway)];
//    [mArray3 makeObjectsPerformSelector:@selector(isOneway:) withObject:@"lnj"];
    
    /// 文件读写
    /**
     1.将数组写入到文件中
     如果将一个数组写入到文件中之后本质上是一个 “XML文件”
     “XML文件” 的l扩展名保存为 .plist
     */
    // 如果数组中的元素是 “自定义对象” 不能使用该方法保存
    // 保存 “自定义对象” 需要使用 “归档”
    NSArray *array = @[@"lnj", @"yz", @"xwj"];
    if ([array writeToFile:@"/Users/xiewujun/Desktop/abc.plist" atomically:YES]) {
        NSLog(@"写入成功");
    }
    // 2.从文件中读取一个数组
    array = [NSArray arrayWithContentsOfFile:@"/Users/xiewujun/Desktop/abc.plist"];
}



/// 3.NSDictionary/NSMutableDictionary/字典
// dictionary的数据是无序的
// 字典：任何类型的对象地址构成键值对的集合结构
// 键值对 key/value 必须一一对应
// key必须保持唯一
-(void)showDictionary {
    /// 1).不可变字典
    // 创建 NSDictionary
    NSDictionary *dic0 = [[NSDictionary alloc]init];
//    NSDictionary *dic = [NSDictionary dictionary];
    // 全部是 ","
    NSDictionary *dic1 = [[NSDictionary alloc]initWithObjectsAndKeys:
                          @"key0", @"value0",
                          @"key1", @"value1",
                          nil];
    // 优化语法
    // 不能创建 NSMutableDictionary
    NSDictionary *dic2 = @{@"key0":@"value0", @"key1":@"value1",
                           @"key2":@"value2", @"key3":@"value3",
                           @"key4":@"value4"};
    // 获取 value
    NSString *value0 = [dic1 objectForKey:@"key0"];
    NSLog(@"obj = %@", dic1[@"key0"]);
    // 返回键值总数
    NSUInteger count = [dic1 count];
    // 返回所有的键
    // key必须是唯一的
    NSArray *keys = [dic0 allKeys];
    // 返回所有的值
    NSArray *values = [dic2 allValues];
    NSLog(@"%ld==%@==%@==%@==%@==%@", count, value0, keys, values,[dic1 objectForKey:@"key0"], dic1[@"key1"]);
    
    /// 2).可变字典
    // 如果 key 同名则后面的会覆盖前面的
    NSMutableDictionary *mDict = [[NSMutableDictionary alloc]init];
    // 重置字典
    [mDict setDictionary:dic2];
    // 将 dic2 中所有的数据添加到 mDict 中
    // 相同 key 的元素在字典中不能重复添加：会被覆盖
    [mDict addEntriesFromDictionary:dic2];
    // 修改、添加
    [mDict setObject:@"key1" forKey:@"value"];
    // 根据 key 删除数据
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
    // 第三种方法（枚举器法：推荐使用）
    [mDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key = %@, value = %@", key, obj);
    }];
    
    /// 文件读写
    // 写入
    [mDict writeToFile:@"/Users/xiewujun/Desktop/info.plist" atomically:YES];
    // 读取
    NSDictionary *newDict = [NSDictionary dictionaryWithContentsOfFile:@"/Users/xiewujun/Desktop/info.plist"];
    NSLog(@"%@", newDict);
}



/// 4.NSSet/集合
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
    NSSet *oldSet = [[NSSet alloc]initWithObjects:s1, s2, nil];
    NSSet *newSet = [NSSet setWithObjects:s1, s2, nil];
    // 可以将 NSSet 转换成 NSArray
    NSArray *array1 = [oldSet allObjects];
    // 返回元素个数
    NSUInteger count = [newSet count];
    // 从集合中随机取一个元素
    NSString *s3 = [oldSet anyObject];
    NSLog(@"%@==%ld==%@", array1, count, s3);
    
    /// 1).可变集合
    
    
    // 遍历集合
}



/// 5.NSNumber
// 1.明白什么是NSNumber、为什么要引入NSNumber？
// 2.NSNumber怎么包装？怎么解包？怎么简化写法@()
// 3.NSNumber是类：可以设置nil
-(void)showNumber {
    // 1.包装基本数据类型/int/float/long/bool
    NSNumber *intNumber = [NSNumber numberWithInt:100];
    NSNumber *floatNumber = [NSNumber numberWithDouble:100.00];
    // 包装以后可以存入数组
    NSArray *array = @[intNumber, floatNumber];
    NSLog(@"%@", [array description]);
    // 2.解包基本数据类型
    int intValue = [intNumber intValue];
    float floatValue = [floatNumber floatValue];
    NSLog(@"%d, %f", intValue, floatValue);
//    // 3.优化语法
//    // 如果传入的是 “变量” 必须在 @ h后面加上 ()/如果传入的是 “常量” ()可以省略
//    int age = 10;
//    NSNumber *intNumber = @(age); // 等价于 [NSNumber numberWithInt:100]
//    NSNumber *intNumber = @10;
//    NSNumber *floatNumber = @(3.14f); // 等价于 [NSNumber numberWithDouble:100.00]
//    NSArray *array = @[intNumber, floatNumber];
//    NSLog(@"%@", [array description]);
    /**
     4.NSNumber/NSInteger/int三者之间的区别？？？
     1.NSNumber是一个继承与NSValue的一个类，NSNumber可以对基本数据类型进行包装存放到NSArray；
     2.NSInteger是基本数据类型，Apple一般推荐使用，因为NSInteger会根据操作系统的位数自动返回最大的类型；
     3.int也是基本数据类型；
     */
}



/// 6.NSValue
// NSValue是NSNumber的父类、可以包装任意类型
// 可以对结构体进行包装
-(void)showValue {
    // 包装结构体、结构体不能直接存入数组
    // 1.封包
    //    // 结构体的简单写法
    //    NSRange range1 = {10, 20};
    NSRange range = NSMakeRange(10, 20);
    NSValue *value = [NSValue valueWithRange:range];
    // 2.解包
    range = [value rangeValue];
    NSLog(@"%lu, %lu", range.location, range.length);
    // 3.自定义结构体
    typedef struct{
        float x;
        float y;
    }WXPoint;
    WXPoint p = {1, 2};
    /**
     1>.包装自定义结构体
     1.&p -结构体的指针
     2.@encode(WXPoint) -结构体的类型
     */
    NSValue *pointValue = [NSValue value:&p withObjCType:@encode(WXPoint)];
    // 2>.解包自定义结构体
    WXPoint point;
    [pointValue getValue:&point];
    NSLog(@"%f, %f", point.x, point.y);
}



/// 7.NSNull
// 万物皆对象：空也是对象
// nil不能存入字典/数组中
-(void)showNull {
    // 将 nil 封装成对象
    NSNull *null = [NSNull null];
    NSArray *array = @[null, @(12)];
    NSLog(@"%@", [array description]);
}



/// 8.NSDate
// 日期对象
-(void)showDate {
    // 1.当前设备的时间点
    // 北京时间 - 东八区
    NSDate *date0 =[NSDate date];
    NSDate *date1 = [[NSDate alloc]init];
    // 明天 = 当前设备的时间点 + 24小时
    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:24 * 60 * 60];
    // 昨天 = 当前设备的时间点 - 24小时
    NSDate *date3 = [NSDate dateWithTimeIntervalSinceNow:-(24 * 60 * 60)];
    NSLog(@"%@===%@===%@===%@", date0, date1, date2, date3);
    // 2.时间戳 - 某一日期到1970年的秒数大小成为该日期的时间戳
    // 通过 “时间戳” 创建一个 “NSDate”
    NSDate *date4 = [NSDate dateWithTimeIntervalSince1970:0];
    // 获取日期的时间戳
    NSTimeInterval t0 = [date0 timeIntervalSince1970];
    // 明天到现在的i秒数
    NSTimeInterval t1 = [date2 timeIntervalSinceNow];
    NSLog(@"%f===%f", t0, t1);
    // 3.日期的比较
    // 第一种方式 - 直接比较
    NSComparisonResult result = [date3 compare:date4];
    if (result == NSOrderedAscending) {
        NSLog(@"date3 < date4");
    } else if (result == NSOrderedSame) {
        
    } else {
        
    }
    // 第二种方式 - 比较时间戳
    // 4.日期的格式化
    NSDate *nowDate = [NSDate date];
    NSString *defaultStr = nowDate.description;
    NSLog(@"%@", defaultStr);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    // 参考 "时间格式说明符对照统一表.png"
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



/// 9.NSData
-(void)showData {
    
}

@end
