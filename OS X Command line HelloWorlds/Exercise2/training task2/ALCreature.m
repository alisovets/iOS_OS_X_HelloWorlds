//
//  ALCreature.m
//  example1
//
//  Created by Alexander Lisovets on 8/13/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALCreature.h"
#import "ALMale.h"
#import "ALFemale.h"

static NSString * const ALNameFormat        = @"Creature%d";
static NSString * const ALDescriptionFormat = @"name: %@ age: %ld, weight: %.2f, child count: %ld";

static const double    ALMinCreatureWeight  = 50.0;

static const NSInteger ALWeightRange        = 100;
static const NSInteger ALMinCreatureAge     = 20;
static const NSInteger ALAgeRange           = 40;
static const NSInteger ALGenderCount        = 2;


@interface ALCreature()
@property (nonatomic, retain) NSMutableArray *mutableChildren;

@end

@implementation ALCreature

#pragma mark -
#pragma mark Class Methods

+ (ALCreature *)randomCreature {
    NSString *name = [NSString stringWithFormat:ALNameFormat, arc4random()];
    NSInteger age = arc4random_uniform(ALAgeRange) + ALMinCreatureAge;
    double weight = arc4random_uniform(ALWeightRange) + ALMinCreatureWeight;
    ALCreature *creature = nil;
    if (arc4random_uniform(ALGenderCount)) {
        creature = [[ALMale alloc] initWithName:name age:age weight:weight];
    } else {
        creature = [[ALFemale alloc] initWithName:name age:age weight:weight];
    }
    
    return [creature autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.name = nil;
    
    [super dealloc];
}

- (id)initWithName:(NSString *)name age:(NSInteger)age weight:(double)weight {
    self = [super init];
    if (self) {
        self.name = name;
        self.age = age;
        self.weight = weight;
        self.mutableChildren = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSArray *)children {
    return [[self.mutableChildren copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addChild:(ALCreature *)child {
    if (![self.mutableChildren containsObject: child]) {
        [self.mutableChildren addObject: child];
    }
}

- (void)deleteChild:(ALCreature *)child {
    [self.mutableChildren removeObject:child];
}


- (void)sayHello{
    NSLog(@"%@  says hello", self);
    for (ALCreature *child in self.mutableChildren) {
        [child sayHello];
    }
}

- (ALCreature *)performGenderSpecificOperation {
    return nil;
}

- (NSString *)description {
    NSString *descriptionString = [NSString
                                   stringWithFormat:ALDescriptionFormat,
                                   self.name,
                                   self.age,
                                   self.weight,
                                   self.mutableChildren.count];
    return descriptionString;
}

@end
