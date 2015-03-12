//
//  Video.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property(nonatomic,strong)NSString *videoTitle;
@property(nonatomic,strong)NSString *author;
@property(nonatomic,assign)double durationTime;
@property(nonatomic,assign)NSInteger viewsCount;
@property(nonatomic,strong)NSString *thumbVideo;
@property(nonatomic,strong)NSString *videoUrl;
@end
