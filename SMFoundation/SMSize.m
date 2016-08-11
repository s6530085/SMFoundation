//
//  SMSize.m
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/7/27.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "SMSize.h"
#import "UIScreen+SMFoundation.h"

CGFloat kStatusBarMaxY()
{
    return CGRectGetMaxY([[UIApplication sharedApplication] statusBarFrame]);
}

CGFloat kStandardTableViewCellHeight()
{
    if (![[UIScreen mainScreen] sm_reaches4Point7Inch]) {
        return 44.0f;
    }
    else if ([[UIScreen mainScreen] sm_is4Point7Inch]) {
        return 47.0f;
    }
    else {
        return 50.0f;
    }
}


CGFloat kStandardButtonHeight()
{
    return kStandardTableViewCellHeight();
}


const CGFloat kStandardButtonLeftMargin = 14.0f;
const CGFloat kStandardLabelHeight = 20.0f;
const CGFloat kStandardNavigationHeight = 44.0f;
const CGFloat kStandardTabBarHeight = 49.0f;
