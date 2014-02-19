//
//  initViewController.m
//  WSIS
//
//  Created by iOS on 2/9/14.
//  Copyright (c) 2014 htss. All rights reserved.
//

#import "initViewController.h"
#import "AppDelegate.h"

@interface initViewController ()
{
    AppDelegate *appDelegate;
    IBOutlet UIButton *btnEN;
    IBOutlet UIButton *btnAR;
}

@end
@implementation initViewController
@synthesize SegueID;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLangClicked:(id)sender {
   
}

-(IBAction)btnARClicked:(id)sender {
   appDelegate.language = @"AR";
    btnAR.hidden = YES;
    btnEN.hidden = YES;
    self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"About WSIS U.A.E"];
}

-(IBAction)btnENClicked:(id)sender {
    appDelegate.language = @"EN";
    btnAR.hidden = YES;
    btnEN.hidden = YES;
    self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"About WSIS U.A.E"];
}

@end
