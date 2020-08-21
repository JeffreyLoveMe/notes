
# 平台国内SDK接入指南_v3.0.0（iOS）
* [1.环境和配置](#jump1)
    * [1.1 库&资源文件下载](#jump1.1)
    * [1.2 库&资源文件引用](#jump1.2)
    * [1.3 info.plist修改](#jump1.3)
    * [1.4 编辑DreamSDKConfig.plist](#jump1.4)
    * [1.5 其它配置](#jump1.5)
* [2.接入任务](#jump2)
    * [2.1 初始化 (必接)](#jump2.1)
    * [2.2 用户登录 (必接)](#jump2.2)
    * [2.3 用户登出 (选接)](#jump2.3)
    * [2.4 AppStore支付 (必接)](#jump2.4)
* [3.F&Q](#jump3)
    * [3.1 横竖屏适配](#jump3.1)
    * [3.2 SDK库导入](#jump3.2)
    * [3.3 App上架注意](#jump3.3)

## <span id="jump1">1. 环境和配置</span>  
### <span id="jump1.1">1.1 库&资源文件下载</span>  
包含以下文件: 
* `DreamSDK.framework`（SDK库文件）
* `DreamSDK.bundle` (SDK资源文件) 
* `DreamSDKConfig.plist` (SDK配置文件) 

### <span id="jump1.2">1.2 库&资源文件引用</span> 
引用系统依赖库:
* AdSupport.framework
* CoreTelephony.framework
* libc++.tbd
* libsqlite3.tbd
* libz.tbd
* StoreKit.framework

### <span id="jump1.3">1.3 info.plist修改</span>  
* 添加白名单

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>wechat</string>
	<string>weixin</string>
</array>
```

* 设置URL schemes

```xml
# wechatAppID - 微信的APP_ID
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLName</key>
        <string>weixin</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>{wechatAppID}</string>
        </array>
    </dict>
</array>
```

### <span id="jump1.4">1.4 编辑DreamSDKConfig.plist</span> 
* DEBUG_MODE
    * 0 - dev环境/1 - 沙箱环境/ 2 - 生产环境（！！！上线之前务必设置为2！！！）
* LANDSCAPE_GAME
    * 是否是横屏游戏（必传）
* APP_ID
    * 平台分配的游戏ID（必传）
* CHANNEL_ID
    * 平台分配的渠道ID（必传）
* WECHAT_APPID
    * 微信的APP_ID（必传）

### <span id="jump1.5">1.5 其它配置</span>  
* 支持iOS版本
     * SDK支持版本 >= iOS8.0
     
* 关闭Bitcode
    * 如果使用的IDE为Xcode7.x以上版本需要选择{project}->build Settings->Enable Bitcode->NO
    
* 设置-ObjC
     * 选择{project}->build Settings->Other Linker Flags->-ObjC -all_load

* 支持In-App Purchase
     * 选择{project}->Signing & Capabilities，增加In-App Purchase选项
    

## <span id="jump2">2.接入任务</span>  
### <span id="jump2.1">2.1 初始化 (必接)</span>

* 设置DreamSDKDelegate

```Objective-C
#import <DreamSDK/DreamSDK.h>

// ViewController为您的"回调处理类"
@interface {ViewController} () <DreamSDKDelegate>

@end

```

* 初始化
    * 必须使用[DreamSDK getInstance]实例化DreamSDK，否则可能会发生未知错误
    * DEBUG_MODE - 上线之前务必设置为2

```Objective-C
// 初始化 - 必须使用[DreamSDK getInstance]实例化DreamSDK，否则可能会发生未知错误
// 设置DreamSDKDelegate为您的"回调处理类（通常是当前类）"
[[DreamSDK getInstance] initWithDelegate:self];
```

* 初始化回调

```Objective-C
// ！！！游戏方需要在收到初始化成功回调之后再操作后续流程！！！
-(void)initComplete:(BOOL)isOk {
    if (isOk) {
        self.textView.text = [NSString stringWithFormat:@"%@\n初始化成功", self.textView.text];
    } else {
        self.textView.text = [NSString stringWithFormat:@"%@\n初始化失败", self.textView.text];
    }
}
```


* 在AppDelegate.m中：

```Objective-C
#import <DreamSDK/DreamSDK.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // TODO：
    return [[DreamSDK getInstance] application:application didFinishLaunchingWithOptions:launchOptions];
}

// ！！！如果项目支持iOS9.0以下需要调用该方法！！！
- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url API_DEPRECATED_WITH_REPLACEMENT("application:openURL:options:", ios(2.0, 9.0)) API_UNAVAILABLE(tvos) {
    // TODO：
    return [[DreamSDK getInstance] application:application handleOpenURL:url];
}

-(BOOL)application:(UIApplication *)application
           openURL:(NSURL *)url
 sourceApplication:(NSString *)sourceApplication
        annotation:(id)annotation API_DEPRECATED_WITH_REPLACEMENT("application:openURL:options:", ios(4.2, 9.0)) {
    // TODO：
    return [[DreamSDK getInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

// ！！！如果项目支持iOS9.0以上需要调用该方法！！！
-(BOOL)application:(UIApplication *)app
           openURL:(NSURL *)url
           options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options API_AVAILABLE(ios(9.0)) {
    // TODO：
    return [[DreamSDK getInstance] application:app openURL:url options:options];
}
```


### <span id="jump2.2">2.2 用户登录 (必接)</span>  
* 用户登录

```Objective-C
[[DreamSDK getInstance] login];
```

* 登录回调

```Objective-C
// 登录成功
// uid - 登录用户名
// token - 用户登录凭证(登录凭证的使用，请参考平台服务端相关文档)
-(void)loginComplete:(BOOL)isOk
                 uid:(NSString *_Nullable)uid
               token:(NSString *_Nullable)token {
    if (isOk) {
        self.textView.text = [NSString stringWithFormat:@"%@\n登录成功：uid = %@,token = %@", self.textView.text, uid, token];
    } else {
        self.textView.text = [NSString stringWithFormat:@"%@\n登录失败", self.textView.text];
    }
}
```

### <span id="jump2.3">2.3 用户登出 (选接)</span>  
* 用户登出

```Objective-C
[[DreamSDK getInstance] logout];
```

* 登出回调

```Objective-C
// ！！！游戏方需要在收到登出成功回调以后让游戏登出！！！
-(void)logoutComplete:(BOOL)isOk {
    if (isOk) {
        self.textView.text = [NSString stringWithFormat:@"%@\n登出成功", self.textView.text];
    } else {
        self.textView.text = [NSString stringWithFormat:@"%@\n登出失败", self.textView.text];
    }
}
```


### <span id="jump2.4">2.4 AppStore支付 (必接)</span> 
* AppStore支付

```Objective-C
DreamPayConfig *config = [[DreamPayConfig alloc] init];
// 区服ID
config.cpAreaId = 1234567890;
// 支付金额(RMB)
config.cpCash = 6.00;
// 商品描述，如: 购买30元月卡
config.cpBody = @"仙境传说RO";
// 商品代号（计费点）
config.cpProductId = @"com.thedream.zuanshi_6";
// 商品数量
config.cpProdcutCount = @"1";
// 游戏内部订单号
config.cpOrderId = @"0123456789";
// 游戏签名
config.cpSign = @"仙境传说RO～仙境传说RO";
// 透传字段（可选）
config.cpOrigin = @"仙境传说RO～仙境传说RO～仙境传说RO";
[[DreamSDK getInstance] payWithConfig:config];
```

* AppStore支付回调

```Objective-C
// ！！！此处返回成功仅仅作为显示作用，支付成功与否，请以服务端的支付回调通知为准！！！
// cpOrderId - 游戏内部订单号
-(void)payComplete:(BOOL)isOk
         cpOrderId:(NSString *_Nullable)cpOrderId {
    if (isOk) {
        self.textView.text = [NSString stringWithFormat:@"%@\n支付成功 => %@", self.textView.text, cpOrderId];
    } else {
        self.textView.text = [NSString stringWithFormat:@"%@\n支付失败 => %@", self.textView.text, cpOrderId];
    }
}
```


## <span id="jump3">3.F&Q</span>
### <span id="jump3.1">3.1 横竖屏适配</span>  
* SDK支持横屏和竖屏，但是不支持横竖屏相互切换。初始化中需要设置当前游戏支持横屏或者竖屏

### <span id="jump3.2">3.2 SDK库导入</span>
* SDK提供的均为静态库，选择{project}->General->Frameworks,Libraries,and Embedded Content->Do Not Embed

### <span id="jump3.3">3.3 App上架注意</span>
* 因为SDK中包含advertisingIdentifier，上架AppStore需要勾选“广告标识符IDFA”选项
