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

//pickApplesFromFruits: which takes one NSArray argument fruits and returns an NSArray.

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits{
    NSMutableArray *apples = [[NSMutableArray alloc] init];
    for (NSString *fruit in fruits){
        if ([fruit isEqualToString:@"apple"]){
            [apples addObject:fruit];
        }
    }
    NSArray *appleFruit = [apples copy];
    return appleFruit;
}

//holidaysInSeason:inDatabase: which takes two arguments, an NSString called season and an NSDictionary called database, and returns an NSArray.
-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSMutableArray *holidays = [[NSMutableArray alloc] init];
    for (NSString *key in database){
        if ([key isEqualToString:season]){
        NSArray *holidaysInSeason = [database[key] allKeys];
        holidays = [holidaysInSeason mutableCopy];
        }
    }
    NSArray *correctHolidays = [holidays copy];
    return correctHolidays;
}



//suppliesInHoliday:inSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSArray.
-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSMutableArray *suppliesInSeason = database[season][holiday];
    
    return suppliesInSeason;
}



//holiday:isInSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns a BOOL.
-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
//    holiday:isInSeason:inDatabase: to return whether or not the submitted "season" contains a key that matches the "holiday" argument.
    if ([database[season] objectForKey:holiday] != nil){
        return YES;
    }
    return NO;
    
}


//supply:isInHoliday:inSeason:inDatabase: which takes four arguments: an NSString called supply, an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns a BOOL.
-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    if ([database[season] objectForKey:holiday] != nil){
        if ([database[season][holiday] containsObject:supply]){
            return YES;
        }
    
    }
    
    return NO;
}

//
//addHoliday:toSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSDictionary.
-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    if ([database objectForKey:season] != nil){
        database[season][holiday] = [ @[] mutableCopy ];
    }
    
    return database;
}

//
//addSupply:toHoliday:inSeason:inDatabase: which takes four arguments: an NSString called supply, an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSDictionary.
-(NSDictionary *)addSupply:(NSString * )supply toHoliday:(NSString * )holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    if ([database objectForKey:season] != nil){
        if ([database[season] objectForKey:holiday] != nil){
            [database[season][holiday] addObject:supply];
        }
    }
    return database;
}


@end