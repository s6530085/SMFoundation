//
//  SMVersion.h
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/7/27.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIkit/UIKit.h>

UIKIT_EXTERN NSString *kSystemVersion();

UIKIT_EXTERN BOOL kSystemVersionPriorToIOS6();

UIKIT_EXTERN BOOL kSystemVersionPriorToIOS7();

UIKIT_EXTERN BOOL kSystemVersionReachesIOS7();

UIKIT_EXTERN BOOL kSystemVersionPriorToIOS8();

UIKIT_EXTERN BOOL kSystemVersionReachesIOS8();

UIKIT_EXTERN NSString *kApplicationBundleVersion();

UIKIT_EXTERN NSString *kApplicationVersion();
