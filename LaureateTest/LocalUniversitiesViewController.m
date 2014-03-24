//
//  LocalUniversitiesViewController.m
//  LaureateTest
//
//  Created by Mario Zepeda on 3/17/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import "LocalUniversitiesViewController.h"
#import "SearchUniversityViewController.h"

@interface LocalUniversitiesViewController ()

@end

@implementation LocalUniversitiesViewController

@synthesize universitiesArr;
@synthesize universityParser;

@synthesize universitiesViewController;

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
    
    universitiesArr = [[NSMutableArray alloc]init];
    
    
    universityParser = [[JSONParserUniversity alloc]init];
    
    //myUniversitiesArr =
    [universityParser loadJSONByURL:@"http://global.laureate.net/_vti_bin/wcfGetActions/Service.svc/GetUniversities?country=all"];
    
    //[universityParser getLocalUniversities];
    
    universitiesArr = [universityParser getLocalUniversities];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    // Unselect the selected row if any
    NSIndexPath*    selection = [universitiesViewController indexPathForSelectedRow];
    if (selection) {
        [universitiesViewController deselectRowAtIndexPath:selection animated:YES];
    }
    //[regionsTableView deselectRowAtIndexPath:2 animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource and Delegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Universities near you";
            break;
        case 1:
            return @"My university is not listed above";
            break;
        default:
            return @"nil";
            break;
    }
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return [universitiesArr count];
            break;
        case 1:
            return 1;
            break;
        default:
            return 0;
            break;
    }
    
}


-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 70;
    }else{
        return 40;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [universitiesArr objectAtIndex:indexPath.row];
        cell.textLabel.numberOfLines = 2;
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;        
        return cell;
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = @"Manual Search";
        
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{   
    
    if (indexPath.section > 0) {
        [self performSegueWithIdentifier:@"LocalToManualSegue" sender:self];
    }else{
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"LocalToSearchSegue"])
    {
        // Get reference to the destination view controller
        SearchUniversityViewController *vc = [segue destinationViewController];
        
        
        [vc.universitiesArr removeAllObjects];
        vc.universitiesArr = [[NSMutableArray alloc]init];
        
        
        vc.universitiesArr = [universityParser allUniversitiesArr];
        //Order unique countries Array ASC
        [vc.universitiesArr sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    }
}


@end
