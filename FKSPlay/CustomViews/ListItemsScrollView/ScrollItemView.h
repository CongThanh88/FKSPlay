//
//  ScrollItemView.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollItem.h"
#import "VideoItemViewDelegate.h"

@interface ScrollItemView : UIView
@property(nonatomic,strong) ScrollItem *itemData;
@property (weak, nonatomic) IBOutlet UIButton *btnVideoThumb;
@property (weak, nonatomic) IBOutlet UILabel *lblItemTitle;
@property (weak, nonatomic) id<VideoItemViewDelegate> delegate;
- (IBAction)btnSelectItem:(id)sender;
@end
