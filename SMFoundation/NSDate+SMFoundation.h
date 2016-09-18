//
//  NSDate+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSDate (SMFoundation)

//若format为nil ,默认为 yyyy-MM-dd HH:mm:ss 格式
- (NSDate *)sm_dateRepresentationWithDateFormat:(nullable NSString *)format;
// 格式同上
- (NSString *)sm_stringRepresentationWithDateFormat:(nullable NSString *)format;
+ (NSDate *)sm_dateRepresentationWithDateFormat:(nullable NSString *)format fromString:(NSString *)dateString;
+ (NSString *)sm_currentDay;
+ (NSString *)sm_currentMonth;
+ (NSString *)sm_currentYear;


@end
NS_ASSUME_NONNULL_END
