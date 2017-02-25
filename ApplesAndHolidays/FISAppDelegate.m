//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits{
    NSPredicate *applePicker = [NSPredicate predicateWithFormat:@"self CONTAINS 'apple'"];
    NSArray *arr = [fruits filteredArrayUsingPredicate:applePicker];
    return arr;
}

-(NSArray *)holidaysInSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database{
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    
    for (NSString *key in [database[season] allKeys]){
        [arr addObject:key];
    }
    return arr;
}

-(NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season
                    inDatabase:(NSDictionary *)database{
    NSMutableArray * arr = [[NSMutableArray alloc]init];
    for(NSString * key in database[season][holiday]){
        [arr addObject:key];
    }
    return arr;
}

-(BOOL)holiday:(NSString *)holiday
    isInSeason:(NSString *)season
    inDatabase:(NSDictionary *)database{
    
    for(NSString *key in [database[season] allKeys]){
        if ([key isEqualToString:holiday]){
            return YES;
        }
    }
    return NO;
}


-(BOOL)supply:(NSString *)supply
  isInHoliday:(NSString *)holiday
     inSeason:(NSString *)season
   inDatabase:(NSDictionary *)database{
    
    if([self holiday:holiday isInSeason:season inDatabase:database]){
        for(NSString * key in [self suppliesInHoliday:holiday inSeason:season inDatabase:database]){
            if([supply isEqualToString:key]){
            return YES;
            }
        }

    }
    return NO;
}

-(NSDictionary *)addHoliday:(NSString *)holiday
                   toSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database{
    NSMutableDictionary * dic = [database mutableCopy];
    
    if(![self holiday:holiday isInSeason:season inDatabase:database]){
        dic[season] = @{holiday:@""};
    }
    return dic;
}

-(NSDictionary *) addSupply:(NSString *)supply
                  toHoliday:(NSString *)holiday
                   inSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database{
    NSMutableDictionary * dic = [database mutableCopy];
    
    if(![self supply:supply isInHoliday:holiday inSeason:season inDatabase:database]){
        [dic[season][holiday] addObject:supply];
    }
    return dic;
}



@end