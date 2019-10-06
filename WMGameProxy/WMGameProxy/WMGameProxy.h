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
    // Objective-C语言没有真正意义的私有方法、只是一个约定而已、也是可以调用
    // 引用私用api（苹果官方私有方法）不能上架AppStore
    @private  // 私有成员：只能被本类访问、不能被子类访问、不能被外部访问
    NSString *_name;
    @protected  // 受保护的属性：默认属性、可以被本类访问、也能为子类访问、不能被外部访问
    NSString *_age;
    @public   // 公共成员：能被本类访问、能为子类访问、能被外部访问
    NSString *_height;
    @package  // 只能在当前框架中才能被访问
}

// 如果类中成员方法太多：setter/getter方法非常臃肿
// @property让编译器自动生成setter/getter方法
// 声明一个属性：1.生成setter/getter方法/2.生成_sdk成员变量
@property (strong, nonatomic) NSString *sdk;
// @synthesize让编译器自动实现setter/getter方法/Xcode4.6以后可以省略
// atomic缺省/原子性：对当前属性进行加锁、线程安全、消耗性能、访问速度慢
// nonatomic非原子性：不加锁、线程不安全、访问速度快
// 面试题：atomic可以保证100%安全吗？为什么？
@property (strong, atomic) NSString *publishName;
// assign一般用于基础数据类型
@property (assign, nonatomic) NSInteger *publishAge;
// readonly只读：只生成getter方法
// readwrite缺省
@property (readonly, strong, nonatomic) NSString *GameKey;
// 给getter方法取别名
@property (getter = myWeight) NSInteger weight;
// 给setter方法取别名
@property (setter = myHeight:) NSInteger mheight;
// 多个属性使用","隔开
@property (setter = setUserName:, getter = getUserNmae, strong, nonatomic) NSString *mName;

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
