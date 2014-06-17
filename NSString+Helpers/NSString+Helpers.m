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

- (CGFloat)heightWithFont:(UIFont *)font andWidth:(CGFloat)width
{
    CGFloat height = 0.f;
    UIFont *measuringFont = [UIFont fontWithName:font.fontName size:font.pointSize + 1.f];
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] == NSOrderedAscending) {
        
        height = [self sizeWithFont:measuringFont
                  constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
                      lineBreakMode:NSLineBreakByWordWrapping].height;
    } else {
        height = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                    options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                 attributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                             measuringFont,
                                             NSFontAttributeName,
                                             nil]
                                    context:nil].size.height;
    }
    
    if (height < 150.f) {
        height += 20;
    }
    
    return height;
}

@end