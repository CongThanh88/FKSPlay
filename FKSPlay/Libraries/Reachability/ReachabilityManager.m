//
//  ReachabilityManager.m
//  FKSPlay
//
//  Created by Cong Thanh on 12/19/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import "ReachabilityManager.h"
#import "Reachability.h"

@implementation ReachabilityManager
{
    Reachability *reachabilityWifi;
}

+(ReachabilityManager*)sharedInstance{
    static ReachabilityManager *reachabilityManager = nil;
    static dispatch_once_t token_one;
    dispatch_once(&token_one, ^{
        reachabilityManager = [ReachabilityManager new];
    });
    return reachabilityManager;
}

-(id)init
{
    self = [super init];
    if (self) {
        reachabilityWifi = [Reachability reachabilityForLocalWiFi];
    }
    return self;
}


-(BOOL)isInternetConnected
{
    return ([reachabilityWifi currentReachabilityStatus] == ReachableViaWiFi)?YES:NO;
}
@end
