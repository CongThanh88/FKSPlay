//
//  ScrollItem.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

@interface ScrollItem : NSObject
@property(nonatomic,strong)Video *video;
@property(nonatomic,assign)NSInteger itemIndex;
@end
