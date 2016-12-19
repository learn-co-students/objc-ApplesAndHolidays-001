//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}
/*
 
 METHOD 1

 */

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSPredicate *containsApple = [NSPredicate predicateWithFormat:@"SELF CONTAINS 'apple'"];
    NSArray *appleOccurrences = [fruits filteredArrayUsingPredicate:containsApple];
    
    return appleOccurrences;
}
/*
 
 METHOD 2
 
 */
-(NSArray *)holidaysInSeason:(NSString *)season
                  inDatabase:(NSDictionary *)database {
    
    NSMutableArray *collectHolidays = [[NSMutableArray alloc] init];
    
    for (id key in database) {
        
        if (key == season) {
            
            
            NSArray *holidays = [database objectForKeyedSubscript:key];
            
            for (id key in holidays) {
                NSString *holidayName = key;
                [collectHolidays addObject:holidayName];
            }
            
        }
        
        
    }
    
    NSArray *holidays = [collectHolidays copy];
    
    
    return holidays;
}
/*
 
 METHOD 3
 
 */
-(NSArray *)suppliesInHoliday:(NSString *)holiday
                     inSeason:(NSString *)season
                   inDatabase:(NSDictionary *)database {
    
    NSMutableArray *collectSupplies = [[NSMutableArray alloc] init];
    
    for (id key in database) {
        
        if (key == season) {
            
            NSDictionary *filteredHolidays = [database objectForKeyedSubscript:key];
        
            
            for (id key in filteredHolidays) {
                
                if (key == holiday) {
                    
                    collectSupplies = [filteredHolidays objectForKeyedSubscript:key];
                    
                }
                
            }
            
            
        }
    }
    
    NSArray *suppliesForHoliday = [collectSupplies copy];
    
 
    return suppliesForHoliday;
}
/*
 
 METHOD 4
 
 */
-(BOOL)holiday:(NSString *)holiday
    isInSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
 
    BOOL inSeasonOrNot = NO;
    
    for (id key in database) {
        
        if (key == season) {
            
            NSDictionary *filteredSeasons = [database objectForKeyedSubscript:key];
            
            for (id key in filteredSeasons) {
                
                if (key == holiday) {
                    
                    inSeasonOrNot = YES;
                }
                    
            }
        }
        
    }
    
    
    return inSeasonOrNot;
}
/*
 
 METHOD 5
 
 */
-(BOOL)supply:(NSString *)supply
  isInHoliday:(NSString *)holiday
     inSeason:(NSString *)season
   inDatabase:(NSDictionary *)database {
 
    
    BOOL supplyMatch = NO;
    
    for (id key in database) {
        
        if (key == season) {
            
            NSDictionary *filteredSeasons = [database objectForKeyedSubscript:key];
            
            for (id key in filteredSeasons) {
                
                if (key == holiday) {
                    
                    NSDictionary *filteredHolidays = [filteredSeasons objectForKeyedSubscript:key];
                    
                    for (id key in filteredHolidays) {
                        
                        if (key == supply) {
                            
                            supplyMatch = YES;
                        }
                    }
                }
            }
        }
    }
    
    
    
    return supplyMatch;
}
/*
 
 METHOD 6
 
 */
-(NSDictionary *)addHoliday:(NSString *)holiday
                   toSeason:(NSString *)season
                 inDatabase:(NSDictionary *)database {
    
    NSMutableDictionary *oneSeason = [[NSMutableDictionary alloc] init];
    oneSeason = [database objectForKey:season];
    
    NSMutableArray *holidaySupplies = [[NSMutableArray alloc] init];
    [oneSeason setObject:holidaySupplies forKey:holiday];
    
    NSMutableDictionary *editDatabase = [[NSMutableDictionary alloc] init];
    editDatabase = [database mutableCopy];
    
    [editDatabase removeObjectForKey:season];
    [editDatabase setObject:oneSeason forKey:season];
    
    NSDictionary *revisedDatabase = [editDatabase copy];
    
    return revisedDatabase;
}
/*
 
 METHOD 7
 
 */
-(NSDictionary *)addSupply:(NSString *)supply
                 toHoliday:(NSString *)holiday
                  inSeason:(NSString *)season
                inDatabase:(NSDictionary *)database {
    
    NSMutableDictionary *editDatabase = [[NSMutableDictionary alloc] init];
    editDatabase = [database mutableCopy];
    
    NSMutableArray *addSupply = [[NSMutableArray alloc] init];
    addSupply = [[database objectForKey:season] objectForKey:holiday];
    [addSupply addObject:supply];
    
    [[editDatabase objectForKey:season] setObject:addSupply forKey:holiday];
    
    NSDictionary *revisedDatabase = [editDatabase copy];
    
    return revisedDatabase;
}

@end