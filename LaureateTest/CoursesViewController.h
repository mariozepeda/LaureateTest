//
//  CoursesViewController.h
//  LaureateTest
//
//  Created by Mario Zepeda on 3/7/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoursesViewController : UITableViewController<UISearchBarDelegate>{
    NSMutableArray *myCoursesArr;
    NSMutableArray *mySearchCoursesArr;
}

//Outlets
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
- (IBAction)searchIconButtonClicked:(id)sender;

@end
