//
//  Datamanager.m
//  FKSPlay
//
//  Created by Apple on 12/24/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "Datamanager.h"

@implementation Datamanager
+(id)sharedInstance
{
    static Datamanager *datamanger;
    static dispatch_once_t one_token;
    dispatch_once(&one_token, ^{
        datamanger = [Datamanager new];
    });
    return datamanger;
}

-(id)init
{
    self = [super init];
    if (self) {
        self.favoriteVideosList = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)addToFavoriteVideo:(Video *)video
{
    if (video && ![_favoriteVideosList containsObject:video]) {
        [_favoriteVideosList addObject:video];
    }
}

-(void)removeFavoriteVideo:(Video *)video
{
    if (video && _favoriteVideosList) {
        [_favoriteVideosList removeObject:video];
    }
}
@end
