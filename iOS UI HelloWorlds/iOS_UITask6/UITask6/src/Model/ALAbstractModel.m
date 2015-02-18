//
//  ALAbstractModel.m
//  UITask3
//
//  Created by Alexander Lisovets on 9/17/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALAbstractModel.h"

@interface ALAbstractModel ()
@property (atomic, assign) ALModelState  state;

- (void)notifyModelWillLoad;
- (void)notifyModelDidLoad;
- (void)notifyModelDidPartlyLoad;
- (void)notifyModelDidUnload;
- (void)notifyModelLoadingDidFail;
- (void)notifyModelLoadingDidCancel;

@end

@implementation ALAbstractModel

#pragma mark -
#pragma mark Private

- (void)notifyModelWillLoad {
    [self notifyObserversInMainThreadWithSelector:@selector(modelWillLoad:) withObject:nil];
}

- (void)notifyModelDidLoad {
    [self notifyObserversInMainThreadWithSelector:@selector(modelDidLoad:) withObject:nil];
}

- (void)notifyModelDidPartlyLoad {
    [self notifyObserversInMainThreadWithSelector:@selector(modelDidPartlyLoad:) withObject:nil];
}

- (void)notifyModelDidUnload {
    [self notifyObserversInMainThreadWithSelector:@selector(modelDidUnload:) withObject:nil];
}

- (void)notifyModelLoadingDidFail {
    [self notifyObserversInMainThreadWithSelector:@selector(modelDidFail:) withObject:nil];
}

- (void)notifyModelLoadingDidCancel {
    [self notifyObserversInMainThreadWithSelector:@selector(modelDidCancel:) withObject:nil];
}

#pragma mark -
#pragma mark ALObservableModel

- (void)load {
    @synchronized(self) {
        switch (self.state) {
            case ALModelLoading:
                [self startLoading];
                break;
                
            case ALModelLoaded:
                [self finishLoading];
                break;
                
            default:
                [self startLoading];
                [self performLoading];
        }
    }
}

- (void)unload {
    @synchronized(self) {
        if (ALModelLoaded == self.state) {
            [self performUnloading];
        }
    }
}

- (void)save {
    @synchronized(self) {
        if (ALModelLoaded == self.state) {
            [self performSaving];
        }
    }
}

- (void)cancel {
    @synchronized(self) {
        if (ALModelLoaded == self.state) {
            [self performCanceling];
        }
    }
}

- (void)startLoading {
    self.state = ALModelLoading;
    [self notifyModelWillLoad];
}

- (void)finishPartlyLoading {
    self.state = ALPartiallyLoaded;
    [self notifyModelDidPartlyLoad];
}

- (void)finishLoading {
    self.state = ALModelLoaded;
    [self notifyModelDidLoad];
}

- (void)finishUnloading {
    self.state = ALModelUnloaded;
    [self notifyModelDidUnload];
}

- (void)failLoading {
    self.state = ALModelFailed;
    [self notifyModelLoadingDidFail];
}

- (void)cancelLoading {
    self.state = ALModelFailed;
    [self notifyModelLoadingDidCancel];
}

- (void)refreshState {
    if (self.state != ALModelLoading) {
        self.state = ALModelUnloaded;
    }
}

- (void)performLoading {
    
}

- (void)performUnloading {
    
}

- (void)performSaving {
    
}

- (void)performCanceling {
    
}

@end
