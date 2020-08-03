# 平台海外SDK接入指南（iOS）
* [1.环境和配置](#jump1)
    * [1.1 库&资源文件下载](#jump1.1)
    * [1.2 库&资源文件引用](#jump1.2)
    * [1.3 info.plist修改](#jump1.3)
    * [1.4 编辑DMSDKConfig.plist](#jump1.4)
    * [1.5 其它配置](#jump1.5)
* [2.接入任务](#jump2)
    * [2.1 初始化 (必接)](#jump2.1)
    * [2.2 用户登录 (必接)](#jump2.2)
    * [2.3 用户登出 (选接)](#jump2.3)
    * [2.4 切换账号 (选接)](#jump2.4)
    * [2.5 AppStore支付 (必接)](#jump2.5)
* [3.F&Q](#jump3)
    * [3.1 横竖屏适配](#jump3.1)
    * [3.2 多语言支持](#jump3.2)
    * [3.3 SDK库导入](#jump3.3)
    * [3.4 App上架注意](#jump3.4)


## <span id="jump1">1. 环境和配置</span>  
### <span id="jump1.1">1.1 库&资源文件下载</span>  
包含以下文件: 
* `DMSDK.framework`（SDK库文件）
* `DMSDK.bundle` (SDK资源文件) 
* `DMSDKConfig.plist` (SDK配置文件) 
* `FBSDKCoreKit.framework`（Facebook库文件）
* `FBSDKLoginKit.framework` (Facebook登录库文件) 

### <span id="jump1.2">1.2 库&资源文件引用</span> 
引用系统依赖库:
* libc++.tbd
* Accelerate.framework
* AuthenticationServices.framework
* MessageUI.framework
* StoreKit.framework

### <span id="jump1.3">1.3 info.plist修改</span>  
* 添加白名单

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>fbapi</string>
    <string>fbapi20130214</string>
    <string>fbapi20130410</string>
    <string>fbapi20130702</string>
    <string>fbapi20131010</string>
    <string>fbapi20131219</string>
    <string>fbapi20140410</string>
    <string>fbapi20140116</string>
    <string>fbapi20150313</string>
    <string>fbapi20150629</string>
    <string>fbapi20160328</string>
    <string>fbauth</string>
    <string>fb-messenger-share-api</string>
    <string>fbauth2</string>
    <string>fbshareextension</string>
</array>
```

* 设置URL schemes

```xml
# fbAppID - Facebook的APP_ID
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>fb{fbAppID}</string>
        </array>
    </dict>
</array>
```

* 设置FacebookAppID

```xml
# fbAppID - Facebook的APP_ID
<key>FacebookAppID</key> 
<string>{fbAppID}</string> 
```

* 设置FacebookDisplayName

```xml
# APP_NAME - Facebook开发者后台注册的APP_NAME
<key>FacebookDisplayName</key>
<string>{APP_NAME}</string>
```

### <span id="jump1.4">1.4 编辑DMSDKConfig.plist</span> 
* DEBUG_MODE
    * 0 - dev环境/1 - 沙箱环境/ 2 - 生产环境（！！！上线之前务必设置为2！！！）
* LANDSCAPE_GAME
    * 是否是横屏游戏（必传）
* APP_ID
    * 平台分配的游戏ID（必传）
* CHANNEL_ID
    * 平台分配的渠道ID（必传）
* FB_APP_ID
    * Facebook的APP_ID（必传）


### <span id="jump1.5">1.5 其它配置</span>  
* 支持iOS版本
     * SDK支持版本 >= iOS8.0
     
* 关闭Bitcode
    * 如果使用的IDE为Xcode7.x以上版本需要选择{project}->build Settings->Enable Bitcode->NO
    
* 设置-ObjC
     * 选择{project}->build Settings->Other Linker Flags->-ObjC

* 支持Sign In with Apple
     * 选择{project}->Signing & Capabilities -> + Capability -> 搜索Sign In with Apple，增加Sign In with Apple选项

* 支持In-App Purchase
     * 选择{project}->Signing & Capabilities，增加In-App Purchase选项
     

## <span id="jump2">2.接入任务</span>  
### <span id="jump2.1">2.1 初始化 (必接)</span>

* 设置DMSDKDelegate

```Objective-C
#import <DMSDK/DMSDK.h>

// ViewController为您的"回调处理类"
@interface {ViewController} () <DMSDKDelegate>

@end

```

* 初始化
    * 必须使用[DMSDK getInstance]实例化DMSDK，否则可能会发生未知错误
    * DEBUG_MODE - 上线之前务必设置为2

```Objective-C
// 初始化 - 必须使用[DMSDK getInstance]实例化DMSDK，否则可能会发生未知错误
// 设置DMSDKDelegate为您的"回调处理类（通常是当前类）"
[[DMSDK getInstance] initWithDelegate:self];
```

* 初始化回调

```Objective-C
// ！！！游戏方需要在收到初始化成功回调之后再操作后续流程！！！
-(void)initSuccess {
    NSLog(@"初始化成功");
}

-(void)initFailed {
    NSLog(@"初始化失败");
}
```


* 在SceneDelegate.m中：

```Objective-C
#import <DMSDK/DMSDK.h>

// ！！！如果项目存在SceneDelegate.m文件/支持iPadOS多窗口（iOS13.0以上）需要调用该方法！！！
// ！！！选接！！！
-(void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts API_AVAILABLE(ios(13.0)) {
    // TODO：
    return [[DMSDK getInstance] scene:scene openURLContexts:URLContexts];
}
```

* 在AppDelegate.m中：

```Objective-C
#import <DMSDK/DMSDK.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // TODO：
    return [[DMSDK getInstance] application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // TODO：
    [[DMSDK getInstance] applicationDidBecomeActive:application];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation API_DEPRECATED_WITH_REPLACEMENT("application:openURL:options:", ios(4.2, 9.0)) {
    // TODO：
    return [[DMSDK getInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options API_AVAILABLE(ios(9.0)) {
    // TODO：
    return [[DMSDK getInstance] application:app openURL:url options:options];
}
```


### <span id="jump2.2">2.2 用户登录 (必接)</span>  
* 用户登录

```Objective-C
[[DMSDK getInstance] login];
```

* 登录回调

```Objective-C
// 登录成功
// uid - 登录用户名
// token - 用户登录凭证(登录凭证的使用，请参考平台服务端相关文档)
-(void)loginSuccess:(NSString *)uid token:(NSString *)token {
    NSLog(@"登录成功：uid = %@，token = %@", uid, token);
}

// 登录失败
-(void)loginFailed {
    NSLog(@"登录失败");
}

```

### <span id="jump2.3">2.3 用户登出 (选接)</span>  
* 用户登出

```Objective-C
[[DMSDK getInstance] logout];
```

* 登出回调

```Objective-C
// ！！！游戏方需要在收到登出成功回调以后让游戏登出！！！
-(void)logoutSuccess {
    NSLog(@"登出成功");
}

-(void)logoutFailed {
    NSLog(@"登出失败");
}
```


### <span id="jump2.4">2.4 切换账号 (选接)</span>  
* 切换账号

```Objective-C
[[DMSDK getInstance] switchAccount];
```


### <span id="jump2.5">2.5 AppStore支付 (必接)</span> 
* AppStore支付

```Objective-C
DMPayConfig *payConfig = [[DMPayConfig alloc]init];
// 商品ID（必传，计费点）
payConfig.productId = @"com.thedream.zuanshi_6";
// 游戏内部订单号（可选，支付结束会透传给游戏客户端）
payConfig.cpOrderId = @"0123456789";
// 游戏区服（可选）
payConfig.cpServerId = @"上海大区～00";
// 透传字段（可选）
payConfig.cpOrigin = @"仙境传说RO";
[[DMSDK getInstance] payWithConfig:payConfig];
```

* AppStore支付回调

```Objective-C
// ！！！此处返回成功仅仅作为显示作用，支付成功与否，请以服务端的支付回调通知为准！！！
// cpOrderId - 游戏内部订单号
-(void)paySuccess:(NSString *)cpOrderId {
    NSLog(@"支付成功：%@", cpOrderId);
}
// cpOrderId - 游戏内部订单号
-(void)payFailed:(NSString *)cpOrderId {
    NSLog(@"支付失败：%@", cpOrderId);
}
// cpOrderId - 游戏内部订单号
-(void)payCancel:(NSString *)cpOrderId {
    NSLog(@"支付取消：%@", cpOrderId);
}
```


## <span id="jump3">3.F&Q</span>
### <span id="jump3.1">3.1 横竖屏适配</span>  
* SDK支持横屏和竖屏，但是不支持横竖屏相互切换。初始化中需要设置当前游戏支持横屏或者竖屏

### <span id="jump3.2">3.2 多语言支持</span>
* SDK支持多语言（英文、简体中文、繁体中文），默认支持英文

### <span id="jump3.3">3.3 SDK库导入</span>
* SDK提供的均为静态库，选择{project}->General->Frameworks,Libraries,and Embedded Content->Do Not Embed

### <span id="jump3.4">3.4 App上架注意</span>
* 因为FBSDKCoreKit.framework中包含advertisingIdentifier，上架AppStore需要勾选“广告标识符IDFA”选项
