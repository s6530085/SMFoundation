//
//  NSDictionary+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSDictionary (SMFoundation)

- (NSMutableDictionary *)mutableDeepCopy;
- (NSString *)stringRepresentationByURLEncoding;
- (NSString *)sm_stringForKey:(id)key;
- (NSDate *)dateForKey:(id)key;
- (NSInteger)integerForKey:(id)key;

@end
NS_ASSUME_NONNULL_END
