//
//  OWSpaceObjects.m
//  Out of the World
//
//  Created by Admin on 7/8/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "OWSpaceObjects.h"
#import "AstronomicalData.h"
@implementation OWSpaceObjects

- (instancetype)init
{
    self = [super init];
    if (self) {
        self=[self initWithData:nil ];
    }
    return self;
}

-(id)initWithData:(NSDictionary *)data {
    self=[super init ];
    self.planetName=data[PLANET_NAME];
    self.planetGiravty=[data[PLANET_GRAVITY] floatValue];
    self.plantetDiameter=[data[PLANET_DIAMETER] floatValue];
    self.planetTemprature=[data[PLANET_TEMPERATURE] intValue];
    self.planetYearLenght=[data[PLANET_DAY_LENGTH] intValue];
    self.planetNumberOfMoons=[data[PLANET_NUMBER_OF_MOONS] intValue ];
    self.planetNikeName=data[PLANET_NICKNAME];
    self.planetImage=[UIImage imageNamed:[NSString stringWithFormat:@"Images/%@.jpg", data[PLANET_NAME]]];
    self.factsAboutPLanet=data[PLANET_INTERESTING_FACT];
    self.planetLenghtOfDay=[data[PLANET_DAY_LENGTH] floatValue];
    return self;
}


@end
