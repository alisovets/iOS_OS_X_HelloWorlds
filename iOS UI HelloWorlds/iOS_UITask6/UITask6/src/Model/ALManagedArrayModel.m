//
//  ALManagedArrayModel.m
//  UITask6
//
//  Created by Alexander Lisovets on 10/30/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALUserModel.h"
#import "NSFetchedResultsController+ALExtension.h"
#import "ALManagedArrayModel.h"

@interface ALManagedArrayModel ()
@property (nonatomic, strong) NSFetchedResultsController    *controller;

@end

@implementation ALManagedArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithUserModel:(ALUserModel *)userModel entityClass:(Class)entityClass {
    return [[self alloc] initWithUserModel:userModel entityClass:entityClass];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithUserModel:(ALUserModel *)userModel entityClass:(Class)entityClass {
    self = [self init];
    if (self) {
        NSFetchRequest *fetchRequest = [entityClass fetchRequestWithModel:userModel];
        NSFetchedResultsController *controller = [NSFetchedResultsController
                                                  controllerWithFetchRequest:fetchRequest];
        self.controller = controller;
        controller.delegate = self;
        [controller performFetch:nil];
    }
    
    return self;
}

#pragma mark -
#pragma mark NSFetchedResultsControllerDelegate

- (void) controller:(NSFetchedResultsController *)controller
    didChangeObject:(id)anObject
        atIndexPath:(NSIndexPath *)indexPath
      forChangeType:(NSFetchedResultsChangeType)type
       newIndexPath:(NSIndexPath *)newIndexPath
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self addModel:anObject];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self removeModel:anObject];
            break;
            
        case NSFetchedResultsChangeUpdate:
            
        default:
            break;
    }
}

@end
