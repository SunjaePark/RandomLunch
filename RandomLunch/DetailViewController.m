//
//  DetailViewController.m
//  RandomLunch
//
//  Created by 조 의영 on 13. 8. 19..
//  Copyright (c) 2013년 Heaven. All rights reserved.
//

#import "DetailViewController.h"
#import "RestaurantController.h"
#import "RestaurantData.h"

@interface DetailViewController ()
<UITextFieldDelegate, UINavigationControllerDelegate>
{
    //키보드가 textfield랑 textView가리는 문제 해결하려고 사용.
     int dy;
}
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
    
    self.restaurantName.text = self.restaurant.name;
    self.restaurantInformation.text = self.restaurant.memo;
    self.restaurantPhoneNumber.text = self.restaurant.number;
    
/*******************************************************************************************************************/
//여기서 부터
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(handleHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    [center addObserver:self selector:@selector(handleAppearKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    
}

-(void)handleHideKeyboard:(NSNotification*)noti
{
    NSLog(@"keyboardWillHide");
    if(dy>0)
    {
        float animationDuration = [[[noti userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        [UIView animateWithDuration:animationDuration animations:^{
            self.view.center= CGPointMake(self.view.center.x, self.view.center.y+dy);
        }];
    }
}

-(void)handleAppearKeyboard:(NSNotification*)noti
{
    UITextField *firstResponder = (UITextField *)[self firstResponder];
    int y= firstResponder.frame.origin.y + firstResponder.frame.size.height+5;
    int viewHeight  = self.view.frame.size.height;
    
    NSDictionary *userInfo = [noti userInfo];
    NSValue *rectValue = [userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect rect = [rectValue CGRectValue];
    int keyBoardHeight = (int)rect.size.height;
    
    float animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    
    if(keyBoardHeight > (viewHeight - y))
    {
        NSLog(@"키보드가 가림");
        [UIView animateWithDuration:animationDuration animations:^{dy=keyBoardHeight-(viewHeight-y);
            self.view.center = CGPointMake(self.view.center.x, self.view.center.y-dy);
        }];
    }
    else
    {
        NSLog(@"키보드가 가리지 않음");
        dy=0;
    }
}
//여기까지 http://m.clien.net/cs3/board?bo_table=lecture&bo_style=view&wr_id=130692에서 가져옴.
/*******************************************************************************************************************/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMap:(id)sender {
    
    NSLog(@"Map will appear");
}

- (IBAction)saveRestaurant:(id)sender
{
    if ([self.restaurantName.text length] != 0)
    {
        NSLog(@"title 있으므로 저장!");
        self.restaurant.name = self.restaurantName.text;
        self.restaurant.memo = self.restaurantInformation.text;
        self.restaurant.number = self.restaurantPhoneNumber.text;

        self.restaurantName.text = @"";
        self.restaurantInformation.text = @"";
        self.restaurantPhoneNumber.text = @"";
        
        //add가 안되는 듯.
        [[RestaurantController sharedInstance] addRestaurant:self.restaurant];
    }
}

- (UIView *) firstResponder
{
    for (id view in self.view.subviews)
    {
        if (([view isKindOfClass:[UITextField class]]) || ([view isKindOfClass:[UITextView class]]))
        {
            if([view isFirstResponder])
            {
                return view;
            }
        }
    }
    return nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [[self firstResponder] resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (IBAction)onFakeTouchBackground:(id)sender
{
    [[self firstResponder] resignFirstResponder];
}


@end
