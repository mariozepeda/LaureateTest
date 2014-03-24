//
//  SearchUniversityViewController.h
//  LaureateTest
//
//  Created by Mario Zepeda on 3/19/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchUniversityViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UITableView *universitiesTableView;
@property (strong, nonatomic)NSMutableArray *universitiesArr;
@property (strong, nonatomic)NSArray *filteredUniversitiesArr;

//- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope;

@end
