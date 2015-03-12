//
//  ReachabilityManager.h
//  FKSPlay
//
//  Created by Cong Thanh on 12/19/14.
//  Copyright (c) 2014 com.htam86. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReachabilityManager : NSObject
+(ReachabilityManager*)sharedInstance;
-(BOOL)isInternetConnected;
@end
