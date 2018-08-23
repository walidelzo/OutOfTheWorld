//
//  DetailViewController.h
//  Out of the World
//
//  Created by walidelzo on 7/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWSpaceObjects.h"
@interface DetailViewController : UIViewController<UIScrollViewDelegate>

@property (weak,nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) UIImageView *myImage;
@property (strong,nonatomic) OWSpaceObjects *spaceObject;

@end
