//
//  main.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "SySkillViewController.h"
/// App启动原理
// 1.执行 main 函数
// 2.执行 UIApplicationMain：创建UIApplication对象，设置UIApplication代理
// 3.开启一个事件循环（主运行循环、保证App不退出）/死循环
// 4.加载 info.plist 文件（判断 info.plist 文件中是否有 main 参数：是否加载 xib）
// 5.应用程序启动完毕（通知 delegate）
int main(int argc, char * argv[]) {
    /// 创建一个自动释放池
    /// 第一种方式
    @autoreleasepool {   // NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
        /**
         // NSStringFromClass([AppDelegate class]将类名转换成NSString
         // 第三个参数：设置 App 对象的名称（如果是nil/默认是UIApplication）
         // 第四个参数：设置 App 的 delegate 名称
         */
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }   // [pool release];
    
//    // 第二种方式
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
//    // 引用计数 + 1 = 1
//    SySkillViewController *controller = [[SySkillViewController alloc]init];
//    // 引用计数 + 1 = 2
//    NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:controller, nil];
//    // 将指针（实质是将指针加入到自动释放池）加入到自动释放池
//    // 不是让对象引用计数 - 1
//    // 引用计数不变 = 2
//    [controller autorelease];
//    // 当自动释放池销毁的时候会对池子中每个指针指向的对象发送release消息
//    // 引用计数 - 1 = 1
//    [pool release];
//    // 引用计数 - 1 = 0
//    // 销毁
//    [array release];
}
