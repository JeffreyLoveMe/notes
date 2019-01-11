//
//  EyeeNetworkController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/1/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import "EyeeNetworkController.h"
#import "AFNetworking.h"

@interface EyeeNetworkController ()
    
@property (strong,nonatomic) NSMutableArray *photos;// 数据源

@end

@implementation EyeeNetworkController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photos = [NSMutableArray array];// 数据源必须init
}

-(void)pulldownToRefresh {
    // 网络请求管理类
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // GET网络请求
    // url
    // parameters
    // progress
    [manager GET:@"https://api.app.net/posts/stream/explore/photos" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求success
        // task-网络请求任务
        // responseObject-请求返回的对象
        NSDictionary *result = (NSDictionary *)responseObject;
        for (NSDictionary *dict in result[@"data"]) {
            [self.photos addObject: dict];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         // 请求fail
        // task-网络请求任务
        // error-失败的原因
    }];
}

@end
