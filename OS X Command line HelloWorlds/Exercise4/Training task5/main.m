//
//  main.m
//  training task4
//
//  Created by Alexander Lisovets on 8/21/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALAdministrativeBuilding.h"
#import "ALWashBuilding.h"

static const NSInteger ALCarCount       = 50;

ALAdministrativeBuilding *ALCreateAdministrativeBuilding();
ALWashBuilding *ALCreateWashBuildingWithWashers();
void ALAddCarsInWashBuilding(ALWashBuilding *washBuilding, NSInteger carCount);
void ALRegisterObserverToHumansInBuilding(ALBuilding *building, id<ALObserver> objerver);

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        ALAdministrativeBuilding *administrativeBuilding = ALCreateAdministrativeBuilding();
        ALWashBuilding *washBuilding = ALCreateWashBuildingWithWashers();
        
        ALBookkeeper *bookkeeper = [administrativeBuilding humanWithClass:[ALBookkeeper class]];
        ALManager *manager = [administrativeBuilding humanWithClass:[ALManager class]];
        
        [bookkeeper registerObserver:manager];
        ALRegisterObserverToHumansInBuilding(washBuilding, bookkeeper);
        
        ALAddCarsInWashBuilding(washBuilding, ALCarCount);
        NSLog(@"----");
        
        for(NSInteger index = 0; index < ALCarCount; index++){
            ALWasher *washer = [washBuilding idleHumanWithClass:[ALWasher class]];
            ALCar *car = [washBuilding dirtyCar];
            [washer washCar:car];
        }
    }
    
    return 0;
}

ALAdministrativeBuilding *ALCreateAdministrativeBuilding(){
    ALAdministrativeBuilding *administrativeBuilding = [ALAdministrativeBuilding
                                                        administrativeBuilding];
    
    ALBookkeeper *bookkeper = [ALBookkeeper bookkeeper];
    ALManager *manager = [ALManager manager];
    
    [administrativeBuilding addHuman:bookkeper];
    [administrativeBuilding addHuman:manager];
    
    return administrativeBuilding;
}

ALWashBuilding *ALCreateWashBuildingWithWashers(){
    ALWashBuilding *washBuilding = [ALWashBuilding randomWashBuilding];
    
    NSInteger washerCount = [washBuilding.rooms count];
    for (NSInteger index = 0; index < washerCount; index++) {
        ALWasher *washer = [ALWasher washer];
        [washBuilding addHuman:washer];
    }
    
    return washBuilding;
}

void ALAddCarsInWashBuilding(ALWashBuilding *washBuilding, NSInteger carCount){
    for (NSInteger index = 0; index < carCount; index++) {
        [washBuilding  addCar:[ALCar car]];
    }
}
                                 
void ALRegisterObserverToHumansInBuilding(ALBuilding *building, id<ALObserver> objerver){
    for(ALRoom *room in building.rooms){
        for(ALHuman *human in room.humans){
            [human registerObserver:objerver];
        }
    }
}
        


