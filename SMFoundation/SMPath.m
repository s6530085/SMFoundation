//
//  SMPath.m
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/7/27.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "SMPath.h"


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
