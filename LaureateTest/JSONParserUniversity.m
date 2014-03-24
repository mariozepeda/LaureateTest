//
//  JSONParserUniversity.m
//  LaureateTest
//
//  Created by Mario Zepeda on 3/12/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import "JSONParserUniversity.h"

@implementation JSONParserUniversity
@synthesize universitiesArr;
@synthesize countriesArr;
@synthesize regionsArr;
@synthesize currentUniversity;

@synthesize allCountriesArr = _allCountriesArr;
@synthesize allUniversitiesArr = _allUniversitiesArr;

-(void)loadJSONByURL:(NSString *)urlString{
    universitiesArr = [[NSMutableArray alloc]init];
    _allCountriesArr = [[NSMutableArray alloc]init];
    regionsArr = [[NSMutableArray alloc]init];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    [self fetchUniversities:data];
    
    //return [self fetchUniversities:data];
    
}

-(void)fetchUniversities:(NSData *)responseData{
    //parse out the json data
    NSError* error;
    NSDictionary* universitiesJSON = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          
                          options:kNilOptions
                          error:&error];
    
    self.universitiesArr = (NSMutableArray *)universitiesJSON;
    
    

    //return self.universitiesArr;

}


-(NSMutableArray *)getAllCountries{
    for (NSDictionary *university in self.universitiesArr) {
        
        //NSString *universityName = [university objectForKey:@"Name"];
        
        NSDictionary *countryNode = [university objectForKey:@"country"];
        NSString *countryName = [countryNode objectForKey:@"country"];
        
        [_allCountriesArr addObject:countryName];
        
        //[universityCountryDictionary setObject:universityName forKey:countryName];
        
        //NSLog(universityName);
    }
    
    return _allCountriesArr;
}

-(NSMutableArray *)getAllUniversities{
    
    _allUniversitiesArr = [[NSMutableArray alloc]init];
    
    for (NSDictionary *university in self.universitiesArr) {
        
        NSDictionary *univeristyName = [university objectForKey:@"Name"];
        
        [_allUniversitiesArr addObject:univeristyName];
    }
    
    return _allUniversitiesArr;
}


-(void)createUniversityCountryDictionary{
    
    NSMutableDictionary *universityCountryDictionary = [[NSMutableDictionary alloc]initWithCapacity:[self.universitiesArr count]];
    
    
    
    
    
    
    //return universityCountryDictionary;
}

-(NSMutableArray *)getRegions{
    
    
    for (NSDictionary *universitiesDictionary  in self.universitiesArr) {
        
        NSString *name = [universitiesDictionary objectForKey:@"Region"];
        
        [regionsArr addObject:name];
    }
    
    //Create an Array of Unique Regions
    NSMutableArray *uniqueRegionsArray = [NSMutableArray array];
    [uniqueRegionsArray addObjectsFromArray:[[NSSet setWithArray:regionsArr] allObjects]];
    
    //Order Array ASC
    [uniqueRegionsArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    /*
    for (NSString *name in uniqueRegionsArray) {
        NSLog([NSString stringWithFormat:@"From regions %@",name]);
    }*/
    //NSLog([NSString stringWithFormat:@"Hey %d",[uniqueRegionsArray count]]);
    
    
    return uniqueRegionsArray;
}

-(void)getCountries{
    for (NSDictionary *universitiesDictionary  in self.universitiesArr) {
        
        NSDictionary *countryDictionary = [universitiesDictionary objectForKey:@"country"];
        
        NSString *countryName = [countryDictionary objectForKey:@"country"];
        //NSLog([NSString stringWithFormat:@"Dic %@",countryName]);
        
        [countriesArr addObject:countryName];
    }
    
    //Create an Array of Unique Countries
    NSMutableArray *uniqueCountriesArray = [NSMutableArray array];
    [uniqueCountriesArray addObjectsFromArray:[[NSSet setWithArray:countriesArr] allObjects]];
    
    //Order unique countries Array ASC
    [uniqueCountriesArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    for (NSString *string in uniqueCountriesArray) {
        NSLog(string);
    }
    
    //NSLog([NSString stringWithFormat:@"Country %@",[countriesArr objectAtIndex:1]]);

    
    
}

-(NSMutableArray *)getCountriesFrom:(NSString *)region{
    
    
    countriesArr = [[NSMutableArray alloc]init];
    
    
    for (NSDictionary *universitiesDictionary  in self.universitiesArr) {
        
        NSString *regionName = [universitiesDictionary objectForKey:@"Region"];
        
        if ([regionName isEqualToString:region]) {
            
            NSDictionary *countryDictionary = [universitiesDictionary objectForKey:@"country"];
            NSString *countryName = [countryDictionary objectForKey:@"country"];
            //NSLog([NSString stringWithFormat:@"Dic %@",countryName]);
            [countriesArr addObject:countryName];   
        }
        
        
    }
    
    //Create an Array of Unique Countries
    NSMutableArray *uniqueCountriesArray = [NSMutableArray array];
    [uniqueCountriesArray addObjectsFromArray:[[NSSet setWithArray:countriesArr] allObjects]];
    
    //Order unique countries Array ASC
    [uniqueCountriesArray sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    /*
    for (NSString *string in uniqueCountriesArray) {
        NSLog(string);
    }*/
    
    return uniqueCountriesArray;

}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          
                          options:kNilOptions
                          error:&error];
    
    
    
    NSArray *universities = (NSArray *)json; //2
    
    //NSLog([NSString stringWithFormat:@"%@",[universities objectAtIndex:0]])  ;
    
    /*
    for (NSDictionary *myDictionary  in courses) {
        currentCourse = [University alloc];
        NSNumber *CourseID = [myDictionary objectForKey:@"CourseID"];
        NSString *name = [myDictionary objectForKey:@"Name"];
        NSString *about = [myDictionary objectForKey:@"About"];
        //currentCourse.CourseID = CourseID;
        //NSLog([CourseID stringValue]);
        currentUniversity.CourseID = [CourseID stringValue];
        currentCourse.name = name;
        currentCourse.about = about;
        
        [coursesArr addObject:currentCourse];
    }
    
    //NSDictionary* course = [courses objectAtIndex:0];
    //NSString* fundedAmount = [course objectForKey:@"name"];
    //NSLog([courses objectAtIndex:0]);
    
    
    //NSLog(@"Courses: %@", courses); //3
     */
}

-(NSMutableArray *)getLocalUniversities{
    NSURL *detectIPURL = [NSURL URLWithString:@"http://global.laureate.net/_vti_bin/wcfGetActions/Service.svc/IPDetect2"];
    NSData *detectIPData = [NSData dataWithContentsOfURL:detectIPURL];
    
    //parse out the json data
    NSError* detectIPError;
    NSDictionary* detectIPJSON = [NSJSONSerialization
                                      JSONObjectWithData:detectIPData //1
                                      options:kNilOptions
                                      error:&detectIPError];
    
     NSString *country = [detectIPJSON objectForKey:@"country"];
    
    //Manual Test
    country = @"brazil";
    
    
    [self getAllUniversities];
    [self getAllCountries];
    
    
    
    NSMutableArray *localUniversitiesArr = [[NSMutableArray alloc]init];
    
    
    int i = 0;
    for (NSString *university in _allCountriesArr) {
        if( [university caseInsensitiveCompare:country] == NSOrderedSame ){
            [localUniversitiesArr addObject:[_allUniversitiesArr objectAtIndex:i]];
            
        }
        i++;
    }
    
    //NSLog([NSString stringWithFormat:@"%d",[localUniversitiesArr count]]);
    
    
    //NSLog([NSString stringWithFormat:@"%@",countryNode]);
    
    return localUniversitiesArr;
    
    
}




@end
