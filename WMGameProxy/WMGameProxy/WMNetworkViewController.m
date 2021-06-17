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

// JSON
-(NSDictionary *)analysisJSON:(NSData *)data {
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return  dict;
}

// XML - 可扩展性标记语言
// 1.特点 - 可扩展性（标签的名字可以自定义、标签可以嵌套）/标记/跨平台
// 2.作用 - 网络传输数据
// 3.json和xml的区别（json解析简单，但是结构不易理解、xml结构容易理解，但是数据冗余）

/// 发送“http请求”的方案
// 一、苹果原生
// 1.NSURLConnection（iOS7.0被废弃）
// 2.NSURLSession
// 3.CFNetwork（纯C语言）
// 二、第三方框架
// 1>.ASIHTTPRequest - 作者已经不维护
// 2>.AFNetworking
// 1.概述：AFNetworking2.0使用NSURLConnection、AFNetworking3.0使用NSURLSession
// 2.设置应用支持https：NSAppTransportSecurity -> NSAllowsArbitraryLoads -> YES
// 3>.MKNetworking - 使用者较少

/// 项目开发细节
// 1>.使用CocoaPods管理工程
// 2>.使用Assets/bundle管理资源
// 3>.业务数据直接在model中处理完毕
// 4>.UI状态直接在View中处理完毕（外部使用model数据驱动）
// 5>.业务数据如果需要初始化（swift需要），我们可以设置为0或者-1（-1代表不存在）

/// 分支管理
// 1.创建master分支
// 2.遇到新需要_01 -> 创建“dev_新需要_01”分支
// 3.遇到新需要_02 -> 创建“dev_新需要_02”分支
// 4.遇到新需要_03 -> 创建“dev_新需要_03”分支
// 5.master分支 -> 发版分支 -> “dev_新需要_01”分支/“dev_新需要_02”分支/“dev_新需要_03”分支合并到“v3.4.x发版”分支
// 6.v3.4.x上线 -> “v3.4.x发版”分支合并到master分支
// 7.master分支 -> base分支（修复线上bug）

@end
