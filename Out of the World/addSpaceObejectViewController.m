//
//  addSpaceObejectViewController.m
//  Out of the World
//
//  Created by walidelzo on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "addSpaceObejectViewController.h"


@interface addSpaceObejectViewController ()

@end

@implementation addSpaceObejectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage * orionImage  =[UIImage imageNamed:@"Images/Orion.jpg"];
   self.view.backgroundColor=[UIColor colorWithPatternImage:orionImage];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)CancelButton:(UIButton *)sender {
    [self.delegate DidCancel];
}

- (IBAction)AddButton:(UIButton *)sender {
    [self.delegate addSpaceObject:[self returnSpaceObject]];
}

-(OWSpaceObjects *)returnSpaceObject{
    
    OWSpaceObjects *addedspaceObject=[[OWSpaceObjects alloc]init];
    addedspaceObject.planetName=self.nameTextFiled.text;
    addedspaceObject.planetNikeName=self.nikeNameTextField.text;
    addedspaceObject.plantetDiameter=[self.diameterTextField.text floatValue];
    addedspaceObject.planetTemprature=[self.tempratureTextField.text floatValue];
    addedspaceObject.planetNumberOfMoons=[self.numberOfMoonsTextField.text floatValue];
    addedspaceObject.factsAboutPLanet=self.FactsTextField.text;
    addedspaceObject.planetImage=[UIImage imageNamed:@"Images/EinsteinRing.jpg"];
    //NSLog(@"%@",addedspaceObject.planetName);
    return addedspaceObject;
}



@end
