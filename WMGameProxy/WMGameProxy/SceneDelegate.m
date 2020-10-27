#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

// 适配SceneDelegate - https://blog.csdn.net/holdsky/article/details/102602213
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // 对应 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    // 初始化
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc]initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    self.window.rootViewController = nil;
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // App即将被杀死
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // App已经被激活
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // App将要被挂起
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // App即将进入前台
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // App即将进入后台
}


@end
