//
//  UILabel+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SMFoundation)

- (void)setFontSize:(NSInteger)size;
- (void)setTextWithDate:(NSDate *)date dateFormat:(NSString *)format;
- (void)setText:(NSString *)text constrainedToLineCount:(NSUInteger)maxLineCount;
- (void)setText:(NSString *)text constrainedToLineCount:(NSUInteger)maxLineCount constrained:(BOOL *)constrained;

- (void)setSingleLineText:(NSString *)text constrainedToWidth:(CGFloat)maxWidth;

@end
