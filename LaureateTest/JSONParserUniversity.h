//
//  JSONParserUniversity.h
//  LaureateTest
//
//  Created by Mario Zepeda on 3/12/14.
//  Copyright (c) 2014 Laureate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "University.h"


@interface JSONParserUniversity : NSObject {
    NSMutableArray *universitiesArr; //of Universities
    NSMutableArray *regionsArr;
    NSMutableArray *countriesArr;
    University *currentUniversity;
}

@property(nonatomic, retain)NSMutableArray *universitiesArr; //of Universities
@property(nonatomic, retain)NSMutableArray *regionsArr;
@property(nonatomic, retain)NSMutableArray *countriesArr;
@property(nonatomic, retain)NSMutableArray *allCountriesArr;
@property(nonatomic, retain)NSMutableArray *allUniversitiesArr;
@property(nonatomic, strong)University *currentUniversity;
//@property(nonatomic, strong)NSMutableDictionary *universityCountryDictionary;

-(void)loadJSONByURL:(NSString *)urlString;
-(void)fetchUniversities:(NSData *)responseData;
-(NSMutableArray *)getRegions;
-(void)getCountries;
-(NSMutableArray *)getCountriesFrom:(NSString *)region;
-(void)createUniversityCountryDictionary;

-(NSMutableArray *)getAllCountries;
-(NSMutableArray *)getAllUniversities;


//Get Local universities for LocalUniversitiesViewController
-(NSMutableArray *)getLocalUniversities;

@end
