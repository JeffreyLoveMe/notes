//
//  WMRuntimeViewController.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/20.
//  Copyright © 2020 zali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
1.runtime
 1>.runtime简称运行时。OC就是运行时机制（也就是在运行时候的一些机制），其中最主要的是消息机制
 2>.对于C语言 - 函数的调用在编译的时候就会决定调用哪个函数
 3>.对于OC语言 - 编译的时候并不能决定真正调用哪个函数，只有运行的时候才会根据函数的名称找到对应的函数（动态调用过程）
 4>.在编译阶段 - OC可以调用任何函数（即使这个函数未实现/只要声明了就不会报错）/C语言调用未实现的函数就会报错
*/
@interface WMRuntimeViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
