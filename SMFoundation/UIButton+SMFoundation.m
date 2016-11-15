//
//  UIButton+SMFoundation.m
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/6/30.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "UIButton+SMFoundation.h"

@implementation UIButton (SMFoundation)

+ (id)buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName title:(NSString *)title target:(id)target action:(SEL)action
{
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *highlightedImage = nil;
    if (highlightedImageName != nil) {
        highlightedImage = [UIImage imageNamed:highlightedImageName];
    }
    CGSize imageSize = [image size];
    CGSize highlightedImageSize = [highlightedImage size];
    if (highlightedImageName != nil) {
        if (!image || !highlightedImage) {
            return nil;
        }
        if (!CGSizeEqualToSize(imageSize, highlightedImageSize)) {
            return nil;
        }
    }
    else {
        if (!image) {
            return nil;
        }
    }
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 40.0f, imageSize.height+20)];
    if (title != nil) {
        [button setTitle:title forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:12.0f]];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(20.0f, -30.0f, 0.0f, 0.0f)];
    }
    [button setImage:image forState:UIControlStateNormal];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0.0f, 0.0f, 20.0f, 0.0f)];
    if (highlightedImageName) {
        [button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}


// 左图右文的间隔
- (void)sm_centerButtonAndImageWithSpacing:(CGFloat)spacing
{
    CGFloat insetAmount = spacing / 2.0;
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -insetAmount, 0, insetAmount);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, insetAmount, 0, -insetAmount);
    self.contentEdgeInsets = UIEdgeInsetsMake(0, insetAmount, 0, insetAmount);
}

// 上图下文哦
- (void)sm_horizonButtonAndImageWithSpacing:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    self.imageEdgeInsets = UIEdgeInsetsMake((-titleSize.height + spacing), 0.0, 0.0, -titleSize.width);
}

@end
