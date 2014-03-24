//
//  UniversityViewController.m
//  LaureateTest
//
//  Created by Mario Zepeda on 3/12/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import "UniversityViewController.h"
#import "University.h"
#import "JSONParserUniversity.h"

@interface UniversityViewController ()

@end

@implementation UniversityViewController

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
    NSLog(@"University view controller loaded");
    
    myUniversitiesArr = [[NSMutableArray alloc]init];
    
    JSONParserUniversity *parser = [[JSONParserUniversity alloc]init];
    
    //myUniversitiesArr =
    [parser loadJSONByURL:@"http://global.laureate.net/_vti_bin/wcfGetActions/Service.svc/GetUniversities?country=all"];
    
    [parser getRegions];
    
    
    //University *myCourse = [myCoursesArr objectAtIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
