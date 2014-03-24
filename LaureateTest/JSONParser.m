//
//  JSONParser.m
//  LaureateTest
//
//  Created by Mario Zepeda on 3/7/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import "JSONParser.h"

@implementation JSONParser
@synthesize coursesArr;
@synthesize currentCourse;

-(NSMutableArray *)loadJSONByURL:(NSString *)urlString{
    coursesArr = [[NSMutableArray alloc]init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    [self fetchedData:data];
    
    
    return coursesArr;
    
}


- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray *courses = [json objectForKey:@"data"]; //2
    
    
    for (NSDictionary *myDictionary  in courses) {
        currentCourse = [Course alloc];
        NSNumber *CourseID = [myDictionary objectForKey:@"CourseID"];
        NSString *name = [myDictionary objectForKey:@"Name"];
        NSString *about = [myDictionary objectForKey:@"About"];
        //currentCourse.CourseID = CourseID;
        //NSLog([CourseID stringValue]);
        currentCourse.CourseID = [CourseID stringValue];
        currentCourse.name = name;
        currentCourse.about = about;
        
        [coursesArr addObject:currentCourse];
    }
    
    //NSDictionary* course = [courses objectAtIndex:0];
    //NSString* fundedAmount = [course objectForKey:@"name"];
    //NSLog([courses objectAtIndex:0]);
    
    
    //NSLog(@"Courses: %@", courses); //3
}

@end
