//
//  main.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "SySkillController.h"

int main(int argc, char * argv[]) {
    /// 创建一个自动释放池
    // 自动释放池无序
    /*
     自动释放池可以嵌套使用
     就近原则-向上查找
     */
    // 第一种方式
    @autoreleasepool {   // NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }   // [pool release];
    
//    // 第二种方式
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
//    // 引用计数 + 1 = 1
//    SySkillController *controller = [[SySkillController alloc]init];
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
    /**
     什么时候使用“自动释放池”？
     如果对象需要返回->那么对象不能在返回之前release->那么在返回之前需要将对象放入自动释放池
     */
}
