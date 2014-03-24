//
//  RegionsViewController.h
//  LaureateTest
//
//  Created by Mario Zepeda on 3/13/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import "ViewController.h"
#import "JSONParserUniversity.h"

@interface RegionsViewController : ViewController <UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *regionsArr;
}

@property (weak, nonatomic) IBOutlet UITableView *regionsTableView;
@property (strong, nonatomic) NSMutableArray *countriesArr;
@property (strong, nonatomic) JSONParserUniversity *universityParser;


@end
