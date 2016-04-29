//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    NSArray *apples = [fruits filteredArrayUsingPredicate:applePredicate];
    return apples;
}


- (NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database {
    NSArray*holidays=[database[season] allKeys];
    return holidays;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                 inSeason:(NSString *)season
               inDatabase:(NSDictionary *)database {
    NSArray *supplies = database[season][holiday];
    return supplies;
}


- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database {

    BOOL inSeason = NO;
    if ([[database[season] allKeys] containsObject:holiday]) {
        inSeason = YES;
    }
    return inSeason;
}


- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    BOOL inSupply = NO;
    if([database[season][holiday] containsObject:supply]) {
        inSupply = YES;
    }
    return inSupply;
}

- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    NSMutableArray *supplies = [[NSMutableArray alloc] init];
//    NSDictionary *newHoliday = @{holiday : supplies};
    database[season][holiday] = supplies;
    return database;
}

- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    [database[season][holiday] addObject:supply];
    return database;
}



@end
