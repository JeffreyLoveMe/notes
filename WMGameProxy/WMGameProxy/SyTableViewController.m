//
//  SyTableViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/7/9.
//  Copyright © 2019 zali. All rights reserved.
//

#import "SyTableViewController.h"
/// 匿名类别
// 可以定义属性和方法
// 可以声明私有方法和私有变量
@interface SyTableViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
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
//    // 编辑模式
//    tableView.editing = true;
    [self.view addSubview:tableView];
}


#pragma mark - UITableViewDelegate, UITableViewDataSource
/// UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    /// 设置行高
    // 默认设置44
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    /// 设置区头
    // 默认设置44
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    /// 设置区尾
    // 默认设置44
    return 44;
}

///// 很少使用
//// 一般通过自定义控件实现
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    /// 设置区头title
//    return @"好男人";
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    /// 设置区尾title
//    return @"好男人";
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /// 某一行被选中
    // 通过NSIndexPath可以拿到UITableViewCell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    // 通过UITableViewCell可以拿到NSIndexPath
    NSIndexPath *index = [tableView indexPathForCell:cell];
    if (index.row == indexPath.row) {
        
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    /// 某一行取消选中
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    /// 返回编辑类型
    // 支持删除和插入
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 编辑以后更新数据源
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    // ？？？实现行的移动？？？
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    }
    /// cell的属性
    // 控件属性
    cell.textLabel.text = @"好男人";
    cell.detailTextLabel.text = @"绿帽子";
    cell.imageView.image = [UIImage imageNamed:@"image_demo"];
    // 真正属性
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end
