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
@interface WMGameProxy : NSObject {
    @private  // 私有成员：只能被本类访问、不能被子类访问、不能被外部访问
    NSString *_name;
    @protected  // 受保护的属性：默认属性、可以被本类访问、也能为子类访问、不能被外部访问
    NSString *age;
    @public   // 公共成员：能被本类访问、能为子类访问、能被外部访问
    NSString *height;
}

// 冒号也是方法名的一部分
// 定义在.h文件中的方法都会公有的、不能使用@private/@protected/@public修饰
// 对象方法：只能被对象名调用
-(void)initWithGameId:(NSString *)gameId GameKey:(NSString *)gameKey;

// 类方法：只能被类名调用
+(instancetype)getInstance;

@end

NS_ASSUME_NONNULL_END
