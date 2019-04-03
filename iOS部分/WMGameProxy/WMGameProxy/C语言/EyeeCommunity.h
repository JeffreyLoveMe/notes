//
//  EyeeCommunity.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2018/12/11.
//  Copyright © 2018 zali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EyeeCommunity : NSObject

-(void) onLine:(int)age;

@end

//// 1.自己声明一个类
//@interface Iphone : NSObject // NSObject是顶级父类，本身没有父类
//// 属性
//{
////    @private // 私有：只能本类访问
////    @protected // 受保护：可以子类访问
////    @public // 公有：外部类可以访问
//    float _price;
//    int _age;
//}
//
///*
// 行为：
// 1.确定方法名称；
// 2.确定形参；
// 3.确定返回值类型；
// */
////OC中没有参数不需要写()
////OC中()有特殊用途：()用来扩充数据类型
//-(void)about; // 对象方法：对象名调用
//// 单例
//+(instancetype)sharedInstance; // 类方法|类名调用
//
//// set方法：设值方法
//-(void)setPrice:(float)price;
//
//// get方法：取值方法
//-(float)getPrice;
//
//// 声明类的结束标志
//@end
//
//// 2.编写类的实现
//@implementation Iphone
//
//-(void)about {
//    NSLog(@"about");
//}
//
//+(instancetype)sharedInstance {
//    static Iphone *instance;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [[Iphone alloc]init];
//    });
//    return instance;
//}
//
//// set方法：设值方法
//-(void)setPrice:(float)price {
//    _price = price;
//}
//
//// get方法：取值方法
//-(float)getPrice {
//    return _price;
//}
//
//// 实现方法的私有化：在.m中定义方法，不写在.h中
//-(void)showAll {
//    NSLog(@"showAll");
//}
//
//@end
