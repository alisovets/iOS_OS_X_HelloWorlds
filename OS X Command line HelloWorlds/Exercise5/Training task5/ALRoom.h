//
//  ALRoom.h
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALHuman.h"

@interface ALRoom : NSObject
@property (atomic, readonly) NSArray     *humans;
@property (atomic, readonly) NSInteger   vacantWorkplaceCount;

+ (ALRoom *)roomWithWorkplaceCount:(NSInteger)workplaceCount;

- (id)initWithWorkplaceCount:(NSInteger)workplaceCount;

- (BOOL)addHuman:(ALHuman *)human;
- (BOOL)removeHuman:(ALHuman *)human;

@end
