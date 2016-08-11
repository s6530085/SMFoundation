//
//  UIScreen+SMFoundation.h
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 16/8/3.
//  Copyright © 2016年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>

// 这里主要是一些屏幕尺寸的便捷方法
@interface UIScreen (SMFoundation)

- (NSInteger)sm_integerScale;
// 横屏和竖屏是不一样的哦
- (CGFloat)sm_width;
// 这个高是整个screen的高，所以有statusbar的高度
- (CGFloat)sm_height;

// 和版本比较一样，也是存在屏幕是否是某某尺寸的，或者屏幕大于某某尺寸的两种比较
- (BOOL)sm_is3Point5Inch;
- (BOOL)sm_reaches3Point5Inch;
- (BOOL)sm_is4Inch;
- (BOOL)sm_reaches4Inch;
- (BOOL)sm_is4Point7Inch;
- (BOOL)sm_reaches4Point7Inch;
- (BOOL)sm_is5Point5Inch;
- (BOOL)sm_reaches5Point5Inch;


@end

UIKIT_EXTERN CGFloat kStatusBarMaxY();


UIKIT_EXTERN CGFloat kStandardTableViewCellHeight();
UIKIT_EXTERN CGFloat kStandardButtonHeight();
UIKIT_EXTERN const CGFloat kStandardButtonLeftMargin;
UIKIT_EXTERN const CGFloat kStandardLabelHeight;
UIKIT_EXTERN const CGFloat kStandardNavigationHeight;
UIKIT_EXTERN const CGFloat kStandardTabBarHeight;