//
//  WMSocketViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2021/5/28.
//  Copyright © 2021 zali. All rights reserved.
//

#import "WMSocketViewController.h"

@interface WMSocketViewController ()

@end

@implementation WMSocketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.socket是一种通信机制，是面向C/S模型而设计的。针对客户端和服务端提供不同的socket对象，客户端有客户端的socket对象，服务端有服务端的socket对象，两个socket对象之间就可以通信
    // 2.tcp传输控制协议 - 面向连接的协议，正式收发数据之前必须与对方建立可靠的连接（三次握手），位于传输层，传输速度慢
    // 3.udp用户数据报协议 - 面向非连接的协议，适用于一次传输少量数据，可靠性不高，传输速度快
}

@end
