//
//  UIApplication+SMFoundation.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "UIApplication+SMFoundation.h"
#import "SMCommon.h"

@implementation UIApplication (SMFoundation)


- (void)startRemovePush
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
        
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge
                                                                                             |UIUserNotificationTypeSound
                                                                                             |UIUserNotificationTypeAlert)
                                                                                 categories:nil];
        [self registerUserNotificationSettings:settings];
        [self registerForRemoteNotifications];
#else
        [self registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge
                                                  |UIRemoteNotificationTypeSound
                                                  |UIRemoteNotificationTypeAlert)];
#endif
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
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@", phoneNumber]];
    if (![self canOpenURL:url]) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", phoneNumber]];
        if (![self canOpenURL:url]) {
            // 不能打电话就拉到
            return NO;
        }
    }
    
    [self openURL:url];
    return YES;
}


- (AppScreenType)screenType
{
    // todosm 仍须验证，特别是6p的，还没适配过
    if (kScreenScale == 1.0f) {
        return AppScreenTypeNonRetina;
    }
    CGFloat screenHeight = kScreenHeight;
    if (screenHeight == 480.0f) {
        return AppScreenType4;
    }
    else if (screenHeight == 568.0f) {
        return AppScreenType5;
    }
    else if (screenHeight == 667.0f) {
        return AppScreenType6;
    }
    else if (screenHeight == 1104.0f) {
        return AppScreenType6p;
    }
    else {
        return AppScreenTypeUnknown;
    }
}


@end
