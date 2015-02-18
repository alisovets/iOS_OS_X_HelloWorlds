//
//  ALNetworkReachability.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/1/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.//

#import "ALNetworkReachability.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <SystemConfiguration/SystemConfiguration.h>

@implementation ALNetworkReachability

+ (BOOL)reachable {
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;

    return [self reachableHost:&zeroAddress];
}

+ (BOOL)reachableHost:(const struct sockaddr_in *)hostAddress {
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault,
                                                                                   (const struct sockaddr *)hostAddress);
    BOOL result = NO;
    if(reachability != NULL) {
        SCNetworkReachabilityFlags flags;
        if (SCNetworkReachabilityGetFlags(reachability, &flags)) {
            if ((flags & kSCNetworkReachabilityFlagsReachable) == 0) {
                result = NO;
            } else  if ((flags & kSCNetworkReachabilityFlagsConnectionRequired) == 0) {
                result = YES;
            } else if ((((flags & kSCNetworkReachabilityFlagsConnectionOnDemand ) != 0) ||
                        (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0))
            {
                if ((flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0) {
                    result = YES;
                }
            } else if ((flags & kSCNetworkReachabilityFlagsIsWWAN) == kSCNetworkReachabilityFlagsIsWWAN) {
                result = YES;
            }
        }
    }

    return result;
}

@end
