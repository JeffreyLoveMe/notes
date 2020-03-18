//
//  WMNetworkViewController.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/18.
//  Copyright © 2020 zali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 1.网络概述
 1>.基础概念：
 Client客户端 - 移动应用/ iOS、Android应用
 Server服务端 - 为客户端提供服务、数据和资源
 Request请求 - 客户端向服务端索取数据的一种行为
 Response响应 - 服务端对客户端请求的反应
 URL - 统一资源定位符(网址)/协议+主机ip地址+端口号+资源/使用利于记忆的符号来代替IP地址
 HTTP协议 - 超文本传输协议/规定客户端和服务端之间的数据传输格式/交互方法GET/POST/PUT/DELETE
 2>.数据下载：
 同步下载：使用主线程进行下载，在下载完成前，线程阻塞
 异步下载：开辟新线程负责下载，主线程不会卡死，当子线程完成，回调主线程
 */



/**
 抓包
 1>.工具 - Charles
 2>.作用 - 抓包可以很快定位问题
 3>.步骤
 1).下载安装抓包工具Charles
 2).将mac的网络分享出去/手动配置端口、ip
 3).如果需要抓取https、需要安装证书
 4>.衍生的面试题
 1).你平时在工作中使用过抓包工具吗？一般是用来干嘛的？
 2).抓包的步骤是怎么样的？通过步骤你能猜测一下抓包的工作原理吗？
 3).抓包可以抓https吗？怎么才可以让https不被抓包工具抓取？
 */
@interface WMNetworkViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
