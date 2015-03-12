//
//  VideoCategory.m
//  FKSPlay
//
//  Created by Cong Thanh on 12/18/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "VideoCategory.h"

@implementation VideoCategory

-(id)init
{
    self = [super init];
    if (self) {
        self.listVideos = [[NSArray alloc]init];
    }
    return self;
}


-(Video*)videoAtIndex:(NSInteger)index
{
    if (index >=0 && _listVideos && _listVideos.count > index) {
        return [_listVideos objectAtIndex:index];
    }
    return nil;
}
@end
