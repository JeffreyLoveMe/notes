//
//  EyeeCommunity.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2018/12/11.
//  Copyright © 2018 zali. All rights reserved.
//

#import "EyeeCommunity.h"

@implementation EyeeCommunity

-(void) onLine:(int)age {
    
    if (age > 18) {
        NSLog(@"开网卡");
    }
}

@end
