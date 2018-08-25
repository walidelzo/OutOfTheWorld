//
//  DataOfPlanetsViewController.h
//  Out of the World
//
//  Created by walidelzo on 7/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObjects.h"
@interface DataOfPlanetsViewController : UIViewController<UITabBarDelegate,UITableViewDataSource>
@property (strong,nonatomic) OWSpaceObjects *spaceObject;
@end
