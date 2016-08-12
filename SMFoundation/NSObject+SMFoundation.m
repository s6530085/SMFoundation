//
//  NSObject+SMFoundation.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "NSObject+SMFoundation.h"
#import <objc/runtime.h>


@implementation NSObject (SMFoundation)

- (BOOL)sm_notNullOrEmpty
{
    if ((NSNull *)self == [NSNull null]) {
        return NO;
    }
    
    if ([self respondsToSelector:@selector(count)]) {
        if ([(id)self count] == 0) {
            return NO;
        }
    }
    
    if ([self respondsToSelector:@selector(length)]) {
        if ([(id)self length] == 0) {
            return NO;
        }
    }
    
    return YES;
}


- (nonnull instancetype)sm_brustCopy
{
    Class class = [self class];
    id object = [[class alloc] init];
    while (class != nil &&  ![class isEqual:[NSObject class]]) {
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList(class, &outCount);
        for (i = 0; i < outCount; i++) {
            //get property
            objc_property_t property = properties[i];
            const char *propertyName = property_getName(property);
            NSString *key = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
            
            //check if read-only
            BOOL readonly = NO;
            const char *attributes = property_getAttributes(property);
            NSString *encoding = [NSString stringWithCString:attributes encoding:NSUTF8StringEncoding];
            if ([[encoding componentsSeparatedByString:@","] containsObject:@"R"])
            {
                readonly = YES;
                
                //see if there is a backing ivar with a KVC-compliant name
                NSRange iVarRange = [encoding rangeOfString:@",V"];
                if (iVarRange.location != NSNotFound)
                {
                    NSString *iVarName = [encoding substringFromIndex:iVarRange.location + 2];
                    if ([iVarName isEqualToString:key] ||
                        [iVarName isEqualToString:[@"_" stringByAppendingString:key]])
                    {
                        //setValue:forKey: will still work
                        readonly = NO;
                    }
                }
            }
            
            if (!readonly)
            {
                //exclude read-only properties
                [object setValue:[self valueForKey:key] forKey:key];
            }
        }
        
        class = class_getSuperclass(class);
    }
    
    return object;
}


- (nullable NSString *)sm_JSONString
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if ([jsonData length] > 0 && error == nil) {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    else {
        return nil;
    }
}

@end
