//
//  FavoriteTableViewCell.m
//  FKSPlay
//
//  Created by Apple on 12/24/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "FavoriteTableViewCell.h"

@implementation FavoriteTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


-(void)setVideo:(Video *)video
{
    _video = video;
    if (video) {
        _imvThubmVideo.image = [UIImage imageNamed:video.thumbVideo];
        _lblVideoTitle.text = video.videoTitle;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
