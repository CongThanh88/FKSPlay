//
//  VideoTableViewCell.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

@interface VideoTableViewCell : UITableViewCell
@property(strong, nonatomic) Video *video;

@property (weak, nonatomic) IBOutlet UIImageView *imvThumbVideo;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblDurationTime;
@property (weak, nonatomic) IBOutlet UILabel *lblViewsCount;

@end
