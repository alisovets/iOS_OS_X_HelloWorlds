//
//  ALObtainUserContext.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/1/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "IDPActiveRecordKit.h"
#import "IDPNetworkReachability.h"
#import "ALUserModel.h"
#import "NSFileManager+ALExtension.h"
#import "ALFriendsContext.h"

static NSString * const ALResultKeyForData          = @"data";
static NSString * const ALResultKeyForId            = @"id";
static NSString * const ALResultKeyForName          = @"name";
static NSString * const ALResultKeyForFirstName     = @"first_name";
static NSString * const ALResultKeyForLastName      = @"last_name";
static NSString * const ALAttributeNameForUserId    = @"userId";
static NSString * const ALRequestGraphPath          = @"/friends?fields=id,name,first_name,last_name";

@interface ALFriendsContext ()
- (void)deleteExfriends:(NSArray *)friends;

@end

@implementation ALFriendsContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithModel:(ALAbstractModel *)model {
    return [[self alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return [self.model.userId stringByAppendingString:ALRequestGraphPath];
}

- (ALManagedArrayModel*)arrayModel {
    return self.model.friendsModel;
}

#pragma mark -
#pragma mark Public

- (void)executeInBackground {
    ALUserModel *model = self.model;
    [model.friendsModel replaceModels:[model.friends allObjects]];
    
    [super executeInBackground];
}

- (void)parseResult:(id)result {
    ALUserModel *model = self.model;
    NSArray *resultFriends = [result objectForKey:ALResultKeyForData];
    NSMutableArray *friendArray = [NSMutableArray array];
    NSString *entityName = NSStringFromClass([ALUserModel class]);
    for (NSDictionary* friend in resultFriends) {
        NSString *friendId = [friend objectForKey:ALResultKeyForId];
        NSString *name = [friend objectForKey:ALResultKeyForName];
        NSString *firstName = [friend objectForKey:ALResultKeyForFirstName];
        NSString *lastName = [friend objectForKey:ALResultKeyForLastName];
        ALUserModel *friendModel = [NSManagedObjectContext getObjectWithName:friendId
                                                                    forValue:ALAttributeNameForUserId
                                                                    ofEntity:entityName];
        if (friendModel) {
            [friendArray addObject:friendModel];
            if ([self isConsistentFriend:friendModel withLoadedFriend:friend] ) {
                continue;
            }
        } else {
            friendModel = [NSManagedObjectContext managedObjectWithEntity:entityName];
            friendModel.userId = friendId;
            [friendArray addObject:friendModel];
        }

        friendModel.name = name;
        friendModel.firstName = firstName;
        friendModel.lastName = lastName;
        [friendModel addFriendModel:model];
        [NSManagedObjectContext saveManagedObjectContext];
    }
    
    [self deleteExfriends:friendArray];
    [model.friendsModel finishLoading];
}

#pragma mark -
#pragma mark Private

- (void)deleteExfriends:(NSArray *)friends {
    ALUserModel *model = self.model;
    NSSet *friendSet = [model.friends copy];
    
    for (ALUserModel *friend in friendSet) {
        if (![friends containsObject:friend]) {
            [model removeFriendModel:friend];
        }
    }
}

- (BOOL)isConsistentFriend:(ALUserModel *)friendModel withLoadedFriend:(NSDictionary *)loadedFriend {
    NSString *name = [loadedFriend objectForKey:ALResultKeyForName];
    
    if (![friendModel.name isEqualToString:name]) {
        return NO;
    }
    
    if (![friendModel.friends containsObject:self.model]) {
        return NO;
    }
    
    return YES;
}

@end
