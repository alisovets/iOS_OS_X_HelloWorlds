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
@property (nonatomic, readonly) NSArray     *humans;
@property (nonatomic, readonly) NSInteger   vacantWorkplaceCount;

+ (ALRoom *)room ;

- (id)initWithWorkplaceCount:(NSInteger)workplaceCount;

- (BOOL)addHuman:(ALHuman *)human;
- (BOOL)removeHuman:(ALHuman *)human;

@end
