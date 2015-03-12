//
//  HeaderTableViewCell.m
//  FKSPlay
//
//  Created by Cong Thanh on 12/22/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "HeaderTableViewCell.h"
#import "HeaderTableItemView.h"


@implementation HeaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _srvVideos.style = HeaderCell;
    _srvVideos.videoDelegate = _delegate;
}

-(void)setListVideos:(NSArray *)listVideos{
    _listVideos = listVideos;
    if (listVideos) {
        _srvVideos.videoDelegate = _delegate;
        _srvVideos.listVideos = listVideos;
        
    }
}

-(void)setDelegate:(id<VideoItemViewDelegate>)delegate{
    _delegate = delegate;
    _srvVideos.videoDelegate = delegate;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
