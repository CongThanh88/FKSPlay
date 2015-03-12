//
//  HeaderTableViewCell.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/22/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItemsScrollView.h"
#import "VideoItemViewDelegate.h"

@interface HeaderTableViewCell : UITableViewCell<UIScrollViewDelegate>
@property(nonatomic, strong)NSArray *listVideos;
@property (weak, nonatomic) IBOutlet ListItemsScrollView *srvVideos;
@property (weak, nonatomic) id<VideoItemViewDelegate> delegate;
@end
