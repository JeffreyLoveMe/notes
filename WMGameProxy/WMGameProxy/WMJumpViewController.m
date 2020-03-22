//
//  WMJumpViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/18.
//  Copyright © 2020 zali. All rights reserved.
//

#import "WMJumpViewController.h"

@interface WMJumpViewController ()

@end

@implementation WMJumpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 1.应用间跳转/scheme(skim)
 0>.https://blog.csdn.net/cc1991_/article/details/79050275
 1>.如果想要跳转到不同的App - 1.定义需要跳转到的App的“协议/scheme”/2.打开对应App的“协议/scheme”
 */
-(void)setupJump {
    /**
     1>.URL的组成
     scheme协议 - http
     host主机名 - www.520it.com
     path路径 - /query
     query查询 - name=sz&age=18
     */
    NSURL *url = [NSURL URLWithString:@"http://www.520it.com/query?name=sz&age=18"];
    NSLog(@"协议 = %@/ 主机名 = %@/ 资源路径 = %@/ 请求参数 = %@", url.scheme, url.host, url.path, url.query);
    /**
     2.应用间跳转 - 从 "应用A -> 应用B"
     1>.先在 “应用B” 设置 “scheme协议”（注意不要加上"://"）
     2>.iOS9.0以后 - 再在 “应用A” 上添加白名单/ info.plist -> LSApplicationQueriesSchemes（注意不要加上"://"）
     3>.写代码实现跳转
     */
    NSURL *schemeUrl = [NSURL URLWithString:@"scheme协议://"];
    if ([[UIApplication sharedApplication] canOpenURL:schemeUrl]) {
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:schemeUrl options:@{} completionHandler:^(BOOL success) {
                
            }];
        } else {
            [[UIApplication sharedApplication] canOpenURL:schemeUrl];
        }
    } else {
        NSLog(@"尚未安装App");
    }
    /**
     3.应用跳转到指定页面
     1>.在 “2” 的基础上添加一个标识 -> 根据标识在 “AppDelegate回调” 中自行处理
     2>.详情见"AppDelegate.m"应用间跳转
     */
    NSURL *pUrl = [NSURL URLWithString:@"scheme协议://pengyouquan"];
    if ([[UIApplication sharedApplication] canOpenURL:pUrl]) {
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:pUrl options:@{} completionHandler:^(BOOL success) {
                
            }];
        } else {
            [[UIApplication sharedApplication] canOpenURL:pUrl];
        }
    } else {
        NSLog(@"尚未安装App");
    }
    
    /**
     4.打电话、发短信、发邮件
     1>.https://blog.csdn.net/cc1991_/article/details/74990013
     */
}

// 2.社交分享

// 3.第三方登录

// 4.应用统计

// 5.第三方支付

@end
