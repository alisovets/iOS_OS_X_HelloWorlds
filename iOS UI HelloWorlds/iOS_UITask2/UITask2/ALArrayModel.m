//
//  ALImageLabelArray.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALArrayModel.h"

@interface ALArrayModel ()
@property (nonatomic, strong) NSMutableArray *array;
- (void)notifyRowWasAddedWithIndex:(NSInteger)index;
- (void)notifyRowWasDeletedWithIndex:(NSInteger)index;

@end

@implementation ALArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)arrayModelWithCount:(NSUInteger)count {
    ALArrayModel *arrayModel = [[ALArrayModel alloc] init];
    for (NSUInteger index = 0; index < count; index++) {
        ALModel *model = [ALModel model];
        [arrayModel addModel:model];
    }
    
    return arrayModel;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)init {
    self = [super init];
    if (self) {
        self.array = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addModel:(ALModel *)model {
    NSMutableArray *array = self.array;
    if ([array containsObject:model]) {
        return;
    }
    [array addObject:model];
    [self notifyRowWasAddedWithIndex:[array count] - 1];
}

- (void)removeModel:(ALModel *)model {
    NSMutableArray *array = self.array;
    NSUInteger index = [array indexOfObject:model];
    [array removeObject:model];
    [self notifyRowWasDeletedWithIndex:index];
}

- (BOOL)containsModel:(ALModel *)model {
    return [self.array containsObject:model];
}

- (NSInteger)indexOfModel:(ALModel *)model {
    return [self.array indexOfObject:model];
}

- (ALModel *)modelAtIndex:(NSUInteger)index {
    return[self.array objectAtIndex:index];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    [self.array removeObjectAtIndex:index];
    [self notifyRowWasDeletedWithIndex:index];
}

- (void)insertModel:(ALModel *)model atIndex:(NSUInteger)index {
    NSMutableArray *array = self.array;
    if (![array containsObject:model]) {
        [array insertObject:model atIndex:index];
    }
    
    [self notifyRowWasAddedWithIndex:index];
}

- (void)moveFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    NSMutableArray *array = self.array;
    ALModel *model = [array objectAtIndex:fromIndex];
    [array removeObjectAtIndex:fromIndex];
    [array insertObject:model atIndex:toIndex];
}

- (NSUInteger)count {
    return [self.array count];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self.array objectAtIndex:index];
}

#pragma mark -
#pragma mark Private
- (void)notifyRowWasAddedWithIndex:(NSInteger)index {
    [self notifyObserversInMainThreadWithSelector:@selector(arrayModel:didAddRowAtIndexPath:)
                                       withObject:[NSIndexPath indexPathForRow:index inSection:0]];
}

- (void)notifyRowWasDeletedWithIndex:(NSInteger)index {
    [self notifyObserversInMainThreadWithSelector:@selector(arrayModel:didDeletedRowAtIndexPath:)
                                       withObject:[NSIndexPath indexPathForRow:index inSection:0]];
}

@end
