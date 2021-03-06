//
//  ALImageLabelArray.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALArrayModel.h"
#import "NSFileManager+ALExtension.h"

static NSString * const ALCoderKeyForArray  = @"arrayModel";

static const NSUInteger ALLoadTime = 1;

@interface ALArrayModel ()
@property (atomic, strong) NSMutableArray    *array;

- (void)notifyRowWasAddedWithIndex:(NSInteger)index;
- (void)notifyRowWasDeletedWithIndex:(NSInteger)index;

@end

@implementation ALArrayModel

@dynamic saved;

#pragma mark -
#pragma mark Accessors

- (BOOL)isSaved {
    NSString *path = [NSFileManager pathAtFilename:ALArchiveFile];
    
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

#pragma mark -
#pragma mark Public

- (void)addModel:(ALAbstractModel *)model {
    NSMutableArray *array = self.array;
    @synchronized (array){
        if ([array containsObject:model]) {
            return;
        }
        
        [array addObject:model];
        [self notifyRowWasAddedWithIndex:[array count] - 1];
    }
}

- (void)removeModel:(ALAbstractModel *)model {
    NSMutableArray *array = self.array;
    NSUInteger index = [array indexOfObject:model];
    [array removeObject:model];
    [self notifyRowWasDeletedWithIndex:index];
}

- (BOOL)containsModel:(ALAbstractModel *)model {
    return [self.array containsObject:model];
}

- (NSInteger)indexOfModel:(ALAbstractModel *)model {
    return [self.array indexOfObject:model];
}

- (ALAbstractModel *)modelAtIndex:(NSUInteger)index {
    return[self.array objectAtIndex:index];
}

- (void)removeModelAtIndex:(NSUInteger)index {
    [self.array removeObjectAtIndex:index];
    [self notifyRowWasDeletedWithIndex:index];
}

- (void)insertModel:(ALAbstractModel *)model atIndex:(NSUInteger)index {
    NSMutableArray *array = self.array;
    if (![array containsObject:model]) {
        [array insertObject:model atIndex:index];
    }
    
    [self notifyRowWasAddedWithIndex:index];
}

- (void)moveFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    NSMutableArray *array = self.array;
    ALAbstractModel *model = [array objectAtIndex:fromIndex];
    [array removeObjectAtIndex:fromIndex];
    [array insertObject:model atIndex:toIndex];
}

- (NSUInteger)count {
    return [self.array count];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self.array objectAtIndex:index];
}

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index {
    [self.array insertObject:object atIndex:index];
}

- (void)performLoading {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.saved) {
            sleep(ALLoadTime);
            ALArrayModel *arrayModel = [NSKeyedUnarchiver unarchiveObjectWithFile:
                                        [NSFileManager pathAtFilename: ALArchiveFile]];
            if ([arrayModel isKindOfClass:[ALArrayModel class]]) {
                self.array = arrayModel.array;
            }
        } else {
            self.array = [NSMutableArray array];
        }
        
        [self finishLoading];
    });
}

- (void)performUnloading {
    self.array = nil;
    [self finishUnloading];
}

- (void)performSaving {
    NSString *filePath = [NSFileManager pathAtFilename:ALArchiveFile];
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
        self.array = [decoder decodeObjectForKey:ALCoderKeyForArray];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.array forKey:ALCoderKeyForArray];
}

@end
