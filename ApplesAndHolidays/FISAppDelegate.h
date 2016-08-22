//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//pickApplesFromFruits: which takes one NSArray argument fruits and returns an NSArray.

-(NSArray *)pickApplesFromFruits:(NSArray *)fruits;

//holidaysInSeason:inDatabase: which takes two arguments, an NSString called season and an NSDictionary called database, and returns an NSArray.
-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database;


//suppliesInHoliday:inSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSArray.
-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database;


//holiday:isInSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns a BOOL.
-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database;

//supply:isInHoliday:inSeason:inDatabase: which takes four arguments: an NSString called supply, an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns a BOOL.
-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database;
//
//addHoliday:toSeason:inDatabase: which takes three arguments: an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSDictionary.
-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database;
//
//addSupply:toHoliday:inSeason:inDatabase: which takes four arguments: an NSString called supply, an NSString called holiday, an NSString called season, and an NSDictionary called database; and returns an NSDictionary.
-(NSDictionary *)addSupply:(NSString * )supply toHoliday:(NSString * )holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database;

@end
