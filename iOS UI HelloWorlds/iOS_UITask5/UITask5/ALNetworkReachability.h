//
//  ALNetworkReachability.h
//  UITask5
//
//  Created by Alexander Lisovets on 10/1/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALNetworkReachability : NSObject

+ (BOOL)reachable;
+ (BOOL)reachableHost:(const struct sockaddr_in *)hostAddress;

@end
