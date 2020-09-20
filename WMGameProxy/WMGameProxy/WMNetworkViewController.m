//
//  WMNetworkViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/18.
//  Copyright © 2020 zali. All rights reserved.
//

#import "WMNetworkViewController.h"

@interface WMNetworkViewController ()

@end

@implementation WMNetworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/*
 JSON - JavaScript Object Notification
 1.概念 - JSON可以将js对象中表示的一组数据转换为字符串
 2.格式
 {
     key1: value1,
     key2: [
        {
            subKey1: subValue1,
            subKey2: subValue2
        },
         {
             subKey1: subValue1,
             subKey2: subValue2
         },
         {
             subKey1: subValue1,
             subKey2: subValue2
         }
    ],
    key3: value3
 }
 */
-(NSDictionary *)analysisJSON:(NSData *)data {
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return  dict;
}

/// 发送 http请求 的方案
// 苹果原生
// 1.NSURLConnection
// 2.NSURLSession
// 3.CFNetwork
// 第三方框架
// 1.ASIHttpRequest
// 2.AFNetworking
// 3.MKNetworking

@end
