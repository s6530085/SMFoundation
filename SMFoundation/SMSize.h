//
//  SMSize.h
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/7/27.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

BOOL kUserInterfaceIdiomIsPhone();
BOOL kUserInterfaceIdiomIsPad();
BOOL kScreenIs4InchRetina();
BOOL kScreenLargerThen3Point5InchRetina();

CGRect kScreenBounds();
CGRect kApplicationFrame();

CGFloat kScreenScale();
NSInteger kIntegerScreenScale();

CGFloat kScreenWidth();
CGFloat kScreenHeight();

CGFloat kStatusBarMaxY();


UIKIT_EXTERN const CGFloat kStandardTableViewCellHeight;
UIKIT_EXTERN const CGFloat kStandardButtonHeight;
UIKIT_EXTERN const CGFloat kStandardButtonLeftMargin;
UIKIT_EXTERN const CGFloat kStandardLabelHeight;
UIKIT_EXTERN const CGFloat kStandardNavigationHeight;
UIKIT_EXTERN const CGFloat kStandardTabBarHeight;