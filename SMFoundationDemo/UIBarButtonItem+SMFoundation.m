//
//  UIBarButtonItem+SMFoundation.m
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/6/30.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "UIBarButtonItem+SMFoundation.h"
#import "UIButton+SMFoundation.h"


@implementation UIBarButtonItem (SMFoundation)


+ (instancetype)itemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName title:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithImageName:imageName highlightedImageName:highlightedImageName title:(NSString *)title target:target action:action];
    if (button == nil) {
        return nil;
    }
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)itemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName title:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithImageName:imageName highlightedImageName:highlightedImageName title:(NSString *)title target:target action:action];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    if (button == nil) {
        return nil;
    }
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


+ (instancetype)itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 0.0f, 20.0f)];
    label.backgroundColor = [UIColor clearColor];
    label.text = title;
    label.textColor = titleColor;
    label.font = font;
    [label sizeToFit];
    label.userInteractionEnabled = YES;
    [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
    
    return [[UIBarButtonItem alloc] initWithCustomView:label];
}

+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIImageView *v = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    v.backgroundColor = [UIColor clearColor];
    v.userInteractionEnabled = YES;
    [v addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:target action:action]];
    return [[UIBarButtonItem alloc] initWithCustomView:v];
}

@end
