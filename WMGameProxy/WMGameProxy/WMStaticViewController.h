//
//  WMStaticViewController.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/19.
//  Copyright © 2020 zali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 静态库
 1.库 - 程序代码的集合/共享程序代码的一种方式
 2.开源库 - 公开源代码的库/ MJRefresh/ AFNetworking
 3.闭源库 - 不公开源代码的库/经过编译后的二进制文件/静态库和动态库都是闭源库
 4.静态库 - xxx.a/ xxx.framework
 5.动态库 - xxx.dylib/ xxx.framework
 */
/**
 静态库和动态库的区别？
 1.静态库 - 链接的时候会被完整的复制到可执行文件中，被多次使用就会复制多次
 2.动态库 - 不会复制（只有一份）/程序运行的时动态加载到内存/系统只加载一次
 ！！！项目中如果使用到动态库不允许上架！！！
 ！！！MRC的项目打包成静态库可以在ARC下直接使用！！！
 */
/**
 iOS设备架构
 1>.模拟器
 4s-5 //i386
 5s-6splus //x86_64
 2>.真机
 3gs-4s //armv7
 5/5c //armv7s(armv7兼容armv7s)
 5s-6splus //arm64
 3>.查看 xxx.a/xxx.framework 支持哪些架构
 cd ~/xxx（包含xxx.a/xxx.framework的文件夹）
 lipo -info xxx.a/xxx.framework
 4>.支持编译所有架构设置 - Build Settings-Build Active Architecture Only设置为NO
 5>.合并支持模拟器的.a/支持真机的.a
 lipo -create xxx.a路径 yyy.a路径 -output zzz.a
 */
/**
 打包 xxx.a 的静态库 - https://www.jianshu.com/p/a1dc024a8a15
 */
/**
 xxx.a和xxx.framework的区别？
 1.xxx.a - 纯二进制文件/不可以直接使用（需要xxx.h配合）/ .a + .h + sourceFile = .framework
 2.xxx.framework - 除二进制文件还有资源文件/可以直接使用/建议使用
 */
// 如果导入过多头文件建议使用主头文件
@interface WMStaticViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
