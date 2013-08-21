//
//  DetailViewController.m
//  RandomLunch
//
//  Created by 조 의영 on 13. 8. 19..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
<UITextFieldDelegate, UINavigationControllerDelegate>
@end

@implementation DetailViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
