//
//  NSObject+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SMFoundation)

- (BOOL)notNilOrEmpty;
- (instancetype)brustCopy;
+ (instancetype)sm_sharedInstance;

@end
