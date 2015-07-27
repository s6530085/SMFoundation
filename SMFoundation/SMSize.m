//
//  SMSize.m
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/7/27.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "SMSize.h"

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

const CGFloat kStandardTableViewCellHeight = 44.0f;
const CGFloat kStandardButtonHeight = 44.0f;
const CGFloat kStandardButtonLeftMargin = 14.0f;
const CGFloat kStandardLabelHeight = 20.0f;
const CGFloat kStandardNavigationHeight = 44.0f;
const CGFloat kStandardTabBarHeight = 49.0f;
