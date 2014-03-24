//
//  CoursesParserDelegate.h
//  LaureateTest
//
//  Created by Mario Zepeda on 3/7/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CoursesParserDelegate <NSObject>

-(void)receivedJSON:(NSData *)objectNotation;

@end
