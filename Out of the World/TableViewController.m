//
//  TableViewController.m
//  Out of the World
//
//  Created by Admin on 7/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "TableViewController.h"
#import "AstronomicalData.h"
#import "OWSpaceObjects.h"
#import "DetailViewController.h"
#import "DataOfPlanetsViewController.h"
@interface TableViewController ()

@property (strong,nonatomic) OWSpaceObjects *myDics;
@property (strong ,nonatomic) NSMutableArray * myarray ;
@property (strong,nonatomic) NSMutableArray *addedSpaceObjects;
@property(strong,nonatomic)UIImage *Image;
@end

@implementation TableViewController

#define ADDED_SPACE_OBJECTS_KEY @" Added Space Object Array "


#pragma  mark - Load Method
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //    self.planets=[[NSMutableArray alloc]initWithObjects:@"Murecy",@"Venus",@"Mars",@"Earth",@"Giptter", nil];
    
    // NSLog(@"%@",AstronomicalData.allKnownPlanets);
    
    
    //test Array and Dictionary
    
    //    NSDictionary *dic=@{@"father": @"walid",@"son":@"mahmoud"};
    //    NSArray *workDays=@[@"sunday",@"monday",@"tuesday",@"wednesday",@"tharusday"];
    //
    //   // NSLog(@"the days of work are \n %@",workDays);
    //   // NSLog(@"%@",dic);
    //    NSMutableDictionary *mutDic=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"walid",@"Name",@"Cairo",@"Address", nil];
    //    NSMutableArray *mutArr=[[NSMutableArray alloc]initWithObjects:@"one",@"tow",@"three", nil];
    //  //  NSLog(@"%@",mutArr);
    //  //  NSLog(@"%@",mutDic);
    //
    //    NSString *str=[dic objectForKey:@"son"];
    //   // NSLog(@"%@",str);
    //
    
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets]) {
        self.Image=[UIImage imageNamed:[NSString stringWithFormat:@"Images/%@.jpg", planetData[PLANET_NAME]]];
        _myDics=[[OWSpaceObjects alloc]initWithData:planetData andImage:self.Image];
        [self.myarray addObject:_myDics];
    }
    
    NSArray *myPlanetsAsPropertyList=[[NSUserDefaults standardUserDefaults]arrayForKey:ADDED_SPACE_OBJECTS_KEY];
    for (NSDictionary *dictionary in myPlanetsAsPropertyList) {
        OWSpaceObjects *spaceObject= [self spaceObjectForDictionary:dictionary];
        [self.addedSpaceObjects addObject:spaceObject];
    }
}

#pragma  mark - lazy instantion
-(NSMutableArray *)addedSpaceObjects{
    if (!_addedSpaceObjects){
        _addedSpaceObjects=[[NSMutableArray alloc]init];
    }
    return _addedSpaceObjects;
}
-(NSMutableArray *)myarray {
    if (!_myarray){
        _myarray=[[NSMutableArray alloc]init];
    }
    return _myarray;
}


#pragma  mark - helper Methods
-(NSDictionary *)spaceObjectAsApropertyList :(OWSpaceObjects *)spaceObject{
    NSData *imageOfPlanetNSData=UIImagePNGRepresentation(spaceObject.planetImage);
    NSDictionary *dictionary=@{PLANET_NAME:spaceObject.planetName,PLANET_IMAGE:imageOfPlanetNSData,PLANET_GRAVITY:@(spaceObject.planetGiravty),PLANET_DIAMETER:@(spaceObject.plantetDiameter),PLANET_NICKNAME:spaceObject.planetNikeName,PLANET_DAY_LENGTH:@(spaceObject.planetLenghtOfDay),PLANET_TEMPERATURE:@(spaceObject.planetTemprature),PLANET_YEAR_LENGTH:@(spaceObject.planetYearLenght),PLANET_NUMBER_OF_MOONS:@(spaceObject.planetNumberOfMoons),PLANET_INTERESTING_FACT:spaceObject.factsAboutPLanet};
    return dictionary;
}


-(OWSpaceObjects *)spaceObjectForDictionary:(NSDictionary*)dictionary{
    NSData *imageWithData=dictionary[PLANET_IMAGE];
    UIImage *imagefromData=[UIImage imageWithData:imageWithData];
    // self.Image=[UIImage imageNamed:[NSString stringWithFormat:@"Images/%@.jpg", dictionary[PLANET_NAME]]];
    OWSpaceObjects *spaceObject=[[OWSpaceObjects alloc]initWithData:dictionary andImage:imagefromData];
    return spaceObject;
}



#pragma  mark -OWaddObject Delegate
-(void)addSpaceObject:(OWSpaceObjects *)spaceObeject {
    
 
        //this code for persiste data to NSUserDefaults
        NSMutableArray *spaceObjectAsApropertyLists=[[[NSUserDefaults standardUserDefaults]arrayForKey:ADDED_SPACE_OBJECTS_KEY]mutableCopy];
        
        if (!spaceObjectAsApropertyLists) spaceObjectAsApropertyLists=[[NSMutableArray alloc]init];
        [spaceObjectAsApropertyLists addObject:[self spaceObjectAsApropertyList:spaceObeject]];
        
        [[NSUserDefaults standardUserDefaults] setObject:spaceObjectAsApropertyLists forKey:ADDED_SPACE_OBJECTS_KEY];
        [[NSUserDefaults standardUserDefaults]synchronize];
        [self.addedSpaceObjects addObject: spaceObeject];
        [self dismissViewControllerAnimated:YES completion:nil];
        [self.tableView reloadData];
        
   
}
-(void)DidCancel{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma  mark - segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([sender isKindOfClass:[UITableViewCell class]]){
        
        if ([segue.destinationViewController isKindOfClass:[DetailViewController class]]){
            
            DetailViewController *nextViewcontroller=segue.destinationViewController;
            NSIndexPath *path=[self.tableView indexPathForCell:sender];
            OWSpaceObjects *selectedObject;
            if (path.section==0){
                selectedObject=[self.myarray objectAtIndex:path.row];
            }else if(path.section == 1){
                selectedObject =[self.addedSpaceObjects objectAtIndex: path.row];
            }
            
            
            nextViewcontroller.spaceObject=selectedObject;
            
        }
    }
    
    
    if ([sender isKindOfClass:[NSIndexPath class]]){
        
        if ([segue.destinationViewController isKindOfClass:[DataOfPlanetsViewController class ]]){
            DataOfPlanetsViewController *nextView=segue.destinationViewController;
            NSIndexPath *path=sender;
            if (path.section==0){
                nextView.spaceObject=[self.myarray objectAtIndex:path.row];
            }else if (path.section==1){
                nextView.spaceObject=[self.addedSpaceObjects objectAtIndex:path.row];
                //                NSLog(@"path is :  %li",(long)path.row);
            }
            
        }
    }
    
    
    if ([segue.destinationViewController isKindOfClass:[addSpaceObejectViewController class]]){
        addSpaceObejectViewController *addSpaceObjectVC=segue.destinationViewController;
        addSpaceObjectVC.delegate=self;
    }
    
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self.addedSpaceObjects count]){
        return 2;
    }else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section ==1){
        return [self.addedSpaceObjects count];
    }else{
        return self.myarray.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tablePlants" forIndexPath:indexPath];
    
    if (indexPath.section ==1){
        OWSpaceObjects *spacObject=[self.addedSpaceObjects objectAtIndex: indexPath.row];
        cell.textLabel.text=spacObject.planetName;
        cell.detailTextLabel.text=spacObject.planetNikeName;
        cell.imageView.image=spacObject.planetImage;
        
    }else
    {
        OWSpaceObjects *plant=[self.myarray objectAtIndex:indexPath.row];
        cell.textLabel.text=plant.planetName;
        cell.detailTextLabel.text=plant.planetNikeName;
        cell.imageView.image=plant.planetImage;
    }
    
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}

#pragma  mark - UITable View Delegate

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"data cell identifier" sender:indexPath];
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==1) return YES;
    else return NO;
    
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        NSMutableArray *newSpaceObject=[[NSMutableArray alloc]init];
        [self.addedSpaceObjects removeObjectAtIndex:indexPath.row];
        for (OWSpaceObjects *spacObject in self.addedSpaceObjects) {
            [newSpaceObject addObject:[self spaceObjectAsApropertyList:spacObject]];
        }
        //code for NSUserDefaults
        [[NSUserDefaults standardUserDefaults]setObject:newSpaceObject forKey:ADDED_SPACE_OBJECTS_KEY];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
