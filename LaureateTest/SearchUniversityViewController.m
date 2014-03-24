//
//  SearchUniversityViewController.m
//  LaureateTest
//
//  Created by Mario Zepeda on 3/19/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import "SearchUniversityViewController.h"

@interface SearchUniversityViewController ()

@end

@implementation SearchUniversityViewController

@synthesize universitiesTableView;
@synthesize universitiesArr;
@synthesize filteredUniversitiesArr;


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    //[self.searchDisplayController.searchBar becomeFirstResponder];
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource and Delegate

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 70;
    }else{
        return 40;
    }
    
}

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Select your University";
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [filteredUniversitiesArr count];
    }else{
        return [universitiesArr count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    
    cell.textLabel.numberOfLines = 2;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        
        cell.textLabel.text = [filteredUniversitiesArr objectAtIndex:indexPath.row];
    } else {
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = [universitiesArr objectAtIndex:indexPath.row];
    }  
    
    return cell;
}


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
     filteredUniversitiesArr = [universitiesArr filteredArrayUsingPredicate:resultPredicate];
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{

    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;
    
}



@end
