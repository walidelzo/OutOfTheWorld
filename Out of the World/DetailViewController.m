//
//  DetailViewController.m
//  Out of the World
//
//  Created by walidelzo on 7/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.myImage=[[UIImageView alloc]initWithImage:_spaceObject.planetImage];
    [self.scrollView addSubview:_myImage];
    self.scrollView.delegate=self;
    self.scrollView.maximumZoomScale=4.0;
    self.scrollView.minimumZoomScale=.5;
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.myImage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
