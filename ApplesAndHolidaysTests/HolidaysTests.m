#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "FISAppDelegate.h"


SpecBegin(HolidaysTests)

describe(@"HolidaysSpec", ^{
    
    __block FISAppDelegate *appDelegate;
    __block NSDictionary *suppliesBySeasonAndHoliday;
    
    beforeEach(^{
        appDelegate = [[FISAppDelegate alloc] init];
        
        suppliesBySeasonAndHoliday =
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
        
        
    });
    
    describe(@"1 holidaysInSeason:inDatabase:", ^{
        it(@"returns an array with the correct holidays in the winter season", ^{
            expect([appDelegate holidaysInSeason:@"Winter"
                                      inDatabase:suppliesBySeasonAndHoliday]).to.haveCountOf(2);
            expect([appDelegate holidaysInSeason:@"Winter"
                                      inDatabase:suppliesBySeasonAndHoliday]).to.contain(@"Christmas Day");
            expect([appDelegate holidaysInSeason:@"Winter"
                                      inDatabase:suppliesBySeasonAndHoliday]).to.contain(@"New Year's Day");
        });
        
        it(@"returns an array with the correct holidays in the summer season", ^{
            expect([appDelegate holidaysInSeason:@"Summer"
                                      inDatabase:suppliesBySeasonAndHoliday]).to.haveCountOf(2);
            expect([appDelegate holidaysInSeason:@"Summer"
                                      inDatabase:suppliesBySeasonAndHoliday]).to.contain(@"Independence Day");
            expect([appDelegate holidaysInSeason:@"Summer"
                                      inDatabase:suppliesBySeasonAndHoliday]).to.contain(@"Labor Day");
        });
    });
    
    describe(@"2 suppliesInHoliday:inSeason:inDatabase:", ^{
        it(@"returns an array of the correct supplies for New Year's Day in Winter ", ^{
            NSMutableArray *newYearsSupplies = [@[ @"party hats",
                                                   @"kazoos"    ,
                                                   @"champagne"
                                                   ] mutableCopy];
            
            expect([appDelegate suppliesInHoliday:@"New Year's Day"
                                         inSeason:@"Winter"
                                       inDatabase:suppliesBySeasonAndHoliday]).to.equal(newYearsSupplies);
        });
        
        it(@"returns an array of the correct supplies for Independence Day in Summer ", ^{
            NSMutableArray *independenceDaySupplies = [@[ @"fireworks"      ,
                                                          @"barbeque"       ,
                                                          @"picnic blanket" ,
                                                          @"sunscreen"
                                                          ] mutableCopy];
            
            expect([appDelegate suppliesInHoliday:@"Independence Day"
                                         inSeason:@"Summer"
                                       inDatabase:suppliesBySeasonAndHoliday]).to.equal(independenceDaySupplies);
        });
    });

    describe(@"3 holiday:isInSeason:inDatabase:", ^{
        it(@"returns YES that Christmas Day is in Winter", ^{
            expect([appDelegate holiday:@"Christmas Day"
                             isInSeason:@"Winter"
                             inDatabase:suppliesBySeasonAndHoliday]).to.beTruthy();
        });
        
        it(@"returns YES that Labor Day is in Summer", ^{
            expect([appDelegate holiday:@"Labor Day"
                             isInSeason:@"Summer"
                             inDatabase:suppliesBySeasonAndHoliday]).to.beTruthy();
        });
        
        it(@"returns NO that Christmas Day is in Summer", ^{
            expect([appDelegate holiday:@"Christmas Day"
                             isInSeason:@"Summer"
                             inDatabase:suppliesBySeasonAndHoliday]).to.beFalsy();
        });
    });
    
    describe(@"4 supply:isInHoliday:inSeason:inDatabase:", ^{
        it(@"returns YES that barbeque is in Veteran's Day in Fall", ^{
            expect([appDelegate supply:@"barbeque"
                           isInHoliday:@"Veteran's Day"
                              inSeason:@"Fall"
                            inDatabase:suppliesBySeasonAndHoliday]).to.beTruthy();
        });
        
        it(@"returns YES that sunscreen is in Independence Day in Summer", ^{
            expect([appDelegate supply:@"sunscreen"
                           isInHoliday:@"Independence Day"
                              inSeason:@"Summer"
                            inDatabase:suppliesBySeasonAndHoliday]).to.beTruthy();
        });
        
        it(@"returns NO that sunscreen is not in New Year's Day in Winter", ^{
            expect([appDelegate supply:@"sunscreen"
                           isInHoliday:@"New Year's Day"
                              inSeason:@"Winter"
                            inDatabase:suppliesBySeasonAndHoliday]).to.beFalsy();
        });

    });

    
    describe(@"5 addHoliday:toSeason:inDatabase:", ^{
        it (@"returns the database with President's Day added as a key to Winter", ^{
            NSString *presidentsDay = @"President's Day";
            NSString *winter = @"Winter";
            NSDictionary *modifiedDatabase = [appDelegate addHoliday:presidentsDay
                                                            toSeason:winter
                                                          inDatabase:suppliesBySeasonAndHoliday];
            
            expect([modifiedDatabase[winter] allKeys]).to.contain(presidentsDay);
        });
        
        it (@"returns the database with President's Day added as a key to Winter that points to the value of an empty NSMutableArray", ^{
            NSString *presidentsDay = @"President's Day";
            NSString *winter = @"Winter";
            NSDictionary *modifiedDatabase = [appDelegate addHoliday:presidentsDay
                                                            toSeason:winter
                                                          inDatabase:suppliesBySeasonAndHoliday];
            
            expect(modifiedDatabase[winter][presidentsDay]).to.haveCountOf(0);
        });
        
        it (@"returns the database with President's Day not added as a key to another season", ^{
            NSString *presidentsDay = @"President's Day";
            NSString *winter = @"Winter";
            NSDictionary *modifiedDatabase = [appDelegate addHoliday:presidentsDay
                                                            toSeason:winter
                                                          inDatabase:suppliesBySeasonAndHoliday];
            
            expect([modifiedDatabase[@"Spring"] allKeys]).toNot.contain(presidentsDay);
        });

    });
    
    describe(@"6 addSupply:toHoliday:inSeason:inDatabase:", ^{
        it (@"returns the database with sunscreen added to Veteran's Day in Fall", ^{
            NSString *sunscreen = @"sunscreen";
            NSString *veteransDay = @"Veteran's Day";
            NSString *fall = @"Fall";
            NSDictionary *modifiedDatabase = [appDelegate addSupply:sunscreen
                                                          toHoliday:veteransDay
                                                           inSeason:fall
                                                         inDatabase:suppliesBySeasonAndHoliday];
            
            expect(modifiedDatabase[fall][veteransDay]).to.contain(sunscreen);
        });
        
        it (@"returns the database with sunscreen not added to another holiday", ^{
            NSString *sunscreen = @"sunscreen";
            NSString *veteransDay = @"Veteran's Day";
            NSString *fall = @"Fall";
            NSDictionary *modifiedDatabase = [appDelegate addSupply:sunscreen
                                                          toHoliday:veteransDay
                                                           inSeason:fall
                                                         inDatabase:suppliesBySeasonAndHoliday];
            
            expect(modifiedDatabase[fall][@"Thanksgiving Day"]).toNot.contain(sunscreen);
        });

    });
    
});


SpecEnd

