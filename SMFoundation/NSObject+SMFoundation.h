//
//  NSObject+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSObject (SMFoundation)

// 判断实际类型，处理了NSNull，和NSString
- (BOOL)sm_notNullOrEmpty;
- (instancetype)sm_brustCopy;
- (nullable NSString *)sm_JSONString;

@end
NS_ASSUME_NONNULL_END
