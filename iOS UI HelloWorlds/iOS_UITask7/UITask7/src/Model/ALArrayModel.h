//
//  ALImageLabelArray.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALObservableObject.h"

@interface ALArrayModel : ALObservableObject
@property (nonatomic, readonly) NSArray *array;

+ (instancetype)model;

- (void)addModel:(id)model;
- (void)removeModel:(id)model;
- (void)removeModelAtIndex:(NSUInteger)index;
- (void)insertModel:(id)model atIndex:(NSUInteger)index;
- (void)moveFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
- (void)replaceModels:(NSArray *)modelArray;

- (id)modelAtIndex:(NSUInteger)index;

- (BOOL)containsModel:(id<ALObservable>)model;
- (NSInteger)indexOfModel:(id<ALObservable>)model;
- (NSUInteger)count;

- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;

@end
