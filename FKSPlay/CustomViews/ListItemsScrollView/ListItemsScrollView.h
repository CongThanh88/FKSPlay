//
//  ListItemsScrollView.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollItem.h"
#import "VideoItemViewDelegate.h"

typedef enum : NSUInteger {
    HeaderCell,
    CategoryCell
} CellStyle;


@interface ListItemsScrollView : UIScrollView<UIScrollViewDelegate>
@property(nonatomic,assign)CellStyle style;
@property(nonatomic,strong)NSArray *listVideos;
@property(nonatomic, weak)id<VideoItemViewDelegate> videoDelegate;
@end
