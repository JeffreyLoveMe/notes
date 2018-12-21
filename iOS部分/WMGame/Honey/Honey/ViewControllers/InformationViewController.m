//
//  InformationViewController.m
//  Honey
//
//  Created by 谢吴军 on 2018/11/30.
//  Copyright © 2018 zali. All rights reserved.
//

#import "InformationViewController.h"
#import "InformationPost.h"
#import <MJRefresh/MJRefresh.h>
#import <AFNetworking.h>

@interface InformationViewController ()

//NSInteger和int的区别？
@property (assign,nonatomic) NSInteger page; //页数
@property (strong,nonatomic) UIImageView *backImg;

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _backImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backimage.png"]];
    self.tableView.backgroundView = _backImg;
    
    _page = 1;

    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    [self.tableView.header beginRefreshing];
}

#pragma mark --方法
-(void)loadNewData {
    [self.tableView.header endRefreshing];
}

-(void)loadMoreData {
    [self.tableView.footer endRefreshing];
}

-(void)refreshPage {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"46243c6fed6a11de07cf770cd41a6aea" forHTTPHeaderField:@"apikey"];
    [manager GET:@"http://apis.baidu.com/tngou/info/news" parameters:@{
                                                                       @"id":[NSString stringWithFormat:@"%ld",self.page],
                                                                       @"classify":@"0",
                                                                       @"rows":@"20"
                                                                       } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                                           NSDictionary *result = (NSDictionary *)responseObject;
                                                                           InformationPost *list = [[InformationPost alloc]initWithDictionary:result error:nil];
                                                                           
                                                                           [self.tableView reloadData];//数据源更新
                                                                       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                                           NSLog(@"网络有问题");
                                                                       }];
}

#pragma mark --UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; // UITableView有多少段
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0; // UITableView每段有多少行
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
