//
//  ALWeakLink.m
//  training task4
//
//  Created by Alexander Lisovets on 8/21/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALWeakLink.h"

@interface ALWeakLink ()
@property (nonatomic, strong) id target;

@end

@implementation ALWeakLink

#pragma mark -
#pragma mark Class Methods

+ (instancetype)weakLinkWithTarget:(id)target{
    return [[ALWeakLink alloc] initWithTarget:target];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithTarget:(id)target{
    self = [super init];
    if (self) {
        self.target = target;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSUInteger)hash {
    return (NSInteger)self.target;
}

- (BOOL)isEqual:(id)target {
    if([target isKindOfClass:[ALWeakLink class]]) {
        ALWeakLink *weakLink  = target;
        
        return [self isEqualToWeakLink:weakLink];
    }

    return NO;
}

- (BOOL)isEqualToWeakLink:(ALWeakLink *)weakLink {
    return self.target == weakLink.target;
}

@end
