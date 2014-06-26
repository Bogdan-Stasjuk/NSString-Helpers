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

- (CGSize)sizeWithFont:(UIFont *)font inScopeOfSize:(CGSize)constrainedSize
{
    CGSize size = CGSizeZero;
    UIFont *measuringFont = [UIFont fontWithName:font.fontName size:font.pointSize + 1.f];
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7.0" options:NSNumericSearch] == NSOrderedAscending) {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        size = [self sizeWithFont:measuringFont
                constrainedToSize:constrainedSize
                    lineBreakMode:NSLineBreakByWordWrapping];
#pragma GCC diagnostic pop
    } else {
        size = [self boundingRectWithSize:constrainedSize
                                  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                               attributes:@{NSFontAttributeName: measuringFont}
                                  context:nil].size;
    }
    
    if (size.height < 150.f) {
        size.height += 20;
    }
    
    return size;
}

@end