//
//  adminSearchViewController.m
//  WSIS
//
//  Created by Codi Admin on 2/16/14.
//  Copyright (c) 2014 htss. All rights reserved.
//

#import "adminSearchViewController.h"
#import "AppDelegate.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

@interface adminSearchViewController ()
{
    AppDelegate *appDelegate;
    IBOutlet UILabel *lblGov;
    IBOutlet UIView *vieSelGovernment;
    IBOutlet UIPickerView *selGov;
    
    NSArray *govList;
}

@end

@implementation adminSearchViewController

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
    
    self.navigationItem.hidesBackButton = YES;
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 0.75f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    govList = [NSArray arrayWithObjects:@"UAE Federal",@"Abu Dhabi",@"Dubai",@"Sharjah",@"Ajman",@"Umm Al Quwain",@"Ras Al Khaimah",@"Fujairah", nil];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark WSIS Methods

-(IBAction)btnGovClicked:(id)sender{
    vieSelGovernment.hidden = NO;
}

- (IBAction)btnGovSelectedClicked:(id)sender {
    vieSelGovernment.hidden = YES;
    lblGov.text = [govList objectAtIndex:[selGov selectedRowInComponent:0]];
}

-(IBAction)btnSectorClicked:(id)sender{
    
}

-(IBAction)btnYearClicked:(id)sender{
    
}

#pragma mark - Picker View Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    int r = 0;
    if (pickerView == selGov) {
        r = govList.count;
    }
    return r;
}

#pragma mark - Picker View Delegate Methods

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    if (pickerView == selGov) {
        return [govList objectAtIndex:row];
    }
    return @"";
}

@end
