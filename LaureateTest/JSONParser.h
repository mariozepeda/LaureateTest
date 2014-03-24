//
//  JSONParser.h
//  LaureateTest
//
//  Created by Mario Zepeda on 3/7/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"

@interface JSONParser : NSObject {
    NSMutableArray *coursesArr;
    Course *currentCourse;
}

@property(readonly, retain)NSMutableArray *coursesArr;
@property(nonatomic, strong)Course *currentCourse;

-(NSMutableArray *)loadJSONByURL:(NSString *)urlString;

@end
