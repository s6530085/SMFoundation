//
//  SMCommon.m
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/7/23.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "SMCommon.h"

CGRect kScreenBounds()
{
    return [[UIScreen mainScreen] bounds];
}

CGRect kApplicationFrame()
{
    return [[UIScreen mainScreen] applicationFrame];
}


CGFloat kScreenScale()
{
    return  ([UIScreen instancesRespondToSelector:@selector(scale)]?[[UIScreen mainScreen] scale]:(1.0f));
}


NSInteger kIntegerScreenScale()
{
    CGFloat f =  kScreenScale();
    return (NSInteger)f;
}


CGFloat kScreenWidth()
{
    return ([[UIScreen mainScreen] applicationFrame].size.width);
}


CGFloat kScreenHeight()
{
    return ([[UIScreen mainScreen] applicationFrame].size.height);
}


CGFloat kStatusBarMaxY()
{
    return CGRectGetMaxY([[UIApplication sharedApplication] statusBarFrame]);
}

BOOL kUserInterfaceIdiomIsPhone()
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}


BOOL kUserInterfaceIdiomIsPad()
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

BOOL kScreenIs4InchRetina()
{
    return (([UIScreen mainScreen].scale == 2.0f) && ([UIScreen mainScreen].bounds.size.height == 568.0f));
}


BOOL kScreenLargerThen3Point5InchRetina()
{
    return (([UIScreen mainScreen].scale >= 2.0f) && ([UIScreen mainScreen].bounds.size.height > 480.0f));
}

NSString *kPathTemp()
{
    return NSTemporaryDirectory();
}


NSString *kPathDocument()
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}


NSString *kPathLibraryCache()
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}


NSString *kSystemVersion()
{
    return [[UIDevice currentDevice] systemVersion];
}


BOOL kSystemVersionPriorToIOS6()
{
    return ([kSystemVersion() compare:@"6.0" options:NSNumericSearch range:NSMakeRange(0, 3)] == NSOrderedAscending);
}

BOOL kSystemVersionPriorToIOS7()
{
    return ([kSystemVersion() compare:@"7.0" options:NSNumericSearch range:NSMakeRange(0, 3)] == NSOrderedAscending);
}


BOOL kSystemVersionReachesIOS7()
{
    return ([kSystemVersion() compare:@"7.0" options:NSNumericSearch range:NSMakeRange(0, 3)] != NSOrderedAscending);
}


BOOL kSystemVersionPriorToIOS8()
{
    return ([kSystemVersion() compare:@"8.0" options:NSNumericSearch range:NSMakeRange(0, 3)] == NSOrderedAscending);
}


BOOL kSystemVersionReachesIOS8()
{
    return ([kSystemVersion() compare:@"8.0" options:NSNumericSearch range:NSMakeRange(0, 3)] != NSOrderedAscending);
}


NSString *kApplicationBundleVersion()
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey];
}


NSString *kApplicationVersion()
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

