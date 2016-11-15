//
//  UIButton+SMFoundation.h
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/6/30.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIButton (SMFoundation)

+ (instancetype)buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName title:(NSString *)title target:(id)target action:(SEL)action;
- (void)sm_centerButtonAndImageWithSpacing:(CGFloat)spacing;
- (void)sm_horizonButtonAndImageWithSpacing:(CGFloat)spacing;

@end
NS_ASSUME_NONNULL_END
