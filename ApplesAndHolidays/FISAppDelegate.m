//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

/**
 
 * Implement your methods here.
 
 */

- (NSArray *)pickApplesFromFruits: (NSArray *) fruits {
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self LIKE 'apple'"];
    NSArray *appleCount = [fruits filteredArrayUsingPredicate:applePredicate];
    NSLog(@"%@",appleCount);
    return appleCount;
}
- (NSArray *)holidaysInSeason: (NSString *)season inDatabase: (NSDictionary *)database {
    NSArray *allHolidayInSeason = [database[season] allKeys];
    return allHolidayInSeason;
}
- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableArray *allSupplies = database[season][holiday];
    return allSupplies;
}
- (BOOL)holiday: (NSString *)holiday isInSeason: (NSString *)season inDatabase:(NSDictionary *)database {
    for (NSString *holidayName in database[season]) {
        if([holiday isEqualToString:holidayName]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    for (NSString *supplyName in database[season][holiday]) {
        if([supplyName isEqualToString:supply]) {
            return YES;
        }
    }
    return NO;
}
- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    NSMutableArray *emptyArray = [[NSMutableArray alloc]init];
    database[season][holiday]=emptyArray;
    return database;
}

-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    database[season][holiday] = supply;
    return database;
}

@end