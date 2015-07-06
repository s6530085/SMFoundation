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
- (NSString *)stringRepresentationWithDateFormat:(NSString *)format
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


- (NSDate *)dateRepresentationWithDateFormat:(NSString *)format
{
    return [formatter_ dateFromString:[self stringRepresentationWithDateFormat:format]];
}


+ (NSDate *)dateRepresentationWithDateFormat:(NSString *)format fromString:(NSString *)dateString
{
    if (formatter_ == nil) {
        formatter_ = [[NSDateFormatter alloc] init];
        //        [formatter_ setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
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


+ (NSString *)currentMonth
{
    static NSString *_currnetMonth = nil;
    if (_currnetMonth == nil) {
        NSDateFormatter *monthFormat = [[NSDateFormatter alloc] init];
        [monthFormat setDateFormat:@"MM"];
        NSDate *date = [NSDate date];
        _currnetMonth = [monthFormat stringFromDate:date];
    }
    return _currnetMonth;
}


+ (NSString *)currentYear
{
    static NSString *_currentYear = nil;
    if (_currentYear == nil) {
        NSDate *date = [NSDate date];
        NSDateFormatter *yearFormat = [[NSDateFormatter alloc] init];
        [yearFormat setDateFormat:@"YYYY"];
        _currentYear = [yearFormat stringFromDate:date];
    }
    return _currentYear;
}

@end
