//
//  addSpaceObejectViewController.h
//  Out of the World
//
//  Created by walidelzo on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObjects.h"

@protocol OWaddSpaceObjecViewControllDelegate<NSObject>

@required

-(void)addSpaceObject :(OWSpaceObjects *) spaceObeject;
-(void)DidCancel;

@end


@interface addSpaceObejectViewController : UIViewController
@property (weak,nonatomic) id <OWaddSpaceObjecViewControllDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *nameTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *nikeNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *diameterTextField;
@property (weak, nonatomic) IBOutlet UITextField *tempratureTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfMoonsTextField;
@property (weak, nonatomic) IBOutlet UITextField *FactsTextField;
- (IBAction)CancelButton:(UIButton *)sender;
- (IBAction)AddButton:(UIButton *)sender;

@end
