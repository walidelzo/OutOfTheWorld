//
//  OWSpaceObjects.h
//  Out of the World
//
//  Created by Admin on 7/8/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OWSpaceObjects : NSObject

#pragma mark Properties
//keys of our Dictionary
@property (strong,nonatomic) NSString *planetName;
@property (nonatomic) float planetGiravty;
@property (nonatomic) float plantetDiameter;
@property (nonatomic) int planetYearLenght;
@property(nonatomic)int planetLenghtOfDay;
@property (nonatomic) int   planetTemprature;
@property (nonatomic) int  planetNumberOfMoons;
@property (nonatomic,strong) NSString *planetNikeName;
@property (nonatomic,strong) NSString *factsAboutPLanet;
@property (strong,nonatomic) UIImage *planetImage;

#pragma mark Methods
//we can init the array of the dictionaries
-(id)initWithData : (NSDictionary*) data ;

@end
