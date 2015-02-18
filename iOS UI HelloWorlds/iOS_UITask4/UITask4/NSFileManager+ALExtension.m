//
//  NSFileManager+ALExtension.m
//  UITask4
//
//  Created by Admin on 9/27/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "NSFileManager+ALExtension.h"

static NSString * const ALCacheDirectory = @"cashes";

@implementation NSFileManager (ALExtension)

+ (NSString *)userDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return [paths objectAtIndex:0];
}

+ (NSString *)cacheDirectory {
    return [[self userDirectory] stringByAppendingPathComponent:ALCacheDirectory];
}

+ (NSString *)pathAtFilename:(NSString *)filename {
    return [[self userDirectory] stringByAppendingPathComponent:filename];
}

+ (BOOL)createDirectory:(NSString *)path {
    NSFileManager* filemanager = [NSFileManager defaultManager];
    NSError *error = nil;
    if (![filemanager createDirectoryAtPath:path
                withIntermediateDirectories:YES
                                 attributes:nil
                                      error:&error])
    {
        NSLog(@"Error: %@.", error.localizedDescription);
        
        return NO;
    }
    
    return YES;
}

+ (BOOL)deleteFile:(NSString *)path {
    NSFileManager* filemanager = [NSFileManager defaultManager];
    
    NSError *error = nil;
    if (![filemanager removeItemAtPath:path error:&error]) {
        NSLog(@"Error: %@.", error.localizedDescription);
        
        return NO;
    }
    
    return YES;
}


@end
