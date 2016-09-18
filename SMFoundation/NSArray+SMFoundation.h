//
//  NSArray+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSArray (SMFoundation)

- (nullable id)firstObject;

- (NSArray *)arrayWithObjectsPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate;
- (NSArray *)arrayByRemovingObjectsOfClass:(Class)aClass;
- (NSArray *)arrayByKeepingObjectsOfClass:(Class)aClass;
- (NSArray *)arrayByRemovingObjectsFromArray:(NSArray *)otherArray;

- (NSArray *)transformedArrayUsingHandler:(id (^)(id originalObject, NSUInteger index))handler;
- (NSRange)fullRange;

- (NSArray *)sm_map:(id(^)(id obj))block;
- (void)sm_apply:(void(^)(id obj))block;

@end
NS_ASSUME_NONNULL_END
