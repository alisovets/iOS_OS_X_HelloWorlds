//
//  ALLoginViewController.m
//  UITask5
//
//  Created by Admin on 10/3/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALLoginContext.h"
#import "ALFriendsViewController.h"
#include "UIViewController+ALExtension.h"
#import "ALLoginViewController.h"
#import "ALLoginView.h"

static NSString * const ALErrorTitle            = @"Login failed";
static NSString * const ALErrorText             = @"Something went wrong when attempting to login.";
static NSString * const ALNavigationItemTitle   = @"Login";

@interface ALLoginViewController ()
@property (nonatomic, strong) ALLoginContext *context;

@end

@implementation ALLoginViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)dealloc {
    self.context = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = ALNavigationItemTitle;
}

#pragma mark -
#pragma mark Accessors

- (ALLoginView *)rootView {
    UIView *view = self.view;
    if ([self isViewLoaded] && [view isKindOfClass:[ALLoginView class]]) {
        return (ALLoginView *)view;
    }
    
    return nil;
}

- (void)setContext:(ALLoginContext *)context {
    if (context == _context) {
        return;
    }

    [_context cancel];
    _context = context;
}

#pragma mark -
#pragma mark Public

- (IBAction)onLoginClick:(id)sender {
    ALLoginContext *loginContext = [ALLoginContext contextWithViewController:self];
    [loginContext execute];
}

#pragma mark -
#pragma mark ALLoginDelegate

- (void)context:(ALLoginContext *)context didFinishWithSuccess:(BOOL)success {
    if (success) {
        ALFriendsViewController *viewController = [ALFriendsViewController viewController];
        viewController.model = [ALArrayModel model];
        [self.navigationController pushViewController:viewController animated:YES];
        
        return;
    }
    
    [[[UIAlertView alloc] initWithTitle:ALErrorTitle
                                message:ALErrorText
                               delegate:self
                      cancelButtonTitle:@"OK!"
                      otherButtonTitles:nil] show];
}

@end
