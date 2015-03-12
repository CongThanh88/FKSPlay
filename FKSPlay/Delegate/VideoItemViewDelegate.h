//
//  VideoItemViewDelegate.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/23/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Video;

@protocol VideoItemViewDelegate <NSObject>
-(void)didSelectVideo:(Video*)video;
@end
