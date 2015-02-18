//
//  NSURL+ALExtesion.m
//  UITask4
//
//  Created by Alexander Lisovets on 9/25/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "NSURL+ALExtesion.h"

@implementation NSURL (ALExtesion)

+ (NSString *)cacheFilenameAtURL:(NSURL *)url {
    return [[url absoluteString] stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
}

@end
