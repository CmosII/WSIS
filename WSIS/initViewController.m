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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLangClicked:(id)sender {
    UIButton *btn = sender;
    btn.hidden = YES;
    self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"About WSIS U.A.E"];
}

@end
