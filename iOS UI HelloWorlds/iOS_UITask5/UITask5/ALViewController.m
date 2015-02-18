//
//  ALViewController.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/10/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALViewController.h"

@implementation ALViewController

@dynamic contextClass;
@dynamic rootViewClass;

#pragma mark -
#pragma mark View Lifecycle

- (void)viewWillDisappear:(BOOL)animated {
    self.context = nil;
    
    [super viewWillDisappear:animated];
}

#pragma mark -
#pragma mark Accessors

- (void)dealloc {
    self.model = nil;
    self.context = nil;
}

- (ALAbstractRootView *)rootView {
    UIView *view = self.view;
    if ([self isViewLoaded] && [view isKindOfClass:[self rootViewClass]]) {
        return (ALAbstractRootView *)view;
    }
    
    return nil;
}

- (void)setModel:(ALAbstractModel *)model {
    if (model != _model) {
        [_model unregisterObserver:self];
        _model = model;
        [_model registerObserver:self];
        
        [self loadModel];
    }
}

- (void)setContext:(ALLoadModelContext *)context {
    if (context == _context) {
        return;
    }
    
    [_context cancel];
    _context = context;
}

#pragma mark -
#pragma mark Public

- (Class)contextClass {
    return [ALLoadModelContext class];
}

- (void)loadModel {
    ALAbstractModel *model = self.model;
    if (model) {
        ALLoadModelContext *context = [[self contextClass] contextWithModel:model];
        self.context = context;
        [context execute];
    }
}

#pragma mark -
#pragma mark ALModelObserver

- (void)modelWillLoad:(ALAbstractModel *)model {
    [self.rootView showWaitingView];
}

- (void)modelDidLoad:(ALAbstractModel *)model {
    self.context = nil;
    [self.rootView hideWaitingView];
}

- (void)modelDidFail:(ALAbstractModel *)model {
    self.context = nil;
    [self.rootView hideWaitingView];
}

@end
