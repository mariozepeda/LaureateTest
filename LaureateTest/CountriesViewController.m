//
//  CountriesViewController.m
//  LaureateTest
//
//  Created by Mario Zepeda on 3/13/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import "CountriesViewController.h"
#import "UniversitiesViewController.h"

@interface CountriesViewController ()

@end

@implementation CountriesViewController

@synthesize countriesTableView;

@synthesize countriesArr;

@synthesize allCountriesArr;
@synthesize allUniversitiesArr;

@synthesize universityCountryArr; //To send to UniversitiesViewController

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
    // NSLog(@"Countries View Controller loaded");
    
    [universityCountryArr removeAllObjects];
    universityCountryArr = [[NSMutableArray alloc] init];
    
    
    //countriesArr = [[NSMutableArray alloc]init];
    //NSLog([NSString stringWithFormat:@"Count %d",[countriesArr count]]);
    int i = 0;
    for (NSString *string in allCountriesArr) {
        //NSLog([NSString stringWithFormat:@"%@ es de %@",[allUniversitiesArr objectAtIndex:i],[allCountriesArr objectAtIndex:i]]);
        i++;
    }
    
    
   
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    // Unselect the selected row if any
    NSIndexPath*    selection = [countriesTableView indexPathForSelectedRow];
    if (selection) {
        [countriesTableView deselectRowAtIndexPath:selection animated:YES];
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
    return @"Select your Country";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [countriesArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = [countriesArr objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    int i = 0;
    
    universityCountryArr = [[NSMutableArray alloc] init];

    for (NSString *universityName in allUniversitiesArr) {
        
        if ([[allCountriesArr objectAtIndex:i] isEqualToString:[countriesArr objectAtIndex:indexPath.row]]) {
            //NSLog(universityName);
            [universityCountryArr addObject:universityName];
        }
        
        i++;
    }
    
    
    [self performSegueWithIdentifier:@"countryUniversitySegue" sender:self];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"countryUniversitySegue"])
    {
        // Get reference to the destination view controller
        UniversitiesViewController *vc = [segue destinationViewController];
        
        
        [vc.universitiesArr removeAllObjects];
         vc.universitiesArr = [[NSMutableArray alloc]init];
        
        
        vc.universitiesArr = universityCountryArr;
    }
}



@end
