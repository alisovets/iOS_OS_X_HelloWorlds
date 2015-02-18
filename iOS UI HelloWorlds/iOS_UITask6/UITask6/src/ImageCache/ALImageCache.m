//
//  ALImageCache.m
//  UITask4
//
//  Created by Alexander Lisovets on 9/24/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALImageCache.h"
#import "ALWeakLink.h"

@interface ALImageCache ()
@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation ALImageCache

#pragma mark -
#pragma mark Class Methods

+ (id)sharedCache {
    static ALImageCache *sharedCache = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedCache = [[self alloc] init];
    });
    
    return sharedCache;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dictionary = [NSMutableDictionary dictionary];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addModel:(ALImageModel *)model {
    NSMutableDictionary *dictionary = self.dictionary;
    @synchronized(dictionary) {
        [dictionary setObject:[ALWeakLink weakLinkWithTarget:model] forKey:model.url];
    }
}

- (void)removeModel:(ALImageModel *)model {
    NSMutableDictionary *dictionary = self.dictionary;
    @synchronized(dictionary) {
        [dictionary removeObjectForKey:model.url];
    }
}

- (ALImageModel *)imageModelWithURL:(NSURL *)url {
    NSMutableDictionary *dictionary = self.dictionary;
    @synchronized(dictionary) {
        ALWeakLink *weakLink = [dictionary objectForKey:url];
        
        return weakLink.target;
    }
}

@end
