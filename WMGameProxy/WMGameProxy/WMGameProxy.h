//
//  WMGameProxy.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import <Foundation/Foundation.h>  // 由于继承 NSObject、所以导入 Foundation
#import "SyPostItem.h"

NS_ASSUME_NONNULL_BEGIN
/// .h文件用来声明类
// NSObject是基类、顶级父类
// 子类可以继承父类的所有方法和属性（私有属性虽然拥有但是不能访问/非私有属性才可以访问）
// 父类的属性可以继承、但是方法只能通过super调用
// WMGameProxy类名/类名必须大写
// NSObject父类（顶级父类）
// .h/.m相互切换：command + control + 👆
@interface WMGameProxy : NSObject <NSCoding> {
    /// 定义属性
    // 实例变量/成员变量/属性
    // 成员变量不能离开类：只能写在类内部
    // 在OC中：成员变量不能直接赋值（不能直接初始化）、swift可以
    // ！！！定义成员变量：变量必须使用下划线！！！
    // Objective-C语言没有真正意义的私有方法、只是一个约定而已、也是可以调用
    // Objective-C语言支持消息机制（运行时可以动态绑定）
    // 引用私用api（苹果官方私有方法）不能上架AppStore
    // 存储在堆区（当前对象对应的堆的存储空间中）：不会被自动释放（程序员手动释放）
    /// Objective-C语言修饰符
    // 修饰范围：从出现的位置到第二个修饰符出现或者遇到 "}"
    @private  // 私有成员：只能被本类访问、不能被子类访问、不能被外部访问
    NSString *_name;
    @protected  // 受保护的属性：默认属性、可以被本类访问、也能为子类访问、不能被外部访问
    NSString *_age;
    @public   // 公共成员：能被本类访问、能为子类访问、能被外部访问
    NSString *_height;
    @package  // 只能在当前框架中才能被访问
}
/// @property编译器指令
// 如果类中成员方法太多： setter/getter方法非常臃肿
// 1.让编译器自动声明 setter/getter方法/2.生成_sdk成员变量
// 持有的对象sdk引用计算 + 1
// 通过自动释放池管理内存
// 如果重写 setter/getter方法 则以重写的为主 / @property就不会（自动声明 setter/getter 方法 / 生成 _sdk 成员变量）
// 自动生成的变量 _sdk 是私有变量
@property (strong, nonatomic) NSString *sdk;
// @synthesize编译器指令（孙色size）
// 让编译器自动实现 setter/getter方法 | Xcode4.6以后可以省略
// atomic缺省/原子性：对当前属性进行加锁、线程安全、消耗性能、访问速度慢
// nonatomic非原子性：不加锁、线程不安全、访问速度快
// 面试题：atomic可以保证100%安全吗？为什么？
@property (strong, atomic) NSString *publishName;
// assign一般用于基础数据类型
@property (assign, nonatomic) NSInteger *publishAge;
// readonly只读：只生成 getter 方法
// readwrite缺省
@property (readonly, strong, nonatomic) NSString *GameKey;
/// 可以增强代码的可读性
// 给 getter 方法取别名
// 一般使用于BOOL：改成 isXxx
@property (getter = myWeight) NSInteger weight;
// 给 setter 方法取别名
// 一般不使用
@property (setter = myHeight:) NSInteger mheight;
// 多个属性使用 "," 隔开
@property (setter = setUserName:, getter = getUserNmae, strong, nonatomic) NSString *mName;

@property (strong, nonatomic) SyPostItem *item;
/**
 1.原子性
 atomic // 加锁/消耗性能、访问速度慢/多线程环境下存在线程保护（默认/原子性）
 nonatomic // 不加锁/访问速度快/多线程环境下不存在线程保护/非原子性
 2.赋值
 assign // 一般用于基本类型/直接赋值（默认）
 retain // 保留对象
 copy    // 拷贝对象/修饰字符串（不可变字符串可以直接使用strong）
 3.读写
 readwrite  // 生成 getter/setter 方法
 readonly   // 只生成 getter 方法
 */
// 如果想对传入的数据进行过滤需要重写 getter/setter 方法
// 如果重写 getter/setter 方法，@property将不再生成 getter/setter 方法
@property (nonatomic, retain, readonly) NSString *userName;

/// 定义方法/行为
// 冒号也是方法名的一部分
// 定义在.h文件中的方法都会公有的、不能使用 @private/@protected/@public 修饰
// 对象方法：只能被对象名调用
// 方法属于类
-(void)loginWithGameId:(NSString *)gameId GameKey:(NSString *)gameKey;

// 类方法：不属于任何对象，只能被类名调用
+(instancetype)getInstance;

/**
 类工厂方法
 1.一定是类方法 +
 2.方法名称以 “类名” 开头，首字母小写
 3.一定有返回值 id/instancetype
 */
+(instancetype)wmGameProxy;

+(instancetype)wmGameProxyWithSdk:(NSString *)sdk;

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

// 通过传入 NSDictionary 赋值模型
// 返回的 model 放在数组
+(instancetype)gameWithDict:(NSDictionary *)dict;

// 消息中心
-(void)onChange:(NSNotification *)notifucaiton;

// 声明类结束的标志
@end

NS_ASSUME_NONNULL_END
