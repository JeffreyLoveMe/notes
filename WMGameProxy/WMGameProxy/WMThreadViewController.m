//
//  WMThreadViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/16.
//  Copyright © 2020 zali. All rights reserved.
//

#import "WMThreadViewController.h"

@interface WMThreadViewController ()

@end

@implementation WMThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1>.获取主线程
    NSThread *mainThread = [NSThread mainThread];
    // 2>.获取当前线程
    NSThread *currentThread = [NSThread currentThread];
    // 3>.判断是否是主线程
    if ([NSThread isMainThread]) {
        NSLog(@"当前线程是主线程");
    }
    if ([mainThread isMainThread]) {
        NSLog(@"当前线程是主线程");
    }
    NSLog(@"输出当前方法名%s", __FUNCTION__);
}

@end
