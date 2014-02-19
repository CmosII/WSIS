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
    IBOutlet UILabel *lblUser;
    IBOutlet UILabel *lblPass;
    IBOutlet UIButton *btnForgotPass;
    IBOutlet UIButton *btnCreateAcc;
    IBOutlet UILabel *lblOr;
    IBOutlet UILabel *lblBr;
    IBOutlet UIButton *btnLogin;
    
    int x1,x2,x3,x4,x5,y1,y2,y3;
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
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) {
        //iPad
        if ([appDelegate.language isEqualToString:@"AR"]) {
            [self arrangePadAr];
        }else{
            [self arrangePadEn];
        }
    }else{
        //iPhone
        if([UIScreen mainScreen].bounds.size.height == 568.0) {
            //iPhone 5
            
        }else{
            //iPhone 4
            
        }
    }
    if ([appDelegate.language isEqualToString:@"AR"]) {
        [self setAr];
    }else{
        [self setEn];
    }
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark View Creation

-(void)arrangePadEn {
    x1 = 300;
    x2 = 406;
    y1 = 232;
    y2 = 276;
    y3 = 466;
    [self addUserLabelX:x1 Y:y1 Width:90 Height:21];
    [self addPassLabelX:x1 Y:y2 Width:90 Height:21];
    [self addForgotBtnX:x2 Y:y3 Width:213 Height:30];
    
    int center = 485;
    [self addCreateBtnX:center-41 Y:504 Width:150 Height:30];
    [self addOrLabelX:center-68 Y:508 Width:30 Height:21];
    [self addBrLabelX:center+114 Y:508 Width:30 Height:21];
    
}

-(void)arrangePadAr {
    x1 = 630;
    x2 = 406;
    y1 = 232;
    y2 = 276;
    y3 = 466;
    [self addUserLabelX:x1 Y:y1 Width:90 Height:21];
    [self addPassLabelX:x1 Y:y2 Width:90 Height:21];
    [self addForgotBtnX:x2 Y:y3 Width:213 Height:30];
    
    int center = 485;
    [self addCreateBtnX:center-41 Y:504 Width:124 Height:30];
    [self addOrLabelX:center+68 Y:508 Width:30 Height:21];
    [self addBrLabelX:center-30 Y:508 Width:30 Height:21];
}

-(void)addUserLabelX:(int)x
                   Y:(int)y
               Width:(int)width
              Height:(int)height
{
    lblUser = [[UILabel alloc] initWithFrame: CGRectMake(x, y, width, height)];
    [self.view addSubview: lblUser];
}

-(void)addPassLabelX:(int)x
                   Y:(int)y
               Width:(int)width
              Height:(int)height
{
    lblPass = [[UILabel alloc] initWithFrame: CGRectMake(x, y, width, height)];
    [self.view addSubview: lblPass];
}

-(void)addForgotBtnX:(int)x
                   Y:(int)y
               Width:(int)width
              Height:(int)height
{
    btnForgotPass = [UIButton buttonWithType:UIButtonTypeCustom];
    btnForgotPass.frame = CGRectMake(x,y,width,height);
    [btnForgotPass setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnForgotPass addTarget:self action:@selector(btnForgotClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnForgotPass];
}

-(void)addOrLabelX:(int)x
                 Y:(int)y
             Width:(int)width
            Height:(int)height
{
    lblOr = [[UILabel alloc] initWithFrame: CGRectMake(x, y, width, height)];
    [self.view addSubview: lblOr];
}

-(void)addCreateBtnX:(int)x
                   Y:(int)y
               Width:(int)width
              Height:(int)height
{
    btnCreateAcc = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCreateAcc.frame = CGRectMake(x,y,width,height);
    [btnCreateAcc setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnCreateAcc addTarget:self action:@selector(btnCreateClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnCreateAcc];
}

-(void)addBrLabelX:(int)x
                 Y:(int)y
             Width:(int)width
            Height:(int)height
{
    lblBr = [[UILabel alloc] initWithFrame: CGRectMake(x, y, width, height)];
    [self.view addSubview: lblBr];
}

-(void)setAr {
    lblUser.text = @"اسم المستخدم";
    lblPass.text = @"الرمز المروري";
    [btnForgotPass setTitle:@"هل نسيت كلمة المرور؟" forState:UIControlStateNormal];
    [btnCreateAcc setTitle:@"إنشاء حساب" forState:UIControlStateNormal];
    lblOr.text = @"( أو";
    lblBr.text = @"(";
    [btnLogin setTitle:@"تسجيل الدخول" forState:UIControlStateNormal];
}

-(void)setEn {
    lblUser.text = @"Username";
    lblPass.text = @"Password";
    [btnForgotPass setTitle:@"forgot your password?" forState:UIControlStateNormal];
    [btnCreateAcc setTitle:@"create an account" forState:UIControlStateNormal];
    lblOr.text = @"( or";
    lblBr.text = @")";
    [btnLogin setTitle:@"Login" forState:UIControlStateNormal];
}

#pragma mark -
#pragma mark WSIS Methods

- (IBAction)btnLoginClicked:(id)sender {
    if ([self validateUser:txtUsername.text password:txtPassword.text]) {
        [self performSegueWithIdentifier:@"inSucessful" sender:self];
    }
}

-(IBAction)btnForgotClicked:(id)sender {
    NSLog(@"Button Forgot Clicked");
}

-(IBAction)btnCreateClicked:(id)sender {
    NSLog(@"Button Create Clicked");
}

-(BOOL)validateUser:(NSString*)username
           password:(NSString*)password
{
    /*
     * Test login function
     */
    return YES;
}

@end
