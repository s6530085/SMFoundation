//
//  SMVersion.h
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/7/27.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIkit/UIKit.h>

NSString *kSystemVersion();

BOOL kSystemVersionPriorToIOS6();

BOOL kSystemVersionPriorToIOS7();

BOOL kSystemVersionReachesIOS7();

BOOL kSystemVersionPriorToIOS8();

BOOL kSystemVersionReachesIOS8();

NSString *kApplicationBundleVersion();

NSString *kApplicationVersion();
