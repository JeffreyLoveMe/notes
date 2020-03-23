//
//  WMWebViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/7/17.
//  Copyright © 2019 zali. All rights reserved.
//

#import "WMWebViewController.h"
#import <WebKit/WebKit.h>

@interface WMWebViewController () <UIWebViewDelegate, WKUIDelegate, WKNavigationDelegate>
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
    /**
     UIWebView
     1>.概念 - UIWebView是iOS内置的浏览器控件
     2>.作用 - UIWebView可以加载远程的网页资源和常见文件（.pdf/.txt）
     */
    /// 3>.加载网络资源
    // 1.创建UIWebView
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    // 2.创建远程url/也可以创建本地url
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    // 3.创建NSURLRequest
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 4.加载url
    [webView loadRequest:request];
    // 5.添加到父视图
    [self.view addSubview:webView];
    /// 4>.可以通过 “UIScrollView属性” 给 “UIWebView 设置”
    webView.scrollView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    /// 5>.加载本地资源
    // 万能加载 - xxx.txt/xxx.mp4/xxx.pdf/xxx.ppt
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:@"/Users/xiewujun/Desktop/123.mp4"]]];
    // 设置自适应
    webView.scalesPageToFit = YES;
    // 加载 “本地html”
    [webView loadRequest:[NSURLRequest requestWithURL:[[NSBundle mainBundle] URLForResource:@"NBSDK接口协议.html" withExtension:nil]]];
    // 设置需要识别什么类型字符串
    webView.dataDetectorTypes = UIDataDetectorTypeAll;
    // 后退 - 退到第一页代表不能再后退
    if (webView.canGoBack) {
        [webView goBack];
    }
    // 前进 - 前进最后一页代表不能再前进
    if ([webView canGoForward]) {
        [webView goForward];
    }
    // 刷新网页
    [webView reload];
    // 可以加载 "html字符串" - 很多 "新闻类App" 使用
    [webView loadHTMLString:@"" baseURL:nil];
    // 停止加载网页
    [webView stopLoading];
    // 是否正在加载
    if ([webView isLoading]) {
        NSLog(@"正在加载");
    }
    // delegate
    webView.delegate = self;
    // 执行 "js方法" - UIWebView可以主动调用js
    [webView stringByEvaluatingJavaScriptFromString:@"Callback()"];
}
#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    // 1.即将加载某个请求的时候调用 - 请求发送前会调用
    // 1>.拦截某个请求
    if ([request.URL.absoluteString containsString:@"360"]) {
        return NO;
    }
    return true;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    // 2.开始加载网页 - 请求发送以后
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // 3.网页加载完成 - 服务器返回数据以后
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    // 4.网页加载错误 - 网页加载失败
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
