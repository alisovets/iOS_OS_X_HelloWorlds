//
//  ALMale.m
//  training task2
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALMale.h"

static NSString * const ALDescriptionFormat  = @"Male(%@)";

@implementation ALMale

#pragma mark -
#pragma mark Public

- (ALCreature *)performGenderSpecificOperation {
    NSLog(@"%@ begins a war", self);
    return nil;
}

- (NSString *)description {
    return [NSString stringWithFormat:ALDescriptionFormat,[super description]];
}

@end
