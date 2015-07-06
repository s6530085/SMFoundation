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
- (NSDate *)dateRepresentationWithDateFormat:(NSString *)format;
// 格式同上
- (NSString *)stringRepresentationWithDateFormat:(NSString *)format;
+ (NSDate *)dateRepresentationWithDateFormat:(NSString *)format fromString:(NSString *)dateString;
+ (NSString *)currentMonth;
+ (NSString *)currentYear;


@end
