//
//  SyTableViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/7/9.
//  Copyright © 2019 zali. All rights reserved.
//

#import "SyTableViewController.h"

@interface SyTableViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


-(void)setupTableView {
    /// 两种类型
    // UITableViewStylePlain
    // UITableViewStyleGrouped
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    // 设置背景视图
    UIView *bgView = [[UIView alloc]initWithFrame:self.view.bounds];
    bgView.backgroundColor = UIColor.whiteColor;
    tableView.backgroundView = bgView;
    /// 设置表头/表尾
    // 如果需要动态修改表头高度：可以再次设置表头
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 100)];
    tableView.tableHeaderView = view;
    tableView.tableFooterView = view;
    // 设置delegate
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tag = 10;
    [self.view addSubview:tableView];
}


#pragma mark - UITableViewDelegate, UITableViewDataSource
/// UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    /// 设置行高
    // 默认设置44
    return 44;
}

/// UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // UITableView有多少分区
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 区中有多少行
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /// UITableViewCell默认提供四种类型
    // cell最好自定义
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    }
    cell.textLabel.text = @"绿帽子";
    cell.imageView.image = [UIImage imageNamed:@"image_demo"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end
