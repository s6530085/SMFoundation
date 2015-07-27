//
//  UIApplication+SMFoundation.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "UIApplication+SMFoundation.h"
#import "SMSize.h"

@implementation UIApplication (SMFoundation)


- (void)startRemovePush
{
    if ([self respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge
                                                                                             |UIUserNotificationTypeSound
                                                                                             |UIUserNotificationTypeAlert)
                                                                                 categories:nil];
        [self registerUserNotificationSettings:settings];
        [self registerForRemoteNotifications];
    }
    else {
        [self registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge
                                                  |UIRemoteNotificationTypeSound
                                                  |UIRemoteNotificationTypeAlert)];
    }
}


- (void)clearNotificationMark
{
    [self setApplicationIconBadgeNumber:1];
    [self setApplicationIconBadgeNumber:0];
    NSArray* scheduledNotifications = [NSArray arrayWithArray:self.scheduledLocalNotifications];
    self.scheduledLocalNotifications = scheduledNotifications;
    [self cancelAllLocalNotifications];
}


- (BOOL)dialPhone:(NSString *)phoneNumber
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", phoneNumber]];
    if (![self canOpenURL:url]) {
        // 不能打电话就拉到
        return NO;
    }
    
    [self openURL:url];
    return YES;
}


- (AppScreenType)screenType
{
    // 有可能screen不包括statusbar，所以要放宽
    if (kScreenScale() == 1.0f) {
        return AppScreenTypeNonRetina;
    }
    CGFloat screenHeight = kScreenHeight();
    if (screenHeight <= 481.0f) {
        return AppScreenType4;
    }
    else if (screenHeight <= 569.0f) {
        return AppScreenType5;
    }
    else if (screenHeight <= 668.0f) {
        return AppScreenType6;
    }
    else if (screenHeight <= 1105.0f) {
        return AppScreenType6p;
    }
    else {
        return AppScreenTypeUnknown;
    }
}


@end
