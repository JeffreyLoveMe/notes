//
//  HomePageController.m
//  UIScrollView以及子视图
//
//  Created by 谢吴军 on 2019/3/7.
//  Copyright © 2019 zali. All rights reserved.
//

#import "HomePageController.h"

@interface HomePageController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *saleTableView;
@property (strong, nonatomic) NSMutableArray *arrM;

@end

@implementation HomePageController

#pragma mark -- lazy
-(UITableView *)saleTableView {
    if (_saleTableView == nil) {
        _saleTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:_saleTableView];
        _saleTableView.backgroundColor = UIColor.redColor;
        _saleTableView.separatorColor = UIColor.grayColor; // 分割线颜色
        /*
         分割线样式：
         UITableViewCellSeparatorStyleNone,
         UITableViewCellSeparatorStyleSingleLine,
         UITableViewCellSeparatorStyleSingleLineEtched
         */
        _saleTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
        
        
        
        _saleTableView.delegate = self;
        _saleTableView.dataSource = self;
    }
    return _saleTableView;
}

-(NSMutableArray *) arrM {
    if (_arrM == nil) {
        _arrM = [[NSMutableArray alloc]init];
    }
    return _arrM;
}

#pragma mark -- UITableViewDataSource
// 返回分区个数
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 返回分区行数
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

// 设置cell：只要cell在屏幕出现就会执行该方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}

#pragma mark -- UITableViewDelegate
// 返回每行高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

// 点击cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

@end
