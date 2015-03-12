//
//  VideoCategoryTableViewCell..h
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItemsScrollView.h"
#import "VideoCategory.h"
#import "VideoItemViewDelegate.h"

@interface VideoCategoryTableViewCell : UITableViewCell

@property(strong, nonatomic) VideoCategory *videoCategory;

@property (weak, nonatomic) IBOutlet UILabel *lblTitleCell;
@property (weak, nonatomic) IBOutlet ListItemsScrollView *svListitem;
@property (weak, nonatomic) id<VideoItemViewDelegate> delegate;

@end
