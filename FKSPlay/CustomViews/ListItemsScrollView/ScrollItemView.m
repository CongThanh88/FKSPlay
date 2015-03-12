//
//  ScrollItemView.m
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "ScrollItemView.h"

@implementation ScrollItemView

-(id)initWithFrame:(CGRect)frame{
    NSArray *listViews = [[NSBundle mainBundle]loadNibNamed:@"ScrollItemView" owner:nil options:nil];
    if (listViews && listViews.count>0) {
        self = [listViews firstObject];
        _btnVideoThumb.layer.cornerRadius = 5;
        _btnVideoThumb.layer.masksToBounds = YES;
    }else{
        self = [super initWithFrame:frame];
        if (self) {
            _btnVideoThumb.layer.cornerRadius = 5;
            _btnVideoThumb.layer.masksToBounds = YES;
        }
    }
    return self;
}


-(void)setItemData:(ScrollItem *)itemData{
    _itemData = itemData;
    if (itemData) {
        _lblItemTitle.text = itemData.video.videoTitle;
        if (itemData.video && itemData.video.thumbVideo) {
            [_btnVideoThumb setImage:[UIImage imageNamed:itemData.video.thumbVideo] forState:UIControlStateNormal] ;
        }
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)btnSelectItem:(id)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectVideo:)]) {
        [_delegate didSelectVideo:_itemData.video];
    }
}
@end
