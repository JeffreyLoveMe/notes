//
//  SyCollectionViewController.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/7/9.
//  Copyright © 2019 zali. All rights reserved.
//

#import "SyCollectionViewController.h"

@interface SyCollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation SyCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollectionView];
}

-(void)setupCollectionView {
    /**
     UICollectionView
     1.创建UICollectionView必须有布局参数
     2.UICollectionViewCell必须注册
     3.cell必须自定义/系统cell没有任何样式
     */
    // 流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // 设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置 itemSize 尺寸
    layout.itemSize = CGSizeMake(160, 160);
    // 设置最小行间距
    layout.minimumLineSpacing = 0;
    // 设置最小列间距
    layout.minimumInteritemSpacing = 0;
    // 设置区边距
    // 上左下右
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    // 预估 itemSize 尺寸
    // >= iOS 8.x
    layout.estimatedItemSize = CGSizeMake(160, 160);
    // 设置 headerView 尺寸大小
    layout.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
    // 设置 footerView 尺寸大小
    layout.footerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
//    // ！！！代码封装！！！
//    // 常用于封装 “控件”
//    UICollectionViewFlowLayout *layout =({
//        // 流水布局
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//        // 设置 itemSize 尺寸
//        layout.itemSize = CGSizeMake(160, 160);
//        // 设置最小行间距
//        layout.minimumLineSpacing = 0;
//        // 设置最小列间距
//        layout.minimumInteritemSpacing = 0;
//        // 设置滚动方向
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        // 设置区边距
//        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
//        layout;
//    });
    
    // 创建
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = UIColor.redColor;
//    // 允许选择
//    collectionView.allowsSelection = true;
//    // 允许多选
//    collectionView.allowsMultipleSelection = true;
    // 隐藏水平方向的侧边条
    collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:collectionView];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    // 注册 cell
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//    // 注册头视图
//    [collectionView registerClass:[SyHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
//    // 注册尾视图
//    [collectionView registerClass:[SyFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
}


#pragma mark - UICollectionViewDataSource
// 返回区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
// 每个区有多少 item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 只能通过 “注册cell”
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // item点击
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // 取消 item 点击
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    if (kind == UICollectionElementKindSectionHeader) {
//        // 区头
//        SyHeaderView *headerView = [collectionView dequeueReusableCellWithReuseIdentifier:@"header" forIndexPath:indexPath];
//    } else if (kind == UICollectionElementKindSectionFooter) {
//        // 区尾
//        SyFooterView *footerView = [collectionView dequeueReusableCellWithReuseIdentifier:@"footer" forIndexPath:indexPath];
//    }
//    return [collectionView dequeueReusableCellWithReuseIdentifier:@"footer" forIndexPath:indexPath];
//}


#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 设置 cell 尺寸
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 75);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // 设置 item 的 UIEdgeInsets/上、左、下、右
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    // item之间设置最小的行间距
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    // item之间设置最小的列间距
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    // header的size
    return CGSizeMake(collectionView.frame.size.width, 30);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    // footer的size
    return CGSizeMake(collectionView.frame.size.width, 30);
}


@end
