//
//  MoviePlayerViewController.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/19/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "Video.h"

@class  MPMoviePlayerController;

@interface MoviePlayerViewController : UIViewController

@property(nonatomic,strong)Video *selectedVideo;

@end
