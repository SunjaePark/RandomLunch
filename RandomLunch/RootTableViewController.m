//
//  RootTableViewController.m
//  RandomLunch
//
//  Created by 조 의영 on 13. 8. 12..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import "RootTableViewController.h"
#import "DetailViewController.h"
#import "DataManager.h"
#import "RestaurantData.h"

@interface RootTableViewController ()
@end

@implementation RootTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        // dataManager를 여기서 만들어야 하나???;
            }
    return self;
}

- (void)viewDidLoad
{
    
    self.dataManager = [DataManager new];
    [self.dataManager openDB];
    //가져오는것 해결!
    self.restaurantsArray = [self.dataManager allRowsFromTableNamed:@"Restaurant"];
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    //random으로 식당을 보여주는 버튼.(button 이름 바꿔야 함.)
    UIBarButtonItem *randomLunch = [[UIBarButtonItem alloc]initWithTitle:@"Random Lunch"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(randomLunch)];
    //식당 추가하는 버튼
    UIBarButtonItem *addRestaurant = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                   target:self
                                                                                   action:@selector(addRestaurant)];

    self.navigationItem.rightBarButtonItem = addRestaurant;
    self.navigationItem.leftBarButtonItem = randomLunch;
}

- (void)randomLunch
{
    //random으로 식당골라서 그 정보를 띄우기.
    int randomIndex = (rand() % self.restaurantsArray.count);
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(randomIndex) inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    [self performSegueWithIdentifier:@"DetailOfRestaurantSegue" sender:self];
}

- (void) addRestaurant
{
    //db에 추가할 내용 필요.
    RestaurantData *newRestaurant = [[RestaurantData alloc]initWithIndex:2
                                                                    name:@"Put a Restaurant name"
                                                                  number:@"Put a Phone Number(00-000-0000)"
                                                                    memo:@"Put Information of Restaurant"];
    [self.restaurantsArray addObject:newRestaurant];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.restaurantsArray.count - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    [self performSegueWithIdentifier:@"DetailOfRestaurantSegue" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return self.restaurantsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RestaurantCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    RestaurantData *restaurant = self.restaurantsArray[indexPath.row];
    cell.textLabel.text = restaurant.name;
    
    return cell; 
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [self.restaurantsArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    } 
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RestaurantData *restaurantData = self.restaurantsArray[self.tableView.indexPathForSelectedRow.row];
    DetailViewController *restaurantDetailViewController = segue.destinationViewController;
    restaurantDetailViewController.restaurant = restaurantData;
}

@end
