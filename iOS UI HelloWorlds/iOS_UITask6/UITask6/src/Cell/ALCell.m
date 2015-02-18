//
//  ALCell.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/10/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALCell.h"

@implementation ALCell

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.model = nil;
}

#pragma mark -
#pragma mark Public

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

- (void) prepareForReuse {
    [super prepareForReuse];
    self.model = nil;
}

@end
