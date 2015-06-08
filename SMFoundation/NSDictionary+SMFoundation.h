//
//  NSDictionary+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SMFoundation)

- (NSMutableDictionary *)mutableDeepCopy;
- (NSString *)stringRepresentationByURLEncoding;
- (NSString *)stringForKey:(id)key;
- (NSDate *)dateForKey:(id)key;
- (NSInteger)integerForKey:(id)key;

@end
