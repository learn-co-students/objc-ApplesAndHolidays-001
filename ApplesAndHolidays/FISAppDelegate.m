//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSArray *)pickApplesFromFruits:(NSArray *) fruits{
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self LIKE 'apple'"];
    NSArray *appleOccurences = [fruits filteredArrayUsingPredicate:applePredicate];
    NSLog(@"%@", appleOccurences);
    return appleOccurences;
}

- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSArray *holidaysFiltered = [database[season] allKeys];
    return holidaysFiltered;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSArray *suppliesFiltered = database[season][holiday];
    return suppliesFiltered;
}

- (BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    if ([database[season] objectForKey:holiday]) {
        return YES;
    } else {
        return NO;
    }
    
}

- (BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    NSArray *currentSupplies = database[season][holiday];
    if ([currentSupplies containsObject:supply]) {
        return YES;
    } else {
        return NO;
    }
}

- (NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    database[season][holiday] = [@[] mutableCopy];
    return database;
}

- (NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    [database[season][holiday] addObject:supply];
    return database;
}
@end