//
//  WMWebViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/7/17.
//  Copyright © 2019 zali. All rights reserved.
//

#import "WMWebViewController.h"
#import <WebKit/WebKit.h>

@interface WMWebViewController () <UIWebViewDelegate, UIScrollViewDelegate, WKUIDelegate, WKNavigationDelegate>

/// UIWebView/WKWebView
// 一般 WebView
// 与 js 交互的 WebView
// 在 iOS开发 过程中、经常会用到一些 h5 交互
// 继承 UIView
// 加载网页数据的框架
@property (strong, nonatomic) UIWebView *webView;
// iOS 8.x以后新增的类
// 相对于 UIWebView：内存的消耗很少、推荐使用
// 支持更多的 HTML5 的特性
// 高达 60fps 的滚动刷新率以及内置手势
// Safari相同的 JavaScript引擎
@property (strong, nonatomic) WKWebView *wkWebView;

@end

@implementation WMWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - UIWebView
-(void)setupUIWebView {
    // 1.创建UIWebView
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    // 2.创建远程url/也可以创建本地url
    NSURL *remoteUrl = [NSURL URLWithString:@"http://www.baidu.com"];
    // 3.创建NSURLRequest
    NSURLRequest *request = [NSURLRequest requestWithURL:remoteUrl];
    // 4.加载url
    [self.webView loadRequest:request];
    // 5.添加到父视图
    [self.view addSubview:self.webView];
    // 可以加载 html 字符串
    // 本地 html 字符串
    // 所有链接的默认地址
    // 被很多"新闻类"的 App 使用
    [self.webView loadHTMLString:@"" baseURL:[NSURL URLWithString:@""]];
    // 刷新网页
    [self.webView reload];
    // 停止加载网页
    [self.webView stopLoading];
    // 后退
    // 是否可以后退
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
    // 前进
    // 是否可以前进
    if ([self.webView canGoForward]) {
        [self.webView goForward];
    }
    // 是否正在加载
    if ([self.webView isLoading]) {
        NSLog(@"正在加载");
    }
    // 网页是否可以缩放、NO表示不能缩放
    self.webView.scalesPageToFit = NO;
    // delegate
    self.webView.delegate = self;
    // 可以通过处理这个属性处理 webView 的滚动事件
    self.webView.scrollView.delegate = self;
    // 执行 js 方法
    // UIWebView可以主动调用js
    [self.webView stringByEvaluatingJavaScriptFromString:@"Callback()"];
    // 加载 Data数据 创建一个 webView
    [self.webView loadData:[[NSData alloc]init] MIMEType:@"" textEncodingName:@"" baseURL:[NSURL URLWithString:@""]];
}

#pragma mark - UIWebViewDelegate
// 是否允许加载网页：请求发送前会调用
// 可以获取 js 要打开的 url
// 通过截取 url 可与 js 交互
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return true;
}

// 开始加载网页：请求发送以后
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

// 网页加载完成：服务器返回数据以后
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}

// 网页加载错误：网页加载失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

#pragma mark - UIWebView和JS交互
// js 调用原生

// 原生调用 js

#pragma mark - WKWebView
-(void)setupWKWebView {
    // 1.创建WKWebView
    self.wkWebView = [[WKWebView alloc]init];
    self.wkWebView.UIDelegate = self;
    self.wkWebView.navigationDelegate = self;
    [self.view addSubview:self.wkWebView];
    // 2.创建远程url/也可以创建本地url
    NSURL *remoteUrl = [NSURL URLWithString:@"http://www.baidu.com"];
    // 3.创建NSURLRequest
    NSURLRequest *request = [NSURLRequest requestWithURL:remoteUrl];
    [self.wkWebView loadRequest:request];
    
}

#pragma mark - WKUIDelegate
// 主要处理 js脚本、确认框、警告框


#pragma mark - WKNavigationDelegate
// 主要处理一些跳转、加载处理操作
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
}

// 接收到服务器跳转以后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
    
}

@end
