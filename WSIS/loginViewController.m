//
//  loginViewController.m
//  WSIS
//
//  Created by Codi Admin on 2/16/14.
//  Copyright (c) 2014 htss. All rights reserved.
//

#import "loginViewController.h"
#import "AppDelegate.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

@interface loginViewController ()
{
    AppDelegate *appDelegate;
    IBOutlet UITextField *txtUsername;
    IBOutlet UITextField *txtPassword;
}

@end

@implementation loginViewController

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
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 0.75f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

#pragma mark -
#pragma mark WSIS Methods

- (IBAction)btnLoginClicked:(id)sender {
    if ([self validateUser:txtUsername.text password:txtPassword.text]) {
        
    }
}

-(BOOL)validateUser:(NSString*)username
           password:(NSString*)password
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
