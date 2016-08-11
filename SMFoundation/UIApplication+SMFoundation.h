//
//  UIApplication+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (SMFoundation)

- (BOOL)isPushOpened;
- (void)openPushSetting;
- (void)startRemovePush;
- (void)clearNotificationMark;
- (BOOL)dialPhone:(nonnull NSString *)phoneNumber;

@end
