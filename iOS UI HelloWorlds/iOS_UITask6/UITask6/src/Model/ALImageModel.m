//
//  ALImageModel.m
//  UITask4_prep
//
//  Created by Alexander Lisovets on 9/19/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALImageCache.h"
#import "NSURL+ALExtesion.h"
#import "NSFileManager+ALExtension.h"
#import "ALImageModel.h"

static NSString * const ALCoderKeyForUrl = @"url";

@interface ALImageModel ()
@property (nonatomic, strong)   NSURLSessionDownloadTask    *loadTask;
@property (nonatomic, strong)   UIImage                     *image;
@property (nonatomic, strong)   NSURL                       *url;
@property (nonatomic, readonly) NSString                    *cacheDirectory;
@property (nonatomic, readonly) NSString                    *cacheFilename;
@property (nonatomic, readonly) NSString                    *cachePath;

@property (nonatomic, readonly, getter = isCached) BOOL cached;

- (BOOL)saveData:(NSData *)data;
- (void)loadFromWeb;
- (BOOL)deleteCacheFile;

@end

@implementation ALImageModel

@dynamic cacheDirectory;
@dynamic cacheFilename;
@dynamic cachePath;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithUrl:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    if (self.url) {
        [[ALImageCache sharedCache] removeModel:self];
    }
    
    self.url = nil;
    self.image = nil;
    self.loadTask = nil;
}

- (instancetype)initWithURL:(NSURL *)url {
    if (!url) {
        return nil;
    }
    
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

#pragma mark -
#pragma mark Accessors

- (void)setUrl:(NSURL *)url {
    _url = url;
}

- (void)setLoadTask:(NSURLSessionDownloadTask *)loadTask {
    if (loadTask == _loadTask) {
        return;
    }
    
    [_loadTask cancel];
    _loadTask = loadTask;
}

- (NSString *)cacheFilename {
    return [NSURL cacheFilenameAtURL:self.url];
}

- (NSString *)cacheDirectory {
    return [NSFileManager cacheDirectory];
}

#pragma mark -
#pragma mark Public

- (void)performLoading {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        __strong typeof (self) strongSelf = weakSelf;
        if (strongSelf.cached) {
            UIImage *image = [UIImage imageWithContentsOfFile:self.cachePath];
            strongSelf.image = image;
            if (image) {
                [strongSelf finishLoading];
                return;
            }
            
            [strongSelf deleteCacheFile];
        }
        
        [strongSelf loadFromWeb];
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

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.cachePath];
}

#pragma mark -
#pragma mark Private

- (BOOL)deleteCacheFile {
    return [NSFileManager deleteFile:self.cachePath];
}

- (void)loadFromWeb {
    NSURLSession *session = [NSURLSession sharedSession];
    NSString * cachePath = self.cachePath;
    
    __weak typeof(self) weakSelf = self;
    void(^completionHandler)(NSURL *url, NSURLResponse *response, NSError *error) =
        ^(NSURL *url, NSURLResponse *response, NSError *error) {
            __strong typeof (self) strongSelf = weakSelf;
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            [imageData writeToFile:cachePath atomically:YES];
            
            strongSelf.image = [UIImage imageWithData:imageData];
            if (strongSelf.image) {
                [strongSelf saveData:imageData];
                [strongSelf finishLoading];
            } else {
                [strongSelf failLoading];
            }
        };
    
    NSURLSessionDownloadTask *loadTask = [session downloadTaskWithURL:self.url
                                                    completionHandler:completionHandler];
    self.loadTask = loadTask;
    [loadTask resume];
}

- (BOOL)saveData:(NSData *)data {
    return [data writeToFile:self.cachePath atomically:YES];
}

@end