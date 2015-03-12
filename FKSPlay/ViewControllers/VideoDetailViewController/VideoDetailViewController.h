//
//  VideoDetailViewController.h
//  FKSPlay
//
//  Created by Apple on 12/23/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "BaseViewController.h"
#import "Video.h"

@interface VideoDetailViewController : BaseViewController
@property (weak, nonatomic)Video *video;

@property (weak, nonatomic) IBOutlet UIView *thumbVideoView;

@property (weak, nonatomic) IBOutlet UIImageView *imvThumbVideo;
@property (weak, nonatomic) IBOutlet UITableView *tblInfo;
@property (weak, nonatomic) IBOutlet UIView *menuTopView;
@property (weak, nonatomic) IBOutlet UIButton *btnAddToFavorite;
@property (weak, nonatomic) IBOutlet UIButton *btnPlayVideo;

- (IBAction)addToFavorite:(id)sender;
- (IBAction)playVideo:(id)sender;
@end
