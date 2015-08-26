//
//  SMSize.h
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/7/27.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

UIKIT_EXTERN BOOL kUserInterfaceIdiomIsPhone();
UIKIT_EXTERN BOOL kUserInterfaceIdiomIsPad();
UIKIT_EXTERN BOOL kScreenIs4InchRetina();
UIKIT_EXTERN BOOL kScreenLargerThen3Point5InchRetina();

UIKIT_EXTERN CGRect kScreenBounds();
UIKIT_EXTERN CGRect kApplicationFrame();

UIKIT_EXTERN CGFloat kScreenScale();
UIKIT_EXTERN NSInteger kIntegerScreenScale();

UIKIT_EXTERN CGFloat kScreenWidth();
UIKIT_EXTERN CGFloat kScreenHeight();

UIKIT_EXTERN CGFloat kStatusBarMaxY();


UIKIT_EXTERN const CGFloat kStandardTableViewCellHeight;
UIKIT_EXTERN const CGFloat kStandardButtonHeight;
UIKIT_EXTERN const CGFloat kStandardButtonLeftMargin;
UIKIT_EXTERN const CGFloat kStandardLabelHeight;
UIKIT_EXTERN const CGFloat kStandardNavigationHeight;
UIKIT_EXTERN const CGFloat kStandardTabBarHeight;