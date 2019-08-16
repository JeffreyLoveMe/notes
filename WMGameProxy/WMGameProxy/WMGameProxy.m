//
//  WMGameProxy.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

#import "WMGameProxy.h"
#import "MainController.h"

@implementation WMGameProxy

- (instancetype)init
{
    self = [super init];
    if (self) {
        MainController *vc = [MainController alloc]; // 分配内存
        vc = [vc init]; // 初始化
    }
    return self;
}

-(void)initWithGameId:(NSString *)gameId GameKey:(NSString *)gameKey {
    NSLog(@"hello world");
}

+(instancetype)getInstance {
    WMGameProxy *instance = [[WMGameProxy alloc]init];
    return instance;
}

// 不会输出self/会死循环
// NSLog()输出<类名:地址>/<Person: 0x100202310>
- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", height];
}

// 整型NSInteger
// 布尔类型BOOL
// 结构体NSRange
-(void)showRange {
    NSRange range0 = {1,5};
    NSRange range1 = NSMakeRange(1, 5);
    NSLog(@"%ld,%ld", range0.length, range1.location);
}

@end
