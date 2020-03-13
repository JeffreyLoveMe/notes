//
//  SyCustomCell.h
//  WMGameProxy
//
//  Created by 谢吴军 on 2020/2/10.
//  Copyright © 2020 zali. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SyTableViewCell : UITableViewCell

// 赋值方法
// 此处可以使用该方法，也可以使用 setter 方法
// 为防止 “循环引用”：有 if 就会有 else
-(void)config;

@end


@interface  SyCollectionCell: UICollectionViewCell

-(void)config;

@end


// 不能直接继承 UIView
@interface SyHeaderView : UICollectionReusableView

@end


// 不能直接继承 UIView
@interface SyFooterView : UICollectionReusableView

@end

NS_ASSUME_NONNULL_END
