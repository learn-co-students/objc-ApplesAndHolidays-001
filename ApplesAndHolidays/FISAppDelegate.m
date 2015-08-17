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

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits{
    NSMutableArray *filtered = [[NSMutableArray alloc]init];
    for (NSString *fruit in fruits) {
        if([fruit isEqualToString:@"apple"]){
            [filtered addObject:fruit];
            
        }}
        
        NSArray *filteredForApples = [filtered copy];
        return filteredForApples;};

-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSArray *holidayKeysArr = [NSArray arrayWithArray:[database[season] allKeys]];
    return holidayKeysArr;
};

-(NSMutableArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSMutableArray *supplies = [NSMutableArray arrayWithArray:database[season][holiday]];
   

    return supplies;};
-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    if([database[season] objectForKey:holiday] == nil){
        return NO;
    }else{return YES;}

};
-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    if ([database[season][holiday] containsObject:supply]) {
        return YES;
    }else{return NO;}

};
-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database{
   
    database[season][holiday] = [ @[] mutableCopy];
    return database;
};
-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    [database[season][holiday] addObject:supply];
    return database;
};

@end