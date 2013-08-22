//
//  AppDelegate.m
//  RandomLunch
//
//  Created by Heaven on 13. 8. 9..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTableViewController.h"
#import "DataManager.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    DataManager *dataManager = [DataManager new];
    [dataManager openDB];
    [dataManager createTableNamed:@"Restaurant" withField1:@"name" withField2:@"number" withField3:@"memo"];
    NSString *name = @"KohranThai";
    NSString *number = @"010-8999-7677";
    NSString *memo = @"Thai Restaurant";
    NSString *name2 = @"GangNam Market";
    NSString *number2 = @"02-999-7677";
    NSString *memo2 = @"Korean Restaurant";

    [dataManager insertRecordIntoTableNamed:@"Restaurant" withField1:@"name" field2:@"number" field3:@"memo" field1Value:name field2Value:number field3Value:memo];
    [dataManager insertRecordIntoTableNamed:@"Restaurant" withField1:@"name" field2:@"number" field3:@"memo" field1Value:name2 field2Value:number2 field3Value:memo2];
    
    [dataManager getAllRowsFromTableNamed:@"Restaurant"];
//
//    //storyboard 이용.
//    NSString *restaurant1 = [NSString new];
//    NSString *restaurant2 = [NSString new];
//    
//    restaurant1 = @"hello";
//    restaurant2 = @"world";
//    
//    NSArray *testArray = [NSArray arrayWithObjects:restaurant1, restaurant2, nil];
//    
//    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
//    RootTableViewController *tableViewController = navigationController.viewControllers[0];
//    tableViewController.restaurantsArray = [testArray mutableCopy];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
