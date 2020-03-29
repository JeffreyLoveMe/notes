//
//  WMSqlViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/30.
//  Copyright © 2020 zali. All rights reserved.
//

#import "WMSqlViewController.h"
#import "FMDB.h"

@interface WMSqlViewController ()

@property (strong,nonatomic) FMDatabase *db;

@end

@implementation WMSqlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     "\"换行符号
     创建表
     */
    [self executeSQL:^(FMDatabase *db) {
        [db executeUpdate:@"create table if not exists sso \
         (id integer primary key autoincrement,\
         author text,\
         price real,\
         pages integer);"];
    }];
    //插入：加入主键防止重复插入
    [self executeSQL:^(FMDatabase *db) {
        [_db executeUpdate:@"insert or replace into sso (id,author,price,pages) values(?,?,?,?);",@1,@"XWJ",@50.00,@546];
    }];
    //更新
    [self executeSQL:^(FMDatabase *db) {
        [db executeUpdate:@"update sso set price = ?,pages = ? where author = ?;",@50.55,@568,@"XWJ"];
    }];
    //删除
    [self executeSQL:^(FMDatabase *db) {
        [db executeUpdate:@"delete from sso where pages > ?;",@569];
    }];
    //查询
    [self executeSQL:^(FMDatabase *db) {
        FMResultSet *set = [db executeQuery:@"select * from sso;"];
        while ([set next]) {
            NSString *name = [set stringForColumn:@"author"];
            double price = [set doubleForColumn:@"price"];
            int age = [set intForColumn:@"pages"];
            NSLog(@"%@===%lf===%d",name,price,age);
        }
    }];
}
    
//操作数据库
-(void)executeSQL:(void(^)(FMDatabase *db))block {
    _db = [[FMDatabase alloc] initWithPath:[NSHomeDirectory() stringByAppendingString:@"/Documents/sso.db"]];
    [_db open];
    block(_db);
    [_db close];
}

@end
