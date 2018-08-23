//
//  DataOfPlanetsViewController.m
//  Out of the World
//
//  Created by walidelzo on 7/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "DataOfPlanetsViewController.h"

@interface DataOfPlanetsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation DataOfPlanetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor=[UIColor blackColor];
    //self.tableview.backgroundColor=[UIColor clearColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view  Data Source

- (NSInteger)tableView:( UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 8;
}

- ( UITableViewCell *)tableView:( UITableView *)tableView cellForRowAtIndexPath:( NSIndexPath *)indexPath {
    NSString *cellIdentifier=@"data cell identifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text=@"Nike Name:";
            cell.detailTextLabel.text=self.spaceObject.planetNikeName;
            break;
        case 1:
            cell.textLabel.text=@"Planet Giravty:";
            cell.detailTextLabel.text=[NSString stringWithFormat:@"%f",self.spaceObject.planetGiravty];
            break;
        case 2:
            cell.textLabel.text=@"Planet Diameter:";
            cell.detailTextLabel.text=[NSString stringWithFormat:@"%f",self.spaceObject.plantetDiameter];
        case 3:
            cell.textLabel.text=@"Planet lenght of year (days) ";
            cell.detailTextLabel.text=[NSString stringWithFormat:@"%d",self.spaceObject.planetYearLenght];
            break;
        case 4:
            cell.textLabel.text=@"Planet Temperature (celisus)";
            cell.detailTextLabel.text=[NSString stringWithFormat:@"%D",self.spaceObject.planetTemprature];
            break;
        case 5:
            cell.textLabel.text=@"Planet Number of moons:";
            [cell.detailTextLabel setText:[NSString stringWithFormat:@"%d",self.spaceObject.planetNumberOfMoons] ];
            break;
            
        case 6:
            cell.textLabel.text=@"Facts about Planet";
            cell.detailTextLabel.text=self.spaceObject.factsAboutPLanet;
            break;
        case 7:
            cell.textLabel.text=@"Planet days (Hours):";
            [cell.detailTextLabel setText:[NSString stringWithFormat:@"%d",self.spaceObject.planetLenghtOfDay] ];
            break;
        default:
            break;
    }
    
    
    
    return cell;
}




@end
