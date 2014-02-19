//
//  MenuViewController.m
//  WSIS
//
//  Created by iOS on 2/9/14.
//  Copyright (c) 2014 htss. All rights reserved.
//

#import "MenuViewController.h"
#import "ECSlidingViewController.h"
#import "UIImageView+AFNetworking.h"
#import "AppDelegate.h"

@interface MenuViewController ()
{
    AppDelegate *appDelegate;
    NSArray *menu1,*menu2,*menu3,*menu4,*menu5,*menu6,*menu7,*Section,*sectionNames;
    NSArray *sbmenu1,*sbmenu2,*sbmenu3,*sbmenu4,*sbmenu5,*sbmenu6,*sbmenu7;
    IBOutlet UILabel *lblBarTitle;
}
@end

@implementation MenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.slidingViewController setAnchorRightRevealAmount:250.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    
    self.view.frame = CGRectMake(0, 20, 320, 548);
    self.tableView.backgroundColor = [UIColor colorWithRed:(224/255.0) green:(225/255.0) blue:(226/255.0) alpha:1];
    //self.tableView.frame = CGRectMake(0, 20, 320, 548);
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    if ([appDelegate.language isEqualToString:@"AR"]) {
        menu1 = [NSArray arrayWithObjects:@"تسجيل الدخول", nil];
        menu2 = [NSArray arrayWithObjects:@"عن القمة في الإمارات", nil];
        menu3 = [NSArray arrayWithObjects:@"قطاع الاتصالات في الإمارات",@"مؤشرات و إحصائيات", nil];
        menu4 = [NSArray arrayWithObjects:@"القمة العالمية حول مجتمع المعلومات",@"خطوط العمل",@"الوثائق",@"تقييم للوضع",@"جائزة القمة 2013",@"استبيان", nil];
        menu5 = [NSArray arrayWithObjects:@"لجنة القمة",@"اللجنة الإماراتية للقمة",@"اجتماعات القمة",@"وثائق و اصدارات", nil];
        menu6 = [NSArray arrayWithObjects:@"أخبار اللجنة", @"أخبار القمة", @"معرض الصور" ,nil];
        menu7 = [NSArray arrayWithObjects:@"روابط تهمك", nil];
        
        sectionNames = [NSArray arrayWithObjects:@"المستخدم",@"مبادرات الإمارات",@"قطاع التصالات بالإمارات",@"القمة العالمية لمجتمع المعلومات",@"اللجنة الوطنية",@"الإعلام",@"الروابط", nil];
        
        lblBarTitle.text = @"القمة العالمية لمجتمع المعلومات";
    }else{
        menu1 = [NSArray arrayWithObjects:@"Login", nil];
        menu2 = [NSArray arrayWithObjects:@"About WSIS U.A.E", nil];
        menu3 = [NSArray arrayWithObjects:@"About UAE ICT",@"Indicators and Statistics", nil];
        menu4 = [NSArray arrayWithObjects:@"What is WSIS",@"Action Lines",@"Documents",@"Stocktaking",@"WSIS Project Prize 2013",@"WSIS Questionaire", nil];
        menu5 = [NSArray arrayWithObjects:@"About the Committee",@"UAE WSIS Committee",@"Meetings",@"Documents & Publications", nil];
        menu6 = [NSArray arrayWithObjects:@"Committee News", @"WSIS News", @"Image Gallery" ,nil];
        menu7 = [NSArray arrayWithObjects:@"Important Links", nil];
        
        sectionNames = [NSArray arrayWithObjects:@"User Dashboard",@"UAE initiatives",@"UAE ICT Development",@"WSIS",@"National Committee",@"Media",@"Links", nil];
        
        lblBarTitle.text = @"WSIS U.A.E.";
    }
    
    sbmenu1 = [NSArray arrayWithObjects:@"Login", nil];
    sbmenu2 = [NSArray arrayWithObjects:@"About WSIS U.A.E", nil];
    sbmenu3 = [NSArray arrayWithObjects:@"About UAE ICT",@"Indicators and Statistics", nil];
    sbmenu4 = [NSArray arrayWithObjects:@"What is WSIS",@"Action Lines",@"Documents",@"Stocktaking",@"WSIS Project Prize 2013",@"WSIS Questionaire", nil];
    sbmenu5 = [NSArray arrayWithObjects:@"About the Committee",@"UAE WSIS Committee",@"Meetings",@"Documents & Publications", nil];
    sbmenu6 = [NSArray arrayWithObjects:@"Committee News", @"WSIS News", @"Image Gallery" ,nil];
    sbmenu7 = [NSArray arrayWithObjects:@"Important Links", nil];
    
    Section = [NSArray arrayWithObjects:menu1,menu2,menu3,menu4,menu5,menu6,menu7, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WSIS Methods



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return Section.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //return [menu count];
    NSArray *thisArray = [Section objectAtIndex:section];
    return thisArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    float height = 28.0f;
    //    if (section == 0) {
    //        height = 20.5f + 44;
    //    }else{
    //        height = 28.0f;
    //    }
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSArray *thisArray = [Section objectAtIndex:indexPath.section];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[thisArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [sectionNames objectAtIndex:section];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor colorWithRed:(224/255.0) green:(225/255.0) blue:(226/255.0) alpha:1];
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView;
    headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 28.0f)];
    [headerView setBackgroundColor:[UIColor colorWithRed:(37/255.0) green:(82/255.0) blue:(146/255.0) alpha:1]];
    
    UILabel *lblText;
    lblText = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, tableView.bounds.size.width-2, 28)];
	lblText.numberOfLines = 2;
	[lblText setBackgroundColor:[UIColor clearColor]];
    lblText.textAlignment = NSTextAlignmentLeft;
	lblText.font = [UIFont systemFontOfSize:15];
	lblText.textColor = [UIColor whiteColor];
    lblText.text = [sectionNames objectAtIndex:section];
	[headerView addSubview:lblText];
    
    return headerView;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *thisArray;
    
    switch (indexPath.section) {
        case 0:
            thisArray = sbmenu1;
            break;
        case 1:
            thisArray = sbmenu2;
            break;
        case 2:
            thisArray = sbmenu3;
            break;
        case 3:
            thisArray = sbmenu4;
            break;
        case 4:
            thisArray = sbmenu5;
            break;
        case 5:
            thisArray = sbmenu6;
            break;
        case 6:
            thisArray = sbmenu7;
            break;
        default:
            break;
    }
    
    NSString *identifier = [NSString stringWithFormat:@"%@", [thisArray objectAtIndex:indexPath.row]];
    UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
    
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
}

@end
