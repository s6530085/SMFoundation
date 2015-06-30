//
//  UIBarButtonItem+SMFoundation.h
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/6/30.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SMFoundation)

+ (instancetype)itemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName title:(NSString *)title target:(id)target action:(SEL)action;
+ (instancetype)itemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName title:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;
+ (instancetype)itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action;
+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

@end
