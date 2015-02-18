//
//  ALContext.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/1/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import "ALContext.h"

@implementation ALContext

#pragma mark -
#pragma mark Accessors

- (void)setRequestConnection:(FBRequestConnection *)requestConnection {
    if (requestConnection == _requestConnection) {
        return;
    }
    
    [_requestConnection cancel];
    _requestConnection = requestConnection;
}

- (NSString *)graphPath {
    return nil;
}

#pragma mark -
#pragma mark Public

- (void)execute {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        __strong typeof (self) strongSelf = weakSelf;
        [strongSelf executeInBackground];
    });
}

- (void)executeInBackground {
    
}

- (void)obtainModel {
    __weak typeof(self) weakSelf = self;
    self.requestConnection = [FBRequestConnection startWithGraphPath:self.graphPath
                                                          parameters:nil
                                                          HTTPMethod:@"GET"
                                                   completionHandler:^(FBRequestConnection *connection,
                                                                       id result,
                                                                       NSError *error)
                              {
                                  __strong typeof (self) strongSelf = weakSelf;
                                  if (error) {
                                      NSLog(@"error: %@", [FBErrorUtility userMessageForError:error]);
                                      [strongSelf notifyAboutFail];
                                      strongSelf.requestConnection = nil;
                                      
                                      return;
                                  }
                                  
                                  [strongSelf parseResult:result];
                                  strongSelf.requestConnection = nil;
                              }];
}

- (void)notifyAboutFail {

}

- (void)parseResult:(id)result {

}

- (void)cancel {
    [self.requestConnection cancel];
    [self.model cancel];
}

@end
