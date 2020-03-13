//
//  SyCustomFlowLayout.m
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/3/13.
//  Copyright © 2020 zali. All rights reserved.
//

#import "SyCustomFlowLayout.h"

@implementation SyCustomFlowLayout
// 什么时候调用 - UICollectionView第一次布局/UICollectionView刷新
// 作用 - 计算 cell 的布局 / cell的位置固定不变
// 默认只会调用一次 / 除非在此刷新
- (void)prepareLayout {
    [super prepareLayout];
    
}

/**
 ！！！最常用！！！
 1.UICollectionViewLayoutAttributes - 确定 cell 的尺寸 / 操作 cell
 2.什么时候调用 -
 3.作用 - 返回"指定一段区域内 cell 的尺寸" / 可以一次性全部返回 / 可以每隔一段距离返回
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
//    // 可以每隔一段距离返回
//    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    // 可以一次性全部返回
    NSArray *array = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, MAXFLOAT, MAXFLOAT)];
    for (UICollectionViewLayoutAttributes *attr in array) {
        attr.transform = CGAffineTransformMakeScale(0.5, 0.5);
    }
    return array;
}

/**
 BOOL - 是否
 should - 允许
 */
// 作用 - 在滚动的时候是否允许刷新布局
// 默认选择 NO
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return NO;
}

// 什么时候调用 - 用户手指一松开就会调用
// 作用 - 确定最终偏移量（指的是最终停止时候的偏移量/不是手指离开时候的偏移量）
// 手指一松开如果速度过快还会有惯性
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    return [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
}

// 作用 - 计算 UICollectionView 滚动范围
- (CGSize)collectionViewContentSize {
    return [super collectionViewContentSize];
}

@end
