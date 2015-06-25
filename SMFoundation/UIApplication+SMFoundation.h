//
//  UIApplication+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>

// 不是真的硬件屏幕尺寸，而是app显示的屏幕尺寸
typedef NS_ENUM(NSInteger, AppScreenType) {
    AppScreenTypeNonRetina,
    AppScreenType4,
    AppScreenType5,
    AppScreenType6,
    AppScreenType6p,
    AppScreenTypeUnknown,
};

@interface UIApplication (SMFoundation)

- (void)startRemovePush;
- (void)clearNotificationMark;
- (BOOL)dialPhone:(NSString *)phoneNumber;
// 同样只支持iPhone的几种竖屏样式
- (AppScreenType)screenType;

@end
