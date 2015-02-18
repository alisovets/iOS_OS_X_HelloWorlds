//
//  ALImageLabelArray.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALArrayModel.h"
#import "ALFriendsContext.h"
#import "NSFileManager+ALExtension.h"

static NSString * const ALCoderKeyForArray  = @"arrayModel";

@interface ALArrayModel ()
@property (atomic, strong) NSMutableArray    *mutableArray;

- (void)notifyRowWasAddedWithIndex:(NSInteger)index;
- (void)notifyRowWasDeletedWithIndex:(NSInteger)index;

@end

@implementation ALArrayModel

@dynamic saved;
@dynamic array;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)model {
    return [[self alloc] init];
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

- (BOOL)isSaved {
    NSString *path = [NSFileManager cachePathWithFilename:ALArchiveFile];
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

- (NSArray *)array {
    return [self.mutableArray copy];
}

#pragma mark -
#pragma mark Public

- (void)addModel:(ALAbstractModel *)model {
    NSMutableArray *array = self.mutableArray;
    if ([array containsObject:model]) {
        return;
    }
    
    [array addObject:model];
    [self notifyRowWasAddedWithIndex:[array count] - 1];
    
}

- (void)removeModel:(ALAbstractModel *)model {
    NSMutableArray *array = self.mutableArray;
    NSUInteger index = [array indexOfObject:model];
    [array removeObject:model];
    [self notifyRowWasDeletedWithIndex:index];
}

- (BOOL)containsModel:(ALAbstractModel *)model {
    return [self.mutableArray containsObject:model];
}

- (NSInteger)indexOfModel:(ALAbstractModel *)model {
    return [self.mutableArray indexOfObject:model];
}

- (ALAbstractModel *)modelAtIndex:(NSUInteger)index {
    return [self.mutableArray objectAtIndex:index];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    [self.mutableArray removeObjectAtIndex:index];
    [self notifyRowWasDeletedWithIndex:index];
}

- (void)insertModel:(ALAbstractModel *)model atIndex:(NSUInteger)index {
    NSMutableArray *array = self.mutableArray;
    if (![array containsObject:model]) {
        [array insertObject:model atIndex:index];
    }
    
    [self notifyRowWasAddedWithIndex:index];
}

- (void)moveFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    NSMutableArray *array = self.mutableArray;
    ALAbstractModel *model = [array objectAtIndex:fromIndex];
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

- (void)performUnloading {
    self.mutableArray = nil;
    [self finishUnloading];
}

- (void)performSaving {
    NSString *filePath = [NSFileManager cachePathWithFilename:ALArchiveFile];
    [NSKeyedArchiver archiveRootObject:self toFile:filePath];
}

#pragma mark -
#pragma mark Private

- (void)notifyRowWasAddedWithIndex:(NSInteger)index {
    [self notifyObserversInMainThreadWithSelector:@selector(arrayModel:didAddRowAtIndexPath:)
                                       withObject:[NSIndexPath indexPathForRow:index inSection:0]];
}

- (void)notifyRowWasDeletedWithIndex:(NSInteger)index {
    [self notifyObserversInMainThreadWithSelector:@selector(arrayModel:didDeleteRowAtIndexPath:)
                                       withObject:[NSIndexPath indexPathForRow:index inSection:0]];
}

#pragma mark -
#pragma mark NSCoding

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.mutableArray = [decoder decodeObjectForKey:ALCoderKeyForArray];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.mutableArray forKey:ALCoderKeyForArray];
}

@end
