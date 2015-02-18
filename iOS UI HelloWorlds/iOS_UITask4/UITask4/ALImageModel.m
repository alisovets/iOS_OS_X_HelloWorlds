//
//  ALImageModel.m
//  UITask4_prep
//
//  Created by Alexander Lisovets on 9/19/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALImageModel.h"
#import "ALImageCache.h"

#import "NSURL+ALExtesion.h"
#import "NSFileManager+ALExtension.h"

static NSString * const ALCoderKeyForUrl = @"url";

@interface ALImageModel ()
@property (nonatomic, strong)   UIImage                     *image;
@property (nonatomic, strong)   NSURL                       *url;
@property (nonatomic, strong)   NSString                    *cacheDirectory;
@property (nonatomic, strong)   NSString                    *cacheFilename;
@property (nonatomic, readonly) NSString                    *cachePath;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *loadTask;

@property (nonatomic, readonly, getter = isSaved) BOOL saved;

- (BOOL)saveData:(NSData *)data;
- (void)loadFromWeb;
- (BOOL)deleteCacheFile;

@end

@implementation ALImageModel

@dynamic cachePath;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    ALImageCache *imageCache = [ALImageCache sharedCache];
    ALImageModel *model = [imageCache imageModelWithURL:url];
    
    if (model) {
        self = model;
        return self;
    }
    
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    [imageCache addModel:self];
    
    return self;
}

- (void)dealloc {
    if (self.url) {
        [[ALImageCache sharedCache] removeModel:self];
    }
    
    self.url = nil;
    self.image = nil;
    self.cacheDirectory = nil;
    self.cacheFilename = nil;
    self.loadTask = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUrl:(NSURL *)url {
    _url = url;
    
    self.cacheFilename = [NSURL cacheFilenameAtURL:url];
    self.cacheDirectory = [NSFileManager cacheDirectory];
}

- (void)setLoadTask:(NSURLSessionDownloadTask *)loadTask {
    if (loadTask == _loadTask) {
        return;
    }
    
    [_loadTask cancel];
    _loadTask = loadTask;
}

#pragma mark -
#pragma mark Public

- (void)performLoading {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.saved) {
            self.image = [UIImage imageWithContentsOfFile:self.cachePath];
            if (self.image) {
                [self finishLoading];
                return;
            }
            
            [self deleteCacheFile];
        }
        
        [self loadFromWeb];
    });
}

- (void)performSaving {
    NSData *imageData = UIImagePNGRepresentation(self.image);
    [self saveData:imageData];
}

- (void)performUnloading {
    self.image = nil;
    [self finishUnloading];
}

- (void)performCanceling {
    self.loadTask = nil;
    self.image = nil;
    [self cancelLoading];
}

- (NSString *)cachePath {
    return [self.cacheDirectory stringByAppendingPathComponent:self.cacheFilename];
}

- (BOOL)isSaved {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.cachePath];
}

#pragma mark -
#pragma mark Private


- (BOOL)deleteCacheFile {
    return [NSFileManager deleteFile:self.cachePath];
}

- (void)loadFromWeb {
    NSURLSession *session = [NSURLSession sharedSession];
    
    void(^completionHandler)(NSURL *url, NSURLResponse *response, NSError *error) =
        ^(NSURL *url, NSURLResponse *response, NSError *error) {
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            self.image = [UIImage imageWithData:imageData];
            if (self.image) {
                [self saveData:imageData];
                [self finishLoading];
            } else {
                [self failLoading];
            }
        };
    
    self.loadTask = [session downloadTaskWithURL:self.url
                               completionHandler:completionHandler];
    
    [self.loadTask resume];
}

- (BOOL)saveData:(NSData *)data {
    [NSFileManager createDirectory:self.cacheDirectory];
    
    return [data writeToFile:self.cachePath atomically:YES];
}

#pragma mark -
#pragma mark NSCoding Protocol Methods

- (instancetype)initWithCoder:(NSCoder *)decoder {
    NSURL *url = [decoder decodeObjectForKey:ALCoderKeyForUrl];
    return [self initWithURL:url];
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.url forKey:ALCoderKeyForUrl];
}

@end