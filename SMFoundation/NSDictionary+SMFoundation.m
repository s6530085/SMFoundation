//
//  NSDictionary+SMFoundation.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "NSDictionary+SMFoundation.h"
#import "NSString+SMFoundation.h"

@implementation NSDictionary (SMFoundation)


- (NSMutableDictionary *)mutableDeepCopy
{
    NSMutableDictionary *ret = [[NSMutableDictionary alloc] initWithCapacity:[self count]];
    NSArray *keys = [self allKeys];
    for (id key in keys)
    {
        id oneValue = [self valueForKey:key];
        id oneCopy = nil;
        
        if ([oneValue respondsToSelector:@selector(mutableDeepCopy)])
            oneCopy = [oneValue mutableDeepCopy];
        else if ([oneValue respondsToSelector:@selector(mutableCopy)])
            oneCopy = [oneValue mutableCopy];
        if (oneCopy == nil)
            oneCopy = [oneValue copy];
        [ret setValue:oneCopy forKey:key];
    }
    return ret;
}


- (NSString *)stringRepresentationByURLEncoding
{
    NSMutableArray *pairs = [NSMutableArray array];
    for (NSString *key in [self allKeys])
    {
        id object = self[key];
        if (![object isKindOfClass:[NSString class]]) {
            continue;
        }
        [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, [object URLEncodedString]]];
    }
    return [pairs componentsJoinedByString:@"&"];
}


- (NSString *)stringForKey:(id)key
{
    id object = self[key];
    if ((object == nil) || ([object isEqual:[NSNull null]])) {
        return @"";
    }
    if (![object isKindOfClass:[NSString class]]) {
        return [NSString stringWithFormat:@"%@", object];
    }
    return object;
}


- (NSDate *)dateForKey:(id)key
{
    NSTimeInterval timeInterval = [self[key] doubleValue];
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}


- (NSInteger)integerForKey:(id)key
{
    id object = self[key];
    if ([object respondsToSelector:@selector(integerValue)]) {
        return [object integerValue];
    }
    return 0;
}


@end
