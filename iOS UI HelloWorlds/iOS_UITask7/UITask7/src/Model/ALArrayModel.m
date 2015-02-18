//
//  ALImageLabelArray.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALArrayModelObserverProtocol.h"
#import "ALArrayModel.h"

@interface ALArrayModel ()
@property (nonatomic, strong) NSMutableArray    *mutableArray;
- (void)notifyRowWasAddedWithIndex:(NSInteger)index;
- (void)notifyRowWasDeletedWithIndex:(NSInteger)index;

@end

@implementation ALArrayModel

@dynamic array;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)model {
    return [self new];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableArray = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)array {
    return [self.mutableArray copy];
}

#pragma mark -
#pragma mark Public

- (void)addModel:(id)model {
    NSMutableArray *array = self.mutableArray;
    @synchronized (array){
        if ([array containsObject:model]) {
            return;
        }
        
        [array addObject:model];
        [self notifyRowWasAddedWithIndex:[array count] - 1];
    }
}

- (void)removeModel:(id)model {
    NSMutableArray *array = self.mutableArray;
    NSUInteger index = [array indexOfObject:model];
    [array removeObject:model];
    [self notifyRowWasDeletedWithIndex:index];
}

- (BOOL)containsModel:(id)model {
    return [self.mutableArray containsObject:model];
}

- (NSInteger)indexOfModel:(id)model {
    return [self.mutableArray indexOfObject:model];
}

- (id)modelAtIndex:(NSUInteger)index {
    return[self.mutableArray objectAtIndex:index];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    [self.mutableArray removeObjectAtIndex:index];
    [self notifyRowWasDeletedWithIndex:index];
}

- (void)insertModel:(id)model atIndex:(NSUInteger)index {
    NSMutableArray *array = self.mutableArray;
    if (![array containsObject:model]) {
        [array insertObject:model atIndex:index];
    }
    
    [self notifyRowWasAddedWithIndex:index];
}

- (void)moveFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    NSMutableArray *array = self.mutableArray;
    id model = [array objectAtIndex:fromIndex];
    [array removeObjectAtIndex:fromIndex];
    [array insertObject:model atIndex:toIndex];
}

- (void)replaceModels:(NSArray *)modelArray {
    NSMutableArray *array = self.mutableArray;
    [array removeAllObjects];
    [array addObjectsFromArray:modelArray];
}

- (NSUInteger)count {
    return [self.mutableArray count];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self.mutableArray objectAtIndex:index];
}

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index {
    [self.mutableArray insertObject:object atIndex:index];
}

#pragma mark -
#pragma mark Private

- (void)notifyRowWasAddedWithIndex:(NSInteger)index {
    [self notifyObserversInMainThreadWithSelector:@selector(arrayModel:didAddRowAtIndex:)
                                       withObject:[NSNumber numberWithInteger:index]];
}

- (void)notifyRowWasDeletedWithIndex:(NSInteger)index {
    [self notifyObserversInMainThreadWithSelector:@selector(arrayModel:didDeleteRowAtIndex:)
                                       withObject:[NSNumber numberWithInteger:index]];
}

@end
