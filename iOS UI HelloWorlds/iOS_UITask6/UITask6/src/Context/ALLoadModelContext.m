//
//  ALLoadModelContext.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALLoadModelContext.h"

@implementation ALLoadModelContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithModel:(ALAbstractModel *)model {
    return [[self alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithModel:(ALAbstractModel *)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    
    return self;
}

@end
