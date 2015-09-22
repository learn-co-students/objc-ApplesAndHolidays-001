//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {

    NSArray *fruitsFiveApples = @[ @"apple" ,
                          @"peach" ,
                          @"apple" ];
    
    NSArray *appleResults = [self pickApplesFromFruits:fruitsFiveApples];
    NSLog(@"%@",appleResults);
    
    NSDictionary *suppliesBySeasonAndHoliday =
    @{ @"Winter" : [@{ @"Christmas Day"    : [@[ @"plastic tree"   ,
                                                 @"tinsel"         ,
                                                 @"lights"         ,
                                                 @"presents"       ,
                                                 @"wreath"         ,
                                                 @"mistletoe"      ,
                                                 @"Christmas music"
                                                 ] mutableCopy],
                       @"New Year's Day"   : [@[ @"party hats"     ,
                                                 @"kazoos"         ,
                                                 @"champagne"
                                                 ] mutableCopy]
                       } mutableCopy],
       @"Spring" : [@{ @"Memorial Day"     : [@[ @"American flag"  ,
                                                 @"memoirs"
                                                 ] mutableCopy]
                       } mutableCopy],
       @"Summer" : [@{ @"Independence Day" : [@[ @"fireworks"      ,
                                                 @"barbeque"       ,
                                                 @"picnic blanket" ,
                                                 @"sunscreen"
                                                 ] mutableCopy],
                       @"Labor Day"        : [@[ @"white jeans"    ,
                                                 @"shopping bag"
                                                 ] mutableCopy]
                       } mutableCopy],
       @"Fall"   : [@{ @"Veteran's Day"    : [@[ @"barbeque"       ,
                                                 @"American flag"
                                                 ] mutableCopy],
                       @"Thanksgiving Day" : [@[ @"turkey"         ,
                                                 @"gravy"          ,
                                                 @"mashed potatoes",
                                                 @"acorn squash"   ,
                                                 @"cranberry sauce",
                                                 @"napkins"
                                                 ] mutableCopy]
                       } mutableCopy]
       };
    
    NSArray *holidayResult = [self holidaysInSeason:@"Winter" inDatabase:suppliesBySeasonAndHoliday];
    NSLog(@"%@",holidayResult);
    
    NSArray *suppliesStuff = [self suppliesInHoliday:@"Thanksgiving Day" inSeason:@"Fall" inDatabase:suppliesBySeasonAndHoliday];
    NSLog(@"%@",suppliesStuff);
    
    bool yesOrNo = [self supply:@"napkins" isInHoliday:@"Thanksgiving Day" inSeason:@"Fall" inDatabase:suppliesBySeasonAndHoliday];
    NSLog(@"%u",yesOrNo);
    
    bool noOrYes = [self holiday:@"Christmas Day" isInSeason:@"Winter" inDatabase:suppliesBySeasonAndHoliday];
    NSLog(@"%u",noOrYes);
    
    NSDictionary *jkalsdf = [self addHoliday:@"jason" toSeason:@"Winter" inDatabase:suppliesBySeasonAndHoliday];
    
    NSDictionary *asdfjkl = [self addSupply:@"water" toHoliday:@"Christmas Day" inSeason:@"Winter" inDatabase:suppliesBySeasonAndHoliday];
    
    NSLog(@"%@",suppliesBySeasonAndHoliday);
    return YES;
}





- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    NSPredicate *findApples = [NSPredicate predicateWithFormat:@"self = 'apple'"];
    NSArray *appleArray = [fruits filteredArrayUsingPredicate:findApples];
    NSLog(@"%@",appleArray);
    return appleArray;
}


- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *temporaryArray = [database objectForKey:season];
    return temporaryArray;
}


- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSArray *holidaysBySeason = [self holidaysInSeason:season inDatabase:database];
    NSArray *theResults = [holidaysBySeason valueForKey:holiday];
    NSLog(@"%@",theResults);
    return theResults;
}


- (bool)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season
    inDatabase:(NSDictionary *)database {
    
    NSArray *aboveResults = [self suppliesInHoliday:holiday inSeason:season inDatabase:database];
    bool yesOrNo = [aboveResults containsObject:supply];
    NSLog(@"%@",aboveResults);
    
    
    return yesOrNo;
}


- (bool) holiday:(NSString *)holiday
      isInSeason:(NSString *)season
      inDatabase:(NSDictionary *)database {

    NSArray *aboveResults = [self holidaysInSeason:season inDatabase:database]; //WHY IS THIS MUTABLE DICTIONARY IN DEBUGGER
    NSLog(@"%@",aboveResults); //ABOVE RESULTS WON'T LET ME USE BOOL CONTAINS OBJECT
    bool doesItWork = NO;

    for (NSString *strings in aboveResults) {
        NSLog(@"%@",strings);
        if (strings == holiday) {
            doesItWork = YES;
        }
        
    }
    
    return doesItWork;//OrYes;
}


- (NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSMutableDictionary *otherDictionary = [database mutableCopy];
    NSMutableDictionary *innerDictionary = otherDictionary[season];
    [innerDictionary setObject:@"" forKey:holiday];
    [otherDictionary setObject:innerDictionary forKey:season];
    database = otherDictionary;
    
    return database;
}

- (NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableDictionary *otherDictionary = otherDictionary = [database mutableCopy];;
    NSMutableDictionary *innerDictionary = [[NSMutableDictionary alloc] init];
    
    if (![self holiday:holiday isInSeason:season inDatabase:database]) {
    
    innerDictionary = otherDictionary[season];
    [innerDictionary setObject:@"" forKey:holiday];
    [otherDictionary setObject:innerDictionary forKey:season];
    }

    [otherDictionary[season][holiday] addObject:supply];

    

    database = otherDictionary;
    return database;
}




@end