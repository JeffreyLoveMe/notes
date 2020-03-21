//
//  WMMemoryManager.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/2/21.
//  Copyright © 2020 zali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WMMemoryManager : NSObject

/**
 1.@property修饰符
 1>.readonly - 只读属性/只能生成 “getter方法”
 2>.readwrite - 读写属性/既会生成 “getter方法”又会生成 “setter方法”/默认
 
 3>.getter - 可以给生成的 “getter方法” 起别名
 4>.setter - 可以给生成的 “setter方法” 起别名
 
 5>.retain - 自动帮我们生成 “setter方法” 内存管理的代码
 6>.assign - 不会帮我们生成 “setter方法” 内存管理的代码/仅仅会生成普通的 “setter/getter方法”/一般用于基本数据类型/默认
 
 7>.strong - 相当于 MRC模式 下 retain
 8>.weak - xxx
 
 9>.atomic - 原子性/线程安全（对当前属性setter方法加锁）/性能低
 10>.nonatomic - 非原子性/线程不安全（不对当前属性setter方法加锁）/性能高/UI所有的属性都要用nonatomic
 
 11>.copy - 复制一份原来的对象/修饰字符串/？？？不可变字符串可以直接使用strong？？？
 12>.mutableCopy - xxx
 
 2.注意
 1>.多个属性x修饰符用 ‘,’ 隔开
 2>.如果需要对传入的数据进行过滤必须重写setter/getter方法
 3>.如果重写setter/getter方法@property将不会再生成setter/getter方法
 */
@property (strong, nonatomic, setter=isName:, getter=getName) NSString *name;
//// 使用 copy 外部修改了字符串不会影响内部
//// copy 会判断字符串是不可变字符串还是可变字符串
//// 不可变字符串直接赋值
//// 可变字符串生成新的对象
//@property (copy, nonatomic) NSString *name;

@end

NS_ASSUME_NONNULL_END
