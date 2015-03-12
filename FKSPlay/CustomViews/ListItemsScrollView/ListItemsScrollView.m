//
//  ListItemsScrollView.m
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "ListItemsScrollView.h"
#import "ScrollItemView.h"
#import "HeaderTableItemView.h"

#define kMargin         0
#define kPadding        2

@implementation ListItemsScrollView
{
    NSArray *listItemViews;
    NSArray *listItems;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        listItemViews = [[NSArray alloc]init];
        self.delegate = self;
        self.style = HeaderCell;
    }
    return self;
}

-(void)setListVideos:(NSArray *)listVideos{
    _listVideos = listVideos;
    if (listItemViews && listItemViews.count>0) {
        [self refreshView];
    }else{
        [self setupView];
    }
}


-(void)layoutSubviews{
    [super layoutSubviews];
    [self refreshView];
}

-(void)setVideoDelegate:(id<VideoItemViewDelegate>)videoDelegate
{
    _videoDelegate = videoDelegate;
    if (listItemViews && listItemViews.count>0) {
        if (_style == HeaderCell) {
            for (HeaderTableItemView *headerView in listItemViews) {
                if (headerView) {
                    headerView.delegate = videoDelegate;
                }
            }
        }else{
            for (ScrollItemView *itemView in listItemViews) {
                if (itemView) {
                    itemView.delegate = videoDelegate;
                }
            }
        }
        
    }
}

-(void)setupView
{
    if (_listVideos) {
        float height = self.frame.size.height - 2*kPadding;
        float width = 3*height/2;
        float contentWidth = _listVideos.count*(width + kMargin) + kMargin;
        if (_style == HeaderCell) {
            width = self.frame.size.width;
            height = 2*width/3;
            contentWidth = _listVideos.count*width;
        }
        
        for (int i=0; i< _listVideos.count; i++) {
            Video *video = [_listVideos objectAtIndex:i];
            if (video) {
                if (_style == HeaderCell) {
                    float position_X = i*width;
                    HeaderTableItemView *headerItemView = [[HeaderTableItemView alloc]initWithFrame:CGRectMake(position_X, 0, width, height)];
                    headerItemView.delegate = _videoDelegate;
                    headerItemView.video = video;
                    [self addSubview:headerItemView];
                    listItemViews = [listItemViews arrayByAddingObject:headerItemView];
                }else{
                    ScrollItem *item = [[ScrollItem alloc]init];
                    item.video = video;
                    item.itemIndex = i;
                    float position_X = i*(kMargin + width) + kMargin;
                    ScrollItemView *itemView = [[ScrollItemView alloc]initWithFrame:CGRectMake(position_X, kPadding, width, height)];
                    itemView.delegate = _videoDelegate;
                    itemView.itemData = item;
                    [self addSubview:itemView];
                    listItemViews = [listItemViews arrayByAddingObject:itemView];
                }
            }
        }
        
        self.contentSize =  CGSizeMake(contentWidth, self.frame.size.height);
    }
}


-(void)refreshView
{
    if (listItemViews && listItemViews.count>0) {
        float height = self.frame.size.height - 2*kPadding;
        float width = 3*height/2;
        float contentWidth = _listVideos.count*(width + kMargin) + kMargin;
        if (_style == HeaderCell) {
            width = self.frame.size.width;
            height = 2*width/3;
            contentWidth = _listVideos.count*width;
        }
        
        for (int i=0; i< listItemViews.count; i++) {
                if (_style == HeaderCell) {
                    float position_X = i*width;
                    HeaderTableItemView *headerItemView = [listItemViews objectAtIndex:i];
                    headerItemView.frame = CGRectMake(position_X, 0, width, height);
                }else{
                    ScrollItemView *itemView = [listItemViews objectAtIndex:i];
                    float position_X = i*(kMargin + width) + kMargin;
                    itemView.frame = CGRectMake(position_X, kPadding, width, height);
                }
        }
        
        self.contentSize =  CGSizeMake(contentWidth, self.frame.size.height);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
