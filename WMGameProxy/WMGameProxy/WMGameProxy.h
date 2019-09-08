//
//  WMGameProxy.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import <Foundation/Foundation.h>  // 由于继承NSObject、所以导入Foundation

NS_ASSUME_NONNULL_BEGIN
/// .h文件用来声明类
// NSObject是基类、顶级父类
// 父类的属性可以继承、但是方法只能通过super调用
// WMGameProxy类名
// NSObject父类
@interface WMGameProxy : NSObject {
    /// 定义属性
    // 实例变量
    // 在OC中：定义属性不能直接赋值、swift可以
    // ！！！定义成员变量：变量必须使用下划线！！！
    @private  // 私有成员：只能被本类访问、不能被子类访问、不能被外部访问
    NSString *_name;
    @protected  // 受保护的属性：默认属性、可以被本类访问、也能为子类访问、不能被外部访问
    NSString *_age;
    @public   // 公共成员：能被本类访问、能为子类访问、能被外部访问
    NSString *_height;
}

@property (strong, nonatomic) NSString *sdk;

/// 定义方法/行为
// 冒号也是方法名的一部分
// 定义在.h文件中的方法都会公有的、不能使用@private/@protected/@public修饰
// 对象方法：只能被对象名调用
-(void)loginWithGameId:(NSString *)gameId GameKey:(NSString *)gameKey;

// 类方法：只能被类名调用
// 注意：类方法中无法使用属性？？？
+(instancetype)getInstance;

// 初始化方法
-(id)initWithSdk:(NSString *)sdk;

// 不推荐直接给属性赋值
// 如果需要给属性赋值、可以使用set方法
// 修改实例变量
// 面试题：get/set方法的实质是什么？
-(void)setSdk:(NSString * _Nonnull)sdk;
// 获取属性内容、可以使用get方法
// 读取实例变量
-(NSString * _Nonnull)getSdk;
// 声明类结束的标志
@end

NS_ASSUME_NONNULL_END
