//
//  VideoTableViewCell.m
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "VideoTableViewCell.h"

@implementation VideoTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _imvThumbVideo.layer.cornerRadius = 3;
    _imvThumbVideo.layer.masksToBounds = YES;
}

-(void)setupView
{
    if (_video) {
        _imvThumbVideo.image = [UIImage imageNamed:_video.thumbVideo];
        _lblTitle.text = _video.videoTitle;
        int hours = _video.durationTime/3600;
        int minutes = (int)((int)_video.durationTime%3600)/60;
        int seconds = (int)_video.durationTime%60;
        NSString *formatTime = @"Thoi gian:";
        if (hours>0) {
            formatTime = [formatTime stringByAppendingString:[NSString stringWithFormat:@" %dgio",hours]];
        }
        
        formatTime = [formatTime stringByAppendingString:[NSString stringWithFormat:@" %dphut",minutes]];
        formatTime = [formatTime stringByAppendingString:[NSString stringWithFormat:@" %dgiay",seconds]];
        
        _lblDurationTime.text = formatTime;
        _lblViewsCount.text = [NSString stringWithFormat:@"Luot xem: %d",(int)_video.viewsCount];
    }

}


-(void)setVideo:(Video *)video{
    _video = video;
    [self setupView];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
