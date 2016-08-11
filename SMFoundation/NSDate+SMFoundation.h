//
//  NSDate+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SMFoundation)

//若format为nil ,默认为 yyyy-MM-dd HH:mm:ss 格式
- (nonnull NSDate *)sm_dateRepresentationWithDateFormat:(nullable NSString *)format;
// 格式同上
- (nonnull NSString *)sm_stringRepresentationWithDateFormat:(nullable NSString *)format;
+ (nonnull NSDate *)sm_dateRepresentationWithDateFormat:(nullable NSString *)format fromString:(nonnull NSString *)dateString;
+ (nonnull NSString *)sm_currentDay;
+ (nonnull NSString *)sm_currentMonth;
+ (nonnull NSString *)sm_currentYear;


@end
