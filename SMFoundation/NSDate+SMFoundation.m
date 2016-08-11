//
//  NSDate+SMFoundation.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "NSDate+SMFoundation.h"

@implementation NSDate (SMFoundation)

static NSDateFormatter *formatter_ = nil;
- (nonnull NSString *)sm_stringRepresentationWithDateFormat:(nullable NSString *)format
{
    if (formatter_ == nil) {
        formatter_ = [[NSDateFormatter alloc] init];
    }
    NSString *dateFormat = nil;
    if (format == nil) {
        dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }
    else {
        dateFormat = format;
    }
    formatter_.dateFormat = dateFormat;
    NSString *dateString = [formatter_ stringFromDate:self];
    return dateString;
}


- (nonnull NSDate *)sm_dateRepresentationWithDateFormat:(nullable NSString *)format
{
    return [formatter_ dateFromString:[self sm_stringRepresentationWithDateFormat:format]];
}


+ (nonnull NSDate *)sm_dateRepresentationWithDateFormat:(nullable NSString *)format fromString:(nonnull NSString *)dateString
{
    if (formatter_ == nil) {
        formatter_ = [[NSDateFormatter alloc] init];
    }
    NSString *dateFormat = nil;
    if (format == nil) {
        dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }
    else {
        dateFormat = format;
    }
    formatter_.dateFormat = dateFormat;
    return [formatter_ dateFromString:dateString];
}


+ (nonnull NSString *)sm_currentDay
{
    static NSDateFormatter *dayFormat_ = nil;
    if (dayFormat_ == nil) {
        dayFormat_ = [[NSDateFormatter alloc] init];
        [dayFormat_ setDateFormat:@"DD"];
    }
    return [dayFormat_ stringFromDate:[NSDate date]];
}


+ (nonnull NSString *)sm_currentMonth
{
    static NSDateFormatter *monthFormat_ = nil;
    if (monthFormat_ == nil) {
        monthFormat_ = [[NSDateFormatter alloc] init];
        [monthFormat_ setDateFormat:@"MM"];
    }
    return [monthFormat_ stringFromDate:[NSDate date]];
}


+ (nonnull NSString *)sm_currentYear
{
    static NSDateFormatter *yearFormat_ = nil;
    if (yearFormat_ == nil) {
        yearFormat_ = [[NSDateFormatter alloc] init];
        [yearFormat_ setDateFormat:@"YYYY"];
    }
    return [yearFormat_ stringFromDate:[NSDate date]];
}

@end
