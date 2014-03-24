//
//  CoursesViewController.m
//  LaureateTest
//
//  Created by Mario Zepeda on 3/7/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import "CoursesViewController.h"
#import "Course.h"
#import "JSONParser.h"
#import "DejalActivityView.h"

@interface CoursesViewController ()

@end

@implementation CoursesViewController

@synthesize searchBar;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self hideSearchBar];
    
    NSString *urlString = @"http://global.laureate.net/_vti_bin/wcfGetActions/Service.svc/IPDetect2";
    
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    
    
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSLog([NSString stringWithFormat:@"%@",json]);
    
    // Create your image
    UIImage *image = [UIImage imageNamed: @"laureateLogo"];
    UIImageView *imageview = [[UIImageView alloc] initWithImage: image];
    [imageview setFrame:CGRectMake(0, 0, 80, 35)];
    //self.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];
    //self.searchBar.tintColor = [UIColor lightGrayColor];
    //imageview.frame.size = CGRectMake(0, 0, 100, 50);
    [imageview setContentMode:UIViewContentModeScaleAspectFit];
    self.navigationItem.titleView = imageview;
    
    self.title = @"Courses";
    
    myCoursesArr = [[NSMutableArray alloc]init];
    mySearchCoursesArr = [[NSMutableArray alloc]init];
    
    JSONParser *parser = [[JSONParser alloc]init];
    
    myCoursesArr = [parser loadJSONByURL:@"http://190.4.22.235/Laureate/api/Courses/GetCourses"];
    
    
    Course *myCourse = [myCoursesArr objectAtIndex:0];
    
    NSLog(@"ViewDidLoad");
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"%d",[myCoursesArr count]);
    return [myCoursesArr count];
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"testTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    

    // Configure the cell...
    Course *myCourse = [myCoursesArr objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.font = [UIFont fontWithName:@"Verdana" size:15];
    cell.textLabel.text = myCourse.name;
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    //UIImage *bigImage = [UIImage imageNamed:@"courseIcon.png"];
    
    
    CGSize size = {30,30};
    cell.imageView.image = [self imageWithImage:[UIImage imageNamed:@"courseIcon.png"] scaledToSize:size];

    
    //cell.imageView.frame = CGRectMake(0,0,10,10);
    //cell.imageView.image = [UIImage imageNamed:@"courseIcon.png"];
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [searchBar resignFirstResponder];
    
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    //cell.backgroundColor = [UIColor greenColor];

}

                            //Given a UIImage and a CGSize, this method will return a resized UIImage.
- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
    {
        UIGraphicsBeginImageContext( newSize );
        [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImage;
    }

- (IBAction)searchIconButtonClicked:(id)sender {
    if (self.searchDisplayController.isActive || (self.tableView.contentOffset.y < 44)) {
        if (self.searchDisplayController.isActive) {
            self.searchDisplayController.searchBar.text = nil;
            [self.searchDisplayController setActive:NO animated:YES];
            [self.tableView reloadData];
        }
        [searchBar resignFirstResponder];
        [self hideSearchBar];
    } else {
        [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    }
}




- (void)hideSearchBar {
    //NSLog(@"Hiding SearchBar");
    [self.tableView setContentOffset:CGPointMake(0,44) animated:YES];
    //[self.tableView setContentOffset:CGPointMake(0,44)];
}



- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    /*
    NSString *string = @"hello";
    if ([string rangeOfString:@"bla"].location == NSNotFound) {
        NSLog(@"string does not contain bla");
    } else {
        NSLog(@"string contains bla!");
    }*/
    
    
    for (Course *loopCourse in myCoursesArr) {
        NSString *courseName = loopCourse.name;
        if ([courseName rangeOfString:searchBar.text].location == NSNotFound) {
            
        }else{
            NSLog(@"si");
            [mySearchCoursesArr addObject:loopCourse];
        }
    }
    
    [myCoursesArr removeAllObjects];
    NSLog(@"%d",[mySearchCoursesArr count]);
    
    myCoursesArr = mySearchCoursesArr;
    
    [self.tableView reloadData];
    
    //Course *myCourse = [[Course alloc]init];
    
    //myCourse = [myCoursesArr objectAtIndex:5];
    //NSLog(myCourse.name);
    
    
    
    //[DejalBezelActivityView activityViewForView:self.tableView withLabel:@"Cargando Cursos" width:200];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    // You can write search code Here
}

@end
