//
//  TableViewController.h
//  Out of the World
//
//  Created by Admin on 7/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addSpaceObejectViewController.h"
@interface TableViewController : UITableViewController<OWaddSpaceObjecViewControllDelegate>
@property (strong,nonatomic) OWSpaceObjects *myDics;
@property (strong ,nonatomic) NSMutableArray * myarray ;
@property(strong,nonatomic)UIImage *Image;
@property (strong,nonatomic) NSMutableArray *addedSpaceObjects;
@end
