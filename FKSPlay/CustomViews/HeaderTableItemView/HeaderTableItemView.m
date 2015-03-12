//
//  HeaderTableItemView.m
//  FKSPlay
//
//  Created by Cong Thanh on 12/22/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "HeaderTableItemView.h"

@implementation HeaderTableItemView

-(id)initWithFrame:(CGRect)frame{
    NSArray *listViews = [[NSBundle mainBundle]loadNibNamed:@"HeaderTableItemView" owner:nil options:nil];
    if (listViews && listViews.count>0) {
        self = [listViews firstObject];
        self.frame = frame;
    }else{
        self = [super initWithFrame:frame];
        if (self) {
        }
    }
    return self;
}

-(void)setVideo:(Video *)video
{
    _video = video;
    if (video) {
        [_btnVideo setBackgroundImage:[UIImage imageNamed:video.thumbVideo] forState:UIControlStateNormal];
        _lblVideoTitle.text = video.videoTitle;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)btnSelectVideo:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectVideo:)]) {
        [_delegate didSelectVideo:_video];
    }
}
@end
