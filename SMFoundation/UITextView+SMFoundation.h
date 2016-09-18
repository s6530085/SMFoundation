//
//  UITextView+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UITextView (SMFoundation)

- (BOOL)isEmptyAfterTrimmingWhitespaceAndNewlineCharacters;

- (CGFloat)textHeight;

@end
NS_ASSUME_NONNULL_END
