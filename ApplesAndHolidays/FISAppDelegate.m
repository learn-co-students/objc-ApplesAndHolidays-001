//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSArray *)pickApplesFromFruits: (NSArray *)fruits {
    
    NSPredicate *appleOccurences = [NSPredicate predicateWithFormat:@"SELF LIKE'*apple*'"];
    NSArray *aNames = [fruits filteredArrayUsingPredicate:appleOccurences];
    return aNames;
    
}

- (NSArray *)holidaysInSeason: (NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *holidays = [database valueForKey:season];
    return holidays;
    
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *holidays = [database valueForKey:season];
    NSArray *supplies = [holidays valueForKey:holiday];
    return supplies;
}

- (BOOL *) holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *holidays = [database valueForKey:season];
    BOOL isCorrect = NO;
    for (NSString *any in holidays) {
        if ([holiday isEqualToString:any]) {
            isCorrect = YES;
        }
    }
    return isCorrect;
}

- (BOOL *) supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSArray *holidays = [database valueForKey:season];
    NSArray *supplies = [holidays valueForKey:holiday];
    BOOL isCorrect = NO;
    for (NSString *any in supplies) {
        if ([supply isEqualToString:any]) {
            isCorrect = YES;
        }
    }
    return isCorrect;
}



- (NSDictionary *) addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableArray *mEmpty = [[NSMutableArray alloc] init];
    database[season][holiday] = mEmpty;
    return database;

}

- (NSDictionary *) addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *holidays = [database valueForKey:season];
    NSMutableArray *supplies = [holidays valueForKey:holiday];
    [supplies addObject:supply];
    return database;
}


@end