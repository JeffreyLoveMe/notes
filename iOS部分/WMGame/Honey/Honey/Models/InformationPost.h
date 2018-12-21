//
//  InformationPost.h
//  Honey
//
//  Created by 谢吴军 on 2018/11/30.
//  Copyright © 2018 zali. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
//MARK: -JSONModel的使用
//1.新建协议@protocol
@protocol InformationPost <NSObject>

@end
//2.继承JSONModel
@interface InformationPost : JSONModel
//3.与json一一对应：如果不能对应需要调用+ (JSONKeyMapper *)keyMapper{}
@property (copy,nonatomic) NSString *descriptionId;
@property (copy,nonatomic) NSString *imageUrl;
@property (copy,nonatomic) NSString *message;

@end

/*
 怎么在一个文件中实现两个类：xxx
 */
@interface PostList : NSObject
//泛型的形式
@property (strong,nonatomic) NSMutableArray <InformationPost> *postArrM;

+(instancetype)sharedInstance;

@end
