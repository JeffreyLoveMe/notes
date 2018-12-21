//
//  InformationCell.m
//  Honey
//
//  Created by 谢吴军 on 2018/11/30.
//  Copyright © 2018 zali. All rights reserved.
//

#import "InformationCell.h"

@implementation InformationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
    
-(void)config:(InformationPost *)post {
    self.post = post; //必写
    
    self.imgView.image = [UIImage imageNamed:post.imageUrl];
    self.datailsLabel.text = post.message;
}

@end
