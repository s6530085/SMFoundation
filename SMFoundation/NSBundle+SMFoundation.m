//
//  NSBundle+SMFoundation.m
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 16/7/11.
//  Copyright © 2016年 study_sun. All rights reserved.
//

#import "NSBundle+SMFoundation.h"

@implementation NSBundle (SMFoundation)

+ (nonnull NSString *)sm_mainBundleVersion;
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}


+ (nonnull NSString *)sm_mainBundleBuild;
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey];
}


+ (nonnull NSString *)sm_mainBundleID
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleIdentifierKey];
}

@end
