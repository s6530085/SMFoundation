//
//  NSBundle+SMFoundation.h
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 16/7/11.
//  Copyright © 2016年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSBundle (SMFoundation)

// 这里为何显示出mainBundle了呢，因为bundle可能确实有很多实例,而且其他bundle根本没有响应的键值啊,所以就写成类方法而不是实例方法了
// 这个是版本号，其实也就是CFBundleShortVersionString的值
+ (nullable NSString *)sm_mainBundleVersion;

// build号
+ (nullable NSString *)sm_mainBundleBuild;

@end
