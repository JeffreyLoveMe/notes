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

/// json和xml的区别
-(NSDictionary *)analysisJSON:(NSData *)data {
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return  dict;
}

/// 发送“http请求”的方案
// 苹果原生
// 1.NSURLConnection
// 2.NSURLSession
// 3.CFNetwork
// 第三方框架
// 1.ASIHttpRequest
// 2.AFNetworking
// 3.MKNetworking

@end
