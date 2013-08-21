//
//  RandomLunchViewController.m
//  RandomLunch
//
//  Created by 조 의영 on 13. 8. 20..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import "RandomLunchViewController.h"
#import "RestaurantData.h"

@interface RandomLunchViewController ()
<UITextFieldDelegate, UINavigationControllerDelegate>
@end

@implementation RandomLunchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.restaurantName.text = self.restaurant.name;
    self.restaurantInformation.text = self.restaurant.memo;
    self.restaurantPhoneNumber.text = self.restaurant.number;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
