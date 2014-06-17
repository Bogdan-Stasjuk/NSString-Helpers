NSString-Helpers
================

A category on NSString for validation and manipulation.

##Validation methods

```objc
+ (BOOL)isEmpty:(NSString *)string;
+ (BOOL)isUInteger:(NSString *)string;

- (BOOL)isMatchesRegExp:(NSString *)regExp;
```

##Manipulation methods

```objc
+ (NSString *)trim:(NSString *)string;
```

##Helper methods

```objc
- (CGFloat)heightWithFont:(UIFont *)font andWidth:(CGFloat)width;
```


Demo
====

Clone project and run it. You can find examples of usage at NSSHTestViewController.m.

Compatibility
=============

This class has been tested back to iOS 6.0.

Installation
============

__Cocoapods__: `pod 'NSString+Helpers'`<br />
__Manual__: Copy the __NSString+Helpers__ folder in your project<br />

Import header in your project. .pch is a good place ;)

    #import "NSString+Helpers.h"

License
=======

This code is released under the MIT License. See the LICENSE file for
details.
