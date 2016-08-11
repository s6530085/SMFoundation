//
//  UIDevice+SMFoundation.h
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 16/7/11.
//  Copyright © 2016年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (SMFoundation)
// 对大版本提供两种比较，比如系统是否是6，以及系统是否达到了6，大部分情况用达到即可，但是可能有些系统性的bug出现在特定操作系统
// 因为不太可能有除了currentDevice之外的设备，所以就写成类方法了
// 这是比较泛用的写法，如果你要判定当前系统是否大于iOS7，直接传"7"即可,当然你也可以传"7.1"之类的,你传的越多，要求匹配自然是越精准
- (BOOL)sm_systemVersionEqualsTo:(NSString *)version;
- (BOOL)sm_systemVersionReaches:(NSString *)version;

// 下面是些便利方法，相当于直接传7，8，9之类
- (BOOL)sm_systemVersionEqualsToIOS7;
- (BOOL)sm_systemVersionReachesIOS7;
- (BOOL)sm_systemVersionEqualsToIOS8;
- (BOOL)sm_systemVersionReachesIOS8;
- (BOOL)sm_systemVersionEqualsToIOS9;
- (BOOL)sm_systemVersionReachesIOS9;
- (BOOL)sm_systemVersionEqualsToIOS10;
- (BOOL)sm_systemVersionReachesIOS10;

@end

UIKIT_EXTERN BOOL kUserInterfaceIdiomIsPhone();
UIKIT_EXTERN BOOL kUserInterfaceIdiomIsPad();