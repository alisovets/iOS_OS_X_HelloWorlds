//
//  NSFileManager+ALExtension.h
//  UITask4
//
//  Created by Admin on 9/27/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (ALExtension)
+ (NSString *)userDirectory;
+ (NSString *)cacheDirectory;
+ (NSString *)cachePathWithFilename:(NSString *)filename;

+ (BOOL)deleteFile:(NSString *)path;

@end
