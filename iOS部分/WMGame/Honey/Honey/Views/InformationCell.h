//
//  InformationCell.h
//  Honey
//
//  Created by 谢吴军 on 2018/11/30.
//  Copyright © 2018 zali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InformationPost.h"

@interface InformationCell : UITableViewCell

@property (strong,nonatomic) InformationPost *post; //接受model

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *datailsLabel;

-(void)config:(InformationPost *)post;

@end
