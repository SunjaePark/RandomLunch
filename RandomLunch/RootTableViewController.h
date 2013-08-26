//
//  RootTableViewController.h
//  RandomLunch
//
//  Created by 조 의영 on 13. 8. 12..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataManager;

@interface RootTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray* restaurantsArray;
@property (strong, nonatomic) DataManager* dataManager;
@end
