//
//  NSSHTestViewController.m
//  NSStringHelpers
//
//  Created by Bogdan Stasjuk on 4/29/14.
//  Copyright (c) 2014 Bogdan Stasjuk. All rights reserved.
//

#import "NSSHTestViewController.h"

#import "NSString+Helpers.h"


@interface NSSHTestViewController ()

@end


@implementation NSSHTestViewController

#pragma mark - Private methods

#pragma mark -UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *string = @" some text   ";
    NSLog(@"string: %@", string);
    
    string = [NSString trim:string];
    NSLog(@"trimmed string: %@", string);
    
    NSLog(@"string is empty = %@", [NSString isEmpty:string] ? @"YES" : @"NO");
    
    NSLog(@"string is unsigned integer = %@\n\n", [NSString isUInteger:string] ? @"YES" : @"NO");
    
    string = @"43893";
    NSLog(@"new string: %@", string);
    
    NSLog(@"string is empty = %@", [NSString isEmpty:string] ? @"YES" : @"NO");
    
    NSLog(@"string is unsigned integer = %@", [NSString isUInteger:string] ? @"YES" : @"NO");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end