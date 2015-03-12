//
//  VideoFavoriteViewController.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/19/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoFavoriteViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tblListFavorites;

@end
