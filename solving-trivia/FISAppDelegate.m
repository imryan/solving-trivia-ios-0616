//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self solveTrivia];
    return YES;
}

#pragma mark - Little Helpers

- (NSString *)cleanString:(NSString *)string {
    string = [string lowercaseString];
    
    for (NSUInteger i = 0; i < [string length]; i++) {
        NSString *character = [NSString stringWithFormat:@"%c", [string characterAtIndex:i]];
        
        if ([character isEqualToString:@"."] || [character isEqualToString:@" "]) {
            string = [string stringByReplacingOccurrencesOfString:character withString:@""];
        }
    }
    
    return string;
}

- (BOOL)state:(NSString *)state containsLetterFromCapital:(NSString *)capital {
    BOOL containsLetter = NO;
    
    for (NSUInteger i = 0; i < [capital length]; i++) {
        NSString *letter = [NSString stringWithFormat:@"%c", [capital characterAtIndex:i]];
        
        if ([state containsString:letter]) {
            containsLetter = YES;
        }
    }
    
    return containsLetter;
}

- (NSString *)solveTrivia {
    // You like that nil value, Joe?
    NSString *stateAnswer = nil;
    NSDictionary *statesAndCapitals = @{ @"Alabama"     : @"Montgomery",
                                         @"Montana"     : @"Helena",
                                         @"Alaska"      : @"Juneau",
                                         @"Nebraska"    : @"Lincoln",
                                         @"Arizona"     : @"Phoenix",
                                         @"Nevada"      : @"Carson City",
                                         @"Arkansas"    : @"Little Rock",
                                         @"New Hampshire" : @"Concord",
                                         @"California"  : @"Sacramento",
                                         @"New Jersey"  : @"Trenton",
                                         @"Colorado"    : @"Denver",
                                         @"New Mexico"  : @"Santa Fe",
                                         @"Connecticut" : @"Hartford",
                                         @"New York"    : @"Albany",
                                         @"Delaware"    : @"Dover",
                                         @"North Carolina" : @"Raleigh",
                                         @"Florida"     : @"Tallahassee",
                                         @"North Dakota": @"Bismarck",
                                         @"Georgia"     : @"Atlanta",
                                         @"Ohio"        : @"Columbus",
                                         @"Hawaii"      : @"Honolulu",
                                         @"Oklahoma"    : @"Oklahoma City",
                                         @"Idaho"       : @"Boise",
                                         @"Oregon"      : @"Salem",
                                         @"Illinois"    : @"Springfield",
                                         @"Pennsylvania": @"Harrisburg",
                                         @"Indiana"     : @"Indianapolis",
                                         @"Rhode Island": @"Providence",
                                         @"Iowa"        : @"Des Moines",
                                         @"South Carolina" : @"Columbia",
                                         @"Kansas"      : @"Topeka",
                                         @"South Dakota": @"Pierre",
                                         @"Kentucky"    : @"Frankfort",
                                         @"Tennessee"   : @"Nashville",
                                         @"Louisiana"    : @"Baton Rouge",
                                         @"Texas"       : @"Austin",
                                         @"Maine"       : @"Augusta",
                                         @"Utah"        : @"Salt Lake City",
                                         @"Maryland"    : @"Annapolis",
                                         @"Vermont"     : @"Montpelier",
                                         @"Massachusetts" : @"Boston",
                                         @"Virginia"    : @"Richmond",
                                         @"Michigan"    : @"Lansing",
                                         @"Washington"  : @"Olympia",
                                         @"Minnesota"   : @"St.Paul",
                                         @"West Virginia" : @"Charleston",
                                         @"Mississippi" : @"Jackson",
                                         @"Wisconsin"   : @"Madison",
                                         @"Missouri"    : @"Jefferson City",
                                         @"Wyoming"     : @"Cheyenne"
                                        };
    
    for (NSUInteger i = 0; i < [statesAndCapitals count]; i++) {
        NSString *state = [statesAndCapitals.allKeys objectAtIndex:i];
        NSString *capital = [statesAndCapitals objectForKey:state];
        
        if (![self state:[self cleanString:state] containsLetterFromCapital:[self cleanString:capital]]) {
            stateAnswer = state;
        }
    }
    
    return stateAnswer;
}

@end
