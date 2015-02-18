//
//  ALWashingController.m
//  Training task6
//
//  Created by Admin on 8/31/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALWashingController.h"

#import "ALCar.h"
#import "ALWasher.h"
#import "ALManager.h"
#import "ALBookkeeper.h"
#import "ALHandlerDispatcher.h"
#import "ALWashBuilding.h"
#import "ALAdministrativeBuilding.h"


static const NSInteger ALCarCount           = 29;
static const NSInteger ALWasherCount        = 13;
static const NSInteger ALBookkeeperCount    = 7;

@interface ALWashingController ()
@property (nonatomic, retain) ALHandlerDispatcher       *washingDispatcher;
@property (nonatomic, retain) ALHandlerDispatcher       *bookkeeperDispatcher;
@property (nonatomic, retain) ALManager                 *manager;
@property (nonatomic, retain) ALAdministrativeBuilding  *administrativeBuilding;
@property (nonatomic, retain) ALWashBuilding            *washBuilding;

- (void)addWashersWithCount:(NSInteger)count;
- (void)addBookkepersWithCount:(NSInteger)count;

- (void)registerObservers;
- (void)unregisterObservers;
- (void)registerObserverForHandlers:(id<ALObserver>)observer
                     withDispatcher:(ALHandlerDispatcher *)dispatcher;
- (void)unregisterObserverForHandlers:(id<ALObserver>)observer
                       withDispatcher:(ALHandlerDispatcher *)dispatcher;
- (void)registerObserverForHandlers:(id<ALObserver>)observer
                     withDispatcher:(ALHandlerDispatcher *)dispatcher
                       withSelector:(SEL)selector;

@end

@implementation ALWashingController

#pragma mark -
#pragma mark Class Methods

+ (id)controller {
    return [[[self alloc] initWithBookeeperCount:ALBookkeeperCount
                                     washerCount:ALWasherCount] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self unregisterObservers];

    self.administrativeBuilding = nil;
    self.washBuilding = nil;
    self.washingDispatcher = nil;
    self.bookkeeperDispatcher = nil;
    self.manager = nil;
    
    [super dealloc];
}

- (id)initWithBookeeperCount:(NSInteger)bookkeeperCount washerCount:(NSInteger)washerCount {
    self = [super init];
    
    if (self) {
        self.administrativeBuilding = [ALAdministrativeBuilding administrativeBuilding];
        self.washBuilding = [ALWashBuilding washBuilding];
        self.manager = [ALManager manager];
        self.washingDispatcher = [ALHandlerDispatcher handlerDispatcher];
        
        ALHandlerDispatcher *bookkeeperDispatcher = [ALHandlerDispatcher handlerDispatcher];
        self.bookkeeperDispatcher = bookkeeperDispatcher;
        
        [self.administrativeBuilding addHuman:self.manager];
        [self addWashersWithCount:washerCount];
        [self addBookkepersWithCount:ALBookkeeperCount];
        
        [self registerObservers];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)run {
    ALHandlerDispatcher *washingDispatcher = self.washingDispatcher;
    for (NSInteger index = 0; index < ALCarCount; index++) {
        [washingDispatcher handleOperand:[ALCar car]];
    }
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
}

#pragma mark -
#pragma mark ALObserver

- (void)humanDidFinishWorking:(ALHuman *)human {
    [self.bookkeeperDispatcher handleOperand:human];
}

#pragma mark -
#pragma mark Private

- (void)addWashersWithCount:(NSInteger)count {
    for (NSInteger index = 0; index < count; index++) {
        ALWasher *washer = [ALWasher washer];
        [self.washingDispatcher addHandler:washer];
        [self.washBuilding addHuman:washer];
    }
}

- (void)addBookkepersWithCount:(NSInteger)count {
    for (NSInteger index = 0; index < count; index++) {
        ALBookkeeper *bookkeeper = [ALBookkeeper bookkeeper];
        [self.bookkeeperDispatcher addHandler:bookkeeper];
        [self.administrativeBuilding addHuman:bookkeeper];
    }
}

- (void)registerObservers {
    ALHandlerDispatcher *washingDispatcher = self.washingDispatcher;
    [self registerObserverForHandlers:self withDispatcher:washingDispatcher];
    [self registerObserverForHandlers:washingDispatcher withDispatcher:washingDispatcher];
    
    ALHandlerDispatcher *bookkeeperDispatcher = self.bookkeeperDispatcher;
    [self registerObserverForHandlers:self.manager withDispatcher:bookkeeperDispatcher];
    [self registerObserverForHandlers:bookkeeperDispatcher withDispatcher:bookkeeperDispatcher];
}

- (void)unregisterObservers {
    ALHandlerDispatcher *bookkeeperDispatcher = self.bookkeeperDispatcher;
    [self unregisterObserverForHandlers:self.manager withDispatcher:bookkeeperDispatcher];
    [self unregisterObserverForHandlers:bookkeeperDispatcher withDispatcher:bookkeeperDispatcher];
    
    ALHandlerDispatcher *washingDispatcher = self.washingDispatcher;
    [self unregisterObserverForHandlers:self withDispatcher:washingDispatcher];
    [self unregisterObserverForHandlers:washingDispatcher withDispatcher:washingDispatcher];

}

- (void)registerObserverForHandlers:(id<ALObserver>)observer
                withDispatcher:(ALHandlerDispatcher *)dispatcher
{
    [self registerObserverForHandlers:observer
                       withDispatcher:dispatcher
                         withSelector:@selector(registerObserver:)];
}

- (void)unregisterObserverForHandlers:(id<ALObserver>)observer
                       withDispatcher:(ALHandlerDispatcher *)dispatcher
{
    [self registerObserverForHandlers:observer
                       withDispatcher:dispatcher
                         withSelector:@selector(unregisterObserver:)];
}

- (void)registerObserverForHandlers:(id<ALObserver>)observer
                     withDispatcher:(ALHandlerDispatcher *)dispatcher
                       withSelector:(SEL)selector
{
    for (ALHuman *handler in dispatcher.handlers) {
        [handler performSelector:selector withObject:observer];
    }
}

@end
