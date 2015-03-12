//
//  VideoCategoryViewController.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoCategory.h"
#import "BaseViewController.h"

@interface VideoCategoryViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) VideoCategory *category;
@property (weak, nonatomic) IBOutlet UITableView *tblVideos;

@end
