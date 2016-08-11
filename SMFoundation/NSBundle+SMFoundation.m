//
//  NSBundle+SMFoundation.m
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 16/7/11.
//  Copyright © 2016年 study_sun. All rights reserved.
//

#import "NSBundle+SMFoundation.h"

@implementation NSBundle (SMFoundation)

+ (nullable NSString *)sm_mainBundleVersion;
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}


+ (nullable NSString *)sm_mainBundleBuild;
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey];
}

@end
