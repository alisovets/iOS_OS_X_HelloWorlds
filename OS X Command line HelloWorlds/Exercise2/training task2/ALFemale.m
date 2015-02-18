//
//  ALFemale.m
//  training task2
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALFemale.h"

static NSString * const ALDescriptionFormat  = @"Female(%@)";

@implementation ALFemale

#pragma mark -
#pragma mark Public

- (ALCreature *)performGenderSpecificOperation {
    NSLog(@"%@ gives birth", self);
    return [ALCreature randomCreature];
}

- (NSString *)description {
    return [NSString stringWithFormat:ALDescriptionFormat,[super description]];
}

@end
