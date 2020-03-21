//
//  WMRuntimeViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/20.
//  Copyright © 2020 zali. All rights reserved.
//

#import "WMRuntimeViewController.h"
// 1.导入头文件
#import <objc/message.h>

@interface WMRuntimeViewController ()

@end

@implementation WMRuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 2.消息机制
 1>.任何方法的调用本质就是发送一个消息（用runtime发送一个消息）
 */
-(void)sendMessage {
//    // 1.不推荐使用该方法
//    // Xcode编译器Clang -> 最终生成消息机制
//    // 终端命令 - clang -rewrite-objc xxx.m
//    id obj = [NSObject alloc];
//    // runtime都有一个前缀（谁的事情使用谁）
//    // 类方法的本质 - 利用类对象调用方法
//    // [NSObject class] - 获取类对象
//    // 一般开发中不这样写/太恶心
//    obj = ((NSObject *(*)(id, SEL))(void *)objc_msgSend)([NSObject class], @selector(alloc));
//    obj = [obj init];
    
    // 2.工程配置 - build setting -> 搜索msg
    // 类方法 - 使用 “类对象” 调用
    //id obj = [NSObject alloc];
    //id obj = objc_msgSend([NSObject class], @selector(alloc));
    id obj = objc_msgSend(objc_getClass("NSObject"), sel_registerName("alloc"));
    // 对象方法 - 使用 “对象” 调用
    // obj = [obj init];
    //obj = objc_msgSend(obj, @selector(init));
    obj = objc_msgSend(obj, sel_registerName("init"));
    // 调用带多个参数的方法
    obj = objc_msgSend(obj, @selector(initWithInt:), 20);
    
    /**
     3.什么时候使用runtime
     1>.装逼/YYKit
     2>.可以帮我们调用私有方法
     */
    
    /**
     4.方法调用流程/面试题
     1>.对象方法 - 保存在类对象的方法列表中
     1.通过isa指针去对应的类对象中查找
     2.利用方法名注册一个方法编号
     3.通过方法编号在类对象的方法列表中去查找对应方法
     4.根据找到的地址再去内存的方法区调用对应函数
     2>.类方法 - 保存在元类的方法列表中
     1.直接通过类对象的方法列表中去查找对应方法执行
     ！！！如果类对象的方法列表中没有找到对应方法就去父类里面找直至找到 NSObject 中还找不到就会报错！！！
     */
}


///**
// 3.交换方法
// 1>.给 “[UIImage imageName:@""];（系统方法）” 添加功能
// 1.自定义UIImage并重写“imageName:方法”/有弊端
// 2.交换方法/推荐使用
// 2>.需要给系统方法添加功能的时候可以使用runtime
// 1.给系统的方法添加分类category
// 2.自己实现一个带有扩展功能的方法/写在 category 中
// 3.交换方法/只用交换一次/写在 category 的 load方法 中
// */
//+(UIImage *)sy_imageNamed:(NSString *)name {
//    // 1.加载图片
//    UIImage *image = [UIImage sy_imageNamed:@"image_demo"];
//    // 2.判断
//    if (image) {
//        NSLog(@"加载成功");
//    } else {
//        NSLog(@"加载失败");
//    }
//    return image;
//}
//+(void)load {
//    // 获取 +imageNamed:方法
//    /**
//     获取类方法
//     第一个参数 - self（在类方法中表示类）/获取哪个类
//     第二个参数 - SEL/获取哪个方法
//     */
//    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
//    Method sy_imageNamedMethod = class_getClassMethod(self, @selector(sy_imageNamed:));
////    // 获取对象方法
////    class_getInstanceMethod(self, @selector(exchangeMethod));
//    // 交换方法
//    method_exchangeImplementations(imageNamedMethod, sy_imageNamedMethod);
//}




@end
