//
//  NSArray+SMFoundation.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "NSArray+SMFoundation.h"
#import "NSMutableArray+SMFoundation.h"

@implementation NSArray (SMFoundation)

- (id)firstObject
{
    if ([self count] == 0) {
        return nil;
    }
    return [self objectAtIndex:0];
}


- (NSArray *)arrayWithObjectsPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate
{
    NSIndexSet *indexes = [self indexesOfObjectsPassingTest:predicate];
    return [self objectsAtIndexes:indexes];
}


- (NSArray *)arrayByRemovingObjectsOfClass:(Class)aClass
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    [array removeObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:aClass]) {
            return YES;
        }
        else return NO;
    }];
    return [[NSArray alloc] initWithArray:array];
}


- (NSArray *)arrayByKeepingObjectsOfClass:(Class)aClass
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    [array removeObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:aClass]) {
            return NO;
        }
        else {
            return YES;
        }
    }];
    return [[NSArray alloc] initWithArray:array];
}


- (NSArray *)arrayByRemovingObjectsFromArray:(NSArray *)otherArray
{
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return ![otherArray containsObject:evaluatedObject];
    }];
    return [self filteredArrayUsingPredicate:predicate];
}


- (NSArray *)transformedArrayUsingHandler:(id (^)(id originalObject, NSUInteger index))handler
{
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSInteger i = 0; i < [self count]; i++) {
        id resultObject = handler(self[i], i);
        [tempArray addObject:resultObject];
    }
    return [NSArray arrayWithArray:tempArray];
}


- (NSRange)fullRange
{
    return NSMakeRange(0, self.count);
}


- (NSArray *)sm_map:(id(^)(id obj))block
{
    NSMutableArray *a = @[].mutableCopy;
    for (id o in self) {
        id on = block(o);
        // 理论上应该是每个都有对应的，但为了简单还是容错一下，实际上也成了filter的感觉
        if (on) {
            [a addObject: on];
        }
    }
    return [NSArray arrayWithArray: a];
}


- (void)sm_apply:(void(^)(id obj))block
{
    for (id o in self) {
        block(o);
    }
}

@end
