//
//  NSString+Helpers.m
//
//  Created by Bogdan Stasjuk on 4/16/14.
//
//

#import "NSString+Helpers.h"


#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)


@implementation NSString (Helpers)

#pragma mark - Public methods

#pragma mark -Static

+ (BOOL)isEmpty:(NSString *)string
{
    return (!string || ![self trim:string].length);
}

+ (NSString *)trim:(NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (BOOL)isUInteger:(NSString *)string
{
    if ([self isEmpty:string])
        return NO;
    string = [self trim:string];
    return [string isMatchesRegExp:@"^\\d+$"];
}

#pragma mark -Nonstatic

- (BOOL)isMatchesRegExp:(NSString *)regExp
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regExp
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    if (error) {
        ALog("Error: %@", error);
        return NO;
    }
    
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:self
                                                        options:0
                                                          range:NSMakeRange(0, self.length)];
    return numberOfMatches;
}

@end