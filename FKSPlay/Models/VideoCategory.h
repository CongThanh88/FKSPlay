//
//  VideoCategory.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Video.h"

@interface VideoCategory : NSObject
@property(nonatomic,strong)NSString *categoryTitle;
@property(nonatomic,strong)NSArray  *listVideos;

-(Video*)videoAtIndex:(NSInteger)index;
@end
