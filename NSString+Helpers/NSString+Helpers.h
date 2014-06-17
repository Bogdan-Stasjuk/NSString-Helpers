//
//  NSString+Helpers.h
//
//  Created by Bogdan Stasjuk on 4/16/14.
//
//

@interface NSString (Helpers)

+ (NSString *)trim:(NSString *)string;

+ (BOOL)isEmpty:(NSString *)string;
+ (BOOL)isUInteger:(NSString *)string;

- (BOOL)isMatchesRegExp:(NSString *)regExp;
- (CGFloat)heightWithFont:(UIFont *)font andWidth:(CGFloat)width;

@end