//
//  ALBuilding.h
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALRoom.h"

@interface ALBuilding : NSObject
@property (nonatomic, readonly) NSInteger   vacantWorkplaceCount;
@property (nonatomic, readonly) NSArray     *rooms;

- (id)initWithRooms:(NSArray *)rooms;

- (BOOL)addHuman:(ALHuman *)human;
- (BOOL)removeHuman:(ALHuman *)human;
- (id)humanWithClass:(Class)aClass;
- (id)idleHumanWithClass:(Class)aClass;

@end
