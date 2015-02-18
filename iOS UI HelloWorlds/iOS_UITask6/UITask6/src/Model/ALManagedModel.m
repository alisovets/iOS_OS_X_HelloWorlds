//
//  ALManagedModel.m
//  UITask6
//
//  Created by Alexander Lisovets on 10/21/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALManagedModel.h"

@interface ALManagedModel ()
@property (nonatomic, strong)   ALAbstractModel *mixin;
@property (atomic, assign)      ALModelState    state;

@end

@implementation ALManagedModel

@synthesize mixin = _mixin;
@synthesize state = _state;

#pragma mark -
#pragma mark Class Methods

+ (NSPredicate *)predicateWithModel:(ALManagedModel *)model {
    return nil;
}

+ (NSFetchRequest *)fetchRequestWithModel:(ALManagedModel *)model {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass(self)];
    request.predicate = [self predicateWithModel:model];
    request.sortDescriptors = @[];
    
    return request;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self relinquishExtensionWithObject:self.mixin];
}

- (instancetype)    initWithEntity:(NSEntityDescription *)entity
    insertIntoManagedObjectContext:(NSManagedObjectContext *)context
{
    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    if (self) {
        ALAbstractModel *mixin = [ALAbstractModel new];
        mixin.target = self;
        [self extendWithObject:mixin];
        self.mixin = mixin;
    }
    
    return self;
}

@end
