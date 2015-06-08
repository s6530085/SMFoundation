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

#define kScreenBounds               [[UIScreen mainScreen] bounds]
#define kApplicationFrame           [[UIScreen mainScreen] applicationFrame]


#define kScreenScale                ([UIScreen instancesRespondToSelector:@selector(scale)]?[[UIScreen mainScreen] scale]:(1.0f))
#define kIntegerScreenScale         (NSInteger)kScreenScale

#define kScreenWidth                ([[UIScreen mainScreen] applicationFrame].size.width)
#define kScreenHeight                ([[UIScreen mainScreen] applicationFrame].size.height)
#define kStatusBarMaxY              CGRectGetMaxY([[UIApplication sharedApplication] statusBarFrame])

#define kUserInterfaceIdiomIsPhone  (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kUserInterfaceIdiomIsPad    (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define kScreenIs4InchRetina        (([UIScreen mainScreen].scale == 2.0f) && ([UIScreen mainScreen].bounds.size.height == 568.0f))
#define kScreenLargerThen3Point5InchRetina        (([UIScreen mainScreen].scale >= 2.0f) && ([UIScreen mainScreen].bounds.size.height > 480.0f))


#define kUIAppearanceEnabled        (NSProtocolFromString(@"UIAppearance") != nil)
#define kNSLayoutConstraintEnabled  (NSClassFromString(@"NSLayoutConstraint") != nil)


#define kPathTemp                   NSTemporaryDirectory()
#define kPathDocument               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kPathLibraryCache           [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]


#define kSystemVersion              [[UIDevice currentDevice] systemVersion]
#define kSystemVersionPriorToIOS6   ([kSystemVersion compare:@"6.0" options:NSNumericSearch range:NSMakeRange(0, 3)] == NSOrderedAscending)
#define kSystemVersionPriorToIOS7   ([kSystemVersion compare:@"7.0" options:NSNumericSearch range:NSMakeRange(0, 3)] == NSOrderedAscending)
#define kSystemVersionReachesIOS7   ([kSystemVersion compare:@"7.0" options:NSNumericSearch range:NSMakeRange(0, 3)] != NSOrderedAscending)
#define kSystemVersionPriorToIOS8   ([kSystemVersion compare:@"8.0" options:NSNumericSearch range:NSMakeRange(0, 3)] == NSOrderedAscending)
#define kSystemVersionReachesIOS8   ([kSystemVersion compare:@"8.0" options:NSNumericSearch range:NSMakeRange(0, 3)] != NSOrderedAscending)


#define kApplicationBundleVersion   [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey]
#define kApplicationVersion         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#endif
