//
//  UIApplication+SMFoundation.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "UIApplication+SMFoundation.h"
#import "SMSize.h"
#import "UIDevice+SMFoundation.h"

@implementation UIApplication (SMFoundation)

- (BOOL)isPushOpened
{
    if ([self respondsToSelector:@selector(isRegisteredForRemoteNotifications)]) {
        return [self isRegisteredForRemoteNotifications];
    }
    else {
        UIRemoteNotificationType pushType = [self enabledRemoteNotificationTypes];
        return pushType != UIRemoteNotificationTypeNone;
    }
}


- (void)openPushSetting
{
    if ([[UIDevice currentDevice] sm_systemVersionReachesIOS8]) {
        [self openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
    // 否则什么也做不了
}


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


- (BOOL)dialPhone:(nonnull NSString *)phoneNumber
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", phoneNumber]];
    if (![self canOpenURL:url]) {
        // 不能打电话就拉到
        return NO;
    }
    
    [self openURL:url];
    return YES;
}

@end
