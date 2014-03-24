//
//  CountriesViewController.h
//  LaureateTest
//
//  Created by Mario Zepeda on 3/13/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import "ViewController.h"

@interface CountriesViewController : ViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *countriesTableView;

@property (strong, nonatomic)NSMutableArray *countriesArr;


@property (strong, nonatomic)NSMutableArray *universitiesArr;


@property (strong, nonatomic)NSMutableArray *allCountriesArr;
@property (strong, nonatomic)NSMutableArray *allUniversitiesArr;

@property (strong, nonatomic)NSMutableArray *universityCountryArr; //To send to UniversitiesViewController


@end
