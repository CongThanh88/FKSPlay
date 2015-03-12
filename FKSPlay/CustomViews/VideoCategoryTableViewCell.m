//
//  VideoCategoryTableViewCell..m
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "VideoCategoryTableViewCell.h"

@implementation VideoCategoryTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _svListitem.style = CategoryCell;
    _svListitem.videoDelegate = _delegate;
}

-(void)setVideoCategory:(VideoCategory *)videoCategory{
    _videoCategory = videoCategory;
    _svListitem.videoDelegate = _delegate;
    if (videoCategory) {
        _lblTitleCell.text = videoCategory.categoryTitle;
        _svListitem.listVideos = videoCategory.listVideos;
    }
}

-(void)setDelegate:(id<VideoItemViewDelegate>)delegate{
    _delegate = delegate;
    _svListitem.videoDelegate = delegate;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
