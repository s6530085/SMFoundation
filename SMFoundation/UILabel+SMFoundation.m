//
//  UILabel+SMFoundation.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "UILabel+SMFoundation.h"
#import "NSString+SMFoundation.h"
#import "UIView+SMFoundation.h"


@implementation UILabel (SMFoundation)



- (void)setFontSize:(NSInteger)size
{
    self.font = [UIFont systemFontOfSize:size];
}


- (void)setTextWithDate:(NSDate *)date dateFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *dateFormat = nil;
    if (format == nil) {
        dateFormat = @"yyyy.MM.dd HH: mm: ss";
    } else {
        dateFormat = format;
    }
    formatter.dateFormat = dateFormat;
    NSString *dateString = [formatter stringFromDate:date];
    self.text = dateString;
}


- (void)setText:(NSString *)text constrainedToLineCount:(NSUInteger)maxLineCount
{
    BOOL anyBoolValue;
    [self setText:text constrainedToLineCount:maxLineCount constrained:&anyBoolValue];
}


- (void)setText:(NSString *)text constrainedToLineCount:(NSUInteger)maxLineCount constrained:(BOOL *)constrained
{
    CGFloat height = 0.0f;
    if (maxLineCount == 0) {
        CGSize size = [text sizeWithFont:self.font constrainedToWidth:self.width];
        height = size.height;
        *constrained = NO;
    }
    else {
        NSMutableString *testString = [NSMutableString stringWithString:@"X"];
        for (NSInteger i = 0; i < maxLineCount - 1; i++) {
            [testString appendString:@"\nX"];
        }
        
        
        CGFloat maxHeight = [testString sizeWithFont:self.font constrainedToWidth:self.width].height;
        CGFloat textHeight = [text sizeWithFont:self.font constrainedToWidth:self.width].height;
        if (maxHeight < textHeight) {
            *constrained = YES;
            height = maxHeight;
        }
        else {
            *constrained = NO;
            height = textHeight;
        }
    }
    
    CGRect frame = self.frame;
    frame.size.height = ceilf(height);
    self.frame = frame;
    self.numberOfLines = maxLineCount;
    self.text = text;
}


- (void)setSingleLineText:(NSString *)text constrainedToWidth:(CGFloat)maxWidth
{
    CGSize size = [text sizeWithFont:self.font constrainedToWidth:self.width];
    CGFloat offsetX = size.width - self.frame.size.width;
    [self setSize:size];
    switch (self.textAlignment) {
        case NSTextAlignmentLeft:
            break;
        case NSTextAlignmentCenter:
            [self moveXOffset:(offsetX * 0.5f)];
            break;
        case NSTextAlignmentRight:
            [self moveXOffset:(offsetX * -1.0f)];
            break;
        default:
            break;
    }
    self.numberOfLines = 1;
    self.text = text;
}


@end
