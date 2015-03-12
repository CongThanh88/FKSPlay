//
//  HeaderTableItemView.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/22/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"
#import "VideoItemViewDelegate.h"

@interface HeaderTableItemView : UIView

@property (strong, nonatomic)Video *video;
@property (weak, nonatomic) IBOutlet UIButton *btnVideo;
@property (weak, nonatomic) IBOutlet UILabel *lblVideoTitle;
@property (weak, nonatomic) id<VideoItemViewDelegate> delegate;

- (IBAction)btnSelectVideo:(id)sender;
@end
