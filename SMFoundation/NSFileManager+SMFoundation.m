//
//  NSFileManager+SMFoundation.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "NSFileManager+SMFoundation.h"
#import <sys/xattr.h>

@implementation NSFileManager (SMFoundation)


+ (void)setExcludedFromBackup:(BOOL)excluded forFileAtpath:(NSString *)path
{
    NSURL *url = [NSURL fileURLWithPath:path];
    [url setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:nil];
}


- (unsigned long long int) documentsFolderSize:(NSString *)documentPath
{
    NSString *_documentsDirectory = documentPath;
    NSArray *_documentsFileList;
    NSEnumerator *_documentsEnumerator;
    NSString *_documentFilePath;
    unsigned long long int _documentsFolderSize = 0;
    
    _documentsFileList = [self subpathsAtPath:_documentsDirectory];
    _documentsEnumerator = [_documentsFileList objectEnumerator];
    while (_documentFilePath = [_documentsEnumerator nextObject]) {
        NSDictionary *_documentFileAttributes = [self attributesOfItemAtPath:[_documentsDirectory stringByAppendingPathComponent:_documentFilePath] error:nil];
        _documentsFolderSize += [_documentFileAttributes fileSize];
    }
    
    return _documentsFolderSize;
}


+ (void)createDirectoryIfNotExistedAtPath:(NSString *)path
{
    BOOL isDirectory = NO;
    BOOL exists = [[self defaultManager] fileExistsAtPath:path isDirectory:&isDirectory];
    if (exists) {
        if (isDirectory) {
            return;
        }
        [[self defaultManager] removeItemAtPath:path error:nil];
    }
    
    [[self defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
}


- (void)removeFileAtPath:(NSString *)path condition:(BOOL (^)(NSString *))block
{
    NSArray *files = [self contentsOfDirectoryAtPath:path error:nil];
    for (NSString *filePath in files) {
        NSString *fullPath = [path stringByAppendingPathComponent:filePath];
        if (block(fullPath)) {
            [self removeItemAtPath:fullPath error:nil];
        }
    }
}


+ (BOOL)removeItemIfExistsAtPath:(NSString *)path error:(NSError *)error
{
    BOOL result = NO;
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        result = [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    }
    return result;
}


@end
