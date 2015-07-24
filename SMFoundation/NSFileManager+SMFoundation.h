//
//  NSFileManager+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (SMFoundation)

+ (void)setExcludedFromBackup:(BOOL)excluded forFileAtpath:(NSString *)path;
- (unsigned long long int)documentsFolderSize:(NSString *)documentPath;

+ (void)createDirectoryIfNotExistedAtPath:(NSString *)path;
- (void)removeFileAtPath:(NSString *)path condition:(BOOL (^)(NSString *))block;
+ (BOOL)removeItemIfExistsAtPath:(NSString *)path error:(NSError *)error;

@end
