//
//  NSString+Extension.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/10/23.
//  Copyright © 2019 zali. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extension)
// 可以扩展原有类的方法
// 可以重写原有类的方法
// 不能添加属性（实例变量）：有方法可以添加（高级部分）
-(void)validateEmail;

/**
 注意点：
 1.分类中只能添加方法，不能添加类的属性
 2.分类中的 @property 只会生成 setter/ getter 方法，不会生成实现和私有成员变量
 3.可以在分类中访问原有类中 .h 中的属性
 4.如果分类中有与原有类中同名的方法，会调用分类中的方法（就近原则）/不建议这样写
 5.如果多个分类中都有和原有类同名的方法，调用由编译器决定执行哪一个（会执行最后一个参与编译的分类中的方法）/参
 与编译的顺序可以自动设置（项目 -> Build Phases -> Compile Sources/从上至下）
 */
/**
 方法调用的顺序
 分类
 本类
 父类
 */
@property (strong, nonatomic) NSString *name;


@end

NS_ASSUME_NONNULL_END
