//
//  UniversitiesViewController.h
//  LaureateTest
//
//  Created by Mario Zepeda on 3/14/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import "ViewController.h"

@interface UniversitiesViewController : ViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *universitiesTableView;


@property (strong, nonatomic)NSMutableArray *universitiesArr;

@end
