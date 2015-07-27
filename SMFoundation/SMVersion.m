//
//  SMVersion.m
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/7/27.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "SMVersion.h"


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
