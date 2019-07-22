//
//  WMGameProxy.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import <Foundation/Foundation.h>  // 由于继承NSObject、所以导入Foundation

NS_ASSUME_NONNULL_BEGIN
// NSObject是基类
// 父类的属性可以继承、但是方法只能通过super调用
@interface WMGameProxy : NSObject {
    NSString *_name;
    @private  // 私有成员
    NSString *age;
    @public   // 公共成员
    NSString *height;
}

// 冒号也是方法名的一部分
-(void)initWithGameId:(NSString *)gameId GameKey:(NSString *)gameKey;

@end

NS_ASSUME_NONNULL_END
