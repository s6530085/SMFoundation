//
//  SMCommon.h
//  SMFoundation
//
//  Created by study_sun on 15/1/29.
//
//

#ifndef SMFoundation_SMCommon_h
#define SMFoundation_SMCommon_h

#import <UIKit/UIKit.h>

CGRect kScreenBounds();
CGRect kApplicationFrame();
CGFloat kScreenScale();
NSInteger kIntegerScreenScale();
CGFloat kScreenWidth();
CGFloat kScreenHeight();
CGFloat kStatusBarMaxY();

BOOL kUserInterfaceIdiomIsPhone();
BOOL kUserInterfaceIdiomIsPad();
BOOL kScreenIs4InchRetina();
BOOL kScreenLargerThen3Point5InchRetina();

NSString *kPathTemp();
NSString *kPathDocument();
NSString *kPathLibraryCache();

NSString *kSystemVersion();
BOOL kSystemVersionPriorToIOS6();
BOOL kSystemVersionPriorToIOS7();
BOOL kSystemVersionReachesIOS7();
BOOL kSystemVersionPriorToIOS8();
BOOL kSystemVersionReachesIOS8();

NSString *kApplicationBundleVersion();
NSString *kApplicationVersion();

#endif
