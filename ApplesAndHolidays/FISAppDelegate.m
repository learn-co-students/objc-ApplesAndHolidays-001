//
//  FISAppDelegate.m
//  ApplesAndHolidays
//
//  Created by Al Tyus on 5/30/14.
//  Copyright (c) 2014 com.flatironschool. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

/**
 
 * Implement your methods here.
 
 */
- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    NSArray *apple = [fruits filteredArrayUsingPredicate:applePredicate];
    
    return apple;
};

- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database {
    // NSMutableArray *holidays = [[NSMutableArray alloc]init];
    NSArray *holidays = database[season];
    
    return holidays;
};

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database {
    NSArray *supplies = database[season][holiday];
    
    return supplies;
};

- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database {
    
    BOOL holidayInSeason = NO;
    
    if ([[database[season] allKeys] containsObject:holiday]){
        holidayInSeason = YES;
    };
    
    return holidayInSeason;
};

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    
    BOOL supplyInHolidayInSeason = NO;
    
    if ([database[season][holiday] containsObject:supply]){
        supplyInHolidayInSeason = YES;
    };
    
    return supplyInHolidayInSeason;
};

- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    //holiday will be auto be the new key in the dictionary
    database[season][holiday] = [@"" mutableCopy];
    
    return database;
    
};

- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    
    database[season][holiday] = supply;
    
    return database;
};

@end