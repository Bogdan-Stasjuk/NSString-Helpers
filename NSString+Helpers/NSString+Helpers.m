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
    
    NSString *pattern = @"[^\\d]";
    NSError *error = nil;
    NSRegularExpression *regExp = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:&error];
    if (error)
    {
        ALog("%@", error);
    }
    
    string = [self trim:string];
    NSRange range = NSMakeRange(0, string.length);
    NSUInteger numberOfMatches = [regExp numberOfMatchesInString:string options:0 range:range];
    
    return !numberOfMatches;
}

@end