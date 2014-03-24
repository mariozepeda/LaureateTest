//
//  RegionsViewController.m
//  LaureateTest
//
//  Created by Mario Zepeda on 3/13/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import "RegionsViewController.h"
#import "JSONParserUniversity.h"
#import "CountriesViewController.h"

@interface RegionsViewController ()

@end

@implementation RegionsViewController

@synthesize regionsTableView;
@synthesize universityParser;
@synthesize countriesArr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    //self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //UIColor * color = [UIColor colorWithRed:255/255.0f green:124/255.0f blue:0/255.0f alpha:1.0f];
    //[self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : color}];
    //self.navigationController.navigationBar.translucent = NO;
    
    NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [UIColor whiteColor],UITextAttributeTextColor,
                                               [UIColor blackColor], UITextAttributeTextShadowColor,
                                               [NSValue valueWithUIOffset:UIOffsetMake(-1, 0)], UITextAttributeTextShadowOffset, nil];
    
    [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    // Unselect the selected row if any
    NSIndexPath*    selection = [regionsTableView indexPathForSelectedRow];
    if (selection) {
        [regionsTableView deselectRowAtIndexPath:selection animated:YES];
    }
    //[regionsTableView deselectRowAtIndexPath:2 animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //NSLog(@"RegionsViewController loaded");
    
    regionsArr = [[NSMutableArray alloc]init];
    
    
    universityParser = [[JSONParserUniversity alloc]init];
    
    //myUniversitiesArr =
    [universityParser loadJSONByURL:@"http://global.laureate.net/_vti_bin/wcfGetActions/Service.svc/GetUniversities?country=all"];
    
    [universityParser getLocalUniversities];
    
    regionsArr = [universityParser getRegions];
    
    
    
    
    
    //[universityParser getCountriesFrom:@"Latin America"];
    
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource and Delegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Select your Region";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [regionsArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = [regionsArr objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //NSLog([regionsArr objectAtIndex:indexPath.row]);
    
    countriesArr = [[NSMutableArray alloc]init];
    countriesArr = [universityParser getCountriesFrom:[regionsArr objectAtIndex:indexPath.row]];
    
    [self performSegueWithIdentifier:@"regionCountrySegue" sender:self];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"regionCountrySegue"])
    {
        // Get reference to the destination view controller
        CountriesViewController *vc = [segue destinationViewController];
        
        
        [vc.countriesArr removeAllObjects];
        vc.countriesArr = [[NSMutableArray alloc]init];
        
        
        [vc.allCountriesArr removeAllObjects];
        vc.allCountriesArr = [[NSMutableArray alloc]init];
        vc.allCountriesArr = [universityParser getAllCountries];
        
        [vc.allUniversitiesArr removeAllObjects];
        vc.allUniversitiesArr = [[NSMutableArray alloc]init];
        vc.allUniversitiesArr = [universityParser getAllUniversities];
        
        
        //vc.universityCountryDictionary = [[NSMutableDictionary alloc]init];
        
        //vc.universityCountryDictionary =
        [universityParser createUniversityCountryDictionary];
        
      
        //NSLog([NSString stringWithFormat:@"How many countries%d",[countriesArr count]]);
        vc.countriesArr = countriesArr;
        //[vc setMyObjectHere:object];
    }
}




@end
