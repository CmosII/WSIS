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
    NSArray *menu1,*menu2,*menu3,*menu4,*menu5,*menu6,*Section,*sectionNames;
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
    
    menu1 = [NSArray arrayWithObjects:@"About WSIS U.A.E", nil];
    menu2 = [NSArray arrayWithObjects:@"About UAE ICT",@"Indicators and Statistics", nil];
    menu3 = [NSArray arrayWithObjects:@"What is WSIS",@"Action Lines",@"Documents",@"Stocktaking",@"WSIS Project Prize 2013",@"WSIS Questionaire", nil];
    menu4 = [NSArray arrayWithObjects:@"About the Committee",@"UAE WSIS Committee",@"Meetings",@"Documents & Publications", nil];
    menu5 = [NSArray arrayWithObjects:@"Committee News", @"WSIS News", @"Image Gallery" ,nil];
    menu6 = [NSArray arrayWithObjects:@"Important Links", nil];
    
    sectionNames = [NSArray arrayWithObjects:@"UAE initiatives",@"UAE ICT Development",@"WSIS",@"National Committee",@"Media",@"Links", nil];
    Section = [NSArray arrayWithObjects:menu1,menu2,menu3,menu4,menu5,menu6, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    NSArray *thisArray = [Section objectAtIndex:indexPath.section];
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
