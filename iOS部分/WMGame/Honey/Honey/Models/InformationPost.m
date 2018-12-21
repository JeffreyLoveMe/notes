//
//  InformationPost.m
//  Honey
//
//  Created by 谢吴军 on 2018/11/30.
//  Copyright © 2018 zali. All rights reserved.
//

#import "InformationPost.h"

@implementation InformationPost
//4.调用+ (JSONKeyMapper *)keyMapper{}
+ (JSONKeyMapper *)keyMapper {
    
    NSDictionary *keyDict = @{
                              @"description":@"description_id"
                              };
    //JSONKeyMapper *keyMapper = [[JSONKeyMapper alloc]initWithDictionary:keyDict];
    JSONKeyMapper *keyMapper = [[JSONKeyMapper alloc]initWithModelToJSONDictionary:keyDict];
    return keyMapper;
    
}

@end

static PostList *sharedInstance = nil;
@implementation PostList

+ (JSONKeyMapper *)keyMapper {
    NSDictionary *keyMapper = @{
                                @"tngou":@"post"
                                };
    //return [[JSONKeyMapper alloc]initWithDictionary:keyMapper];
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:keyMapper];
}

+(instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PostList alloc]init];
    });
    return sharedInstance;
}

-(instancetype)init {
    if (self = [super init]) {
        self.postArrM = (id)[NSMutableArray array];
    }
    return self;
}

@end
