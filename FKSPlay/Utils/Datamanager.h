//
//  Datamanager.h
//  FKSPlay
//
//  Created by Apple on 12/24/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Video.h"

@interface Datamanager : NSObject
@property(nonatomic,strong)NSMutableArray *favoriteVideosList;

+(id)sharedInstance;
-(void)addToFavoriteVideo:(Video*)video;
-(void)removeFavoriteVideo:(Video*)video;
@end
