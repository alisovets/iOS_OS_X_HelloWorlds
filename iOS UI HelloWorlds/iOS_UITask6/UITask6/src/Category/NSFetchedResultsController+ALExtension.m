//
//  NSFetchedResultsController+ALExtension.m
//  UITask6
//
//  Created by Alexander Lisovets on 10/22/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "IDPActiveRecordKit.h"
#import "NSFetchedResultsController+ALExtension.h"

@implementation NSFetchedResultsController (ALExtension)

+ (instancetype)controllerWithFetchRequest:(NSFetchRequest *)fetchRequest {
    IDPCoreDataManager *manager = [IDPCoreDataManager sharedManager];
    NSManagedObjectContext *context = manager.managedObjectContext;

    return [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                               managedObjectContext:context
                                                 sectionNameKeyPath:nil
                                                          cacheName:nil];
}

@end
