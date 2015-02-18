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

- (void)dealloc {
    self.requestConnection = nil;
}

- (instancetype)initWithModel:(ALAbstractModel *)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setRequestConnection:(FBRequestConnection *)requestConnection {
    if (requestConnection == _requestConnection) {
        return;
    }
    
    [_requestConnection cancel];
    _requestConnection = requestConnection;
}

#pragma mark -
#pragma mark Public

- (void)execute {
    ALAbstractModel *model = self.model;
    ALModelState state = model.state;
    [model load];
    
    if (!(ALModelLoading == state || ALModelLoaded == state)) {
        [super execute];
    }
}

- (void)cancel {
    [self.requestConnection cancel];
    [self.model cancel];
}

@end
