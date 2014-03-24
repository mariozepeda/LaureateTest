//
//  LocalUniversitiesViewController.h
//  LaureateTest
//
//  Created by Mario Zepeda on 3/17/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import "ViewController.h"
#import "JSONParserUniversity.h"

@interface LocalUniversitiesViewController : ViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *universitiesArr;
@property (strong, nonatomic) JSONParserUniversity *universityParser;
@property (weak, nonatomic) IBOutlet UITableView *universitiesViewController;

@end
