//
//  RandomLunchViewController.h
//  RandomLunch
//
//  Created by 조 의영 on 13. 8. 20..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RestaurantData;

@interface RandomLunchViewController : UIViewController

@property (strong, nonatomic) RestaurantData *restaurant;

@property (strong, nonatomic) IBOutlet UITextField *restaurantName;
@property (strong, nonatomic) IBOutlet UITextView *restaurantInformation;
@property (strong, nonatomic) IBOutlet UITextField *restaurantPhoneNumber;

@end
