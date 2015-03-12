//
//  MainViewController.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "VideoItemViewDelegate.h"

@interface MainViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate, VideoItemViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tblCategory;

@end

