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
    return nil;
}

- (BOOL)suppliesInHoliday:(NSString *)holiday
                 inSeason:(NSString *)season
               inDatabase:(NSDictionary *)database {
    return NO;
}


- (BOOL)holiday:(NSString *)holiday
     isInSeason:(NSString *)season
     inDatabase:(NSDictionary *)database {
    return NO;
}


- (BOOL)supply:(NSString *)supply
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    return NO;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    return NO;
}

- (NSDictionary *)addHoliday:(NSString *)holiday
                    toSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    return nil;
}

- (NSDictionary *)addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    return nil;
}



@end
/*
NSPredicate *elderPredicate = [NSPredicate predicateWithFormat:@"age > 155"];
NSArray *elders = [middleEarthers filteredArrayUsingPredicate:elderPredicate];

for (NSDictionary *character in elders) {
    NSLog(@"%@ is %@ years old.", character[@"name"], character[@"age"]);
}

*/