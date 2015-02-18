//
//  NSURL+ALExtesion.m
//  UITask4
//
//  Created by Alexander Lisovets on 9/25/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "NSURL+ALExtesion.h"

static NSString * const ALFaceBookPath                  = @"http://graph.facebook.com";
static NSString * const ALFaceBookLargeImagePathSuffix  = @"picture?type=large";
static NSString * const ALFaceBookSmallImagePathSuffix  = @"picture?type=small";

@implementation NSURL (ALExtesion)

+ (NSString *)cacheFilenameAtURL:(NSURL *)url {
    return [[url absoluteString] stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
}

+ (NSURL *)imageURLForFacebookId:(NSString *)facebookId isLarge:(BOOL)isLarge {
    NSString *suffix = nil;
    if (isLarge) {
        suffix = ALFaceBookLargeImagePathSuffix;
    } else {
        suffix = ALFaceBookSmallImagePathSuffix;
    }
    
    NSString *path = [ALFaceBookPath stringByAppendingPathComponent:facebookId];
    path = [path stringByAppendingPathComponent:suffix];
    
    return [NSURL URLWithString:path];
}

@end
