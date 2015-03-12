//
//  FavoriteTableViewCell.h
//  FKSPlay
//
//  Created by Apple on 12/24/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

@interface FavoriteTableViewCell : UITableViewCell

@property (strong, nonatomic) Video *video;
@property (weak, nonatomic) IBOutlet UIImageView *imvThubmVideo;
@property (weak, nonatomic) IBOutlet UILabel *lblVideoTitle;

@end
