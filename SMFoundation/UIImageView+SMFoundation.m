//
//  UIImageView+SMFoundation.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "UIImageView+SMFoundation.h"
#import "UIView+SMFoundation.h"

@implementation UIImageView (SMFoundation)


+ (id)imageViewWithImageName:(NSString *)imageName
{
    return [[self alloc] initWithImage:[UIImage imageNamed:imageName]];
}


- (void)setCenterImage:(UIImage *)centerImage
{
    CGRect rect;
    // 如果centerImage相对是宽图
    if (centerImage.size.width / centerImage.size.height > self.width / self.height) {
        // 不取浮点数以防抖动,而且完全可能centerImage比self大
        NSInteger height = centerImage.size.height * (self.width / centerImage.size.width);
        rect.origin = CGPointMake(0.0f, (self.height - height) / 2);
        rect.size = CGSizeMake(self.width, height);
    }
    else {
        NSInteger width = centerImage.size.width * (self.height / centerImage.size.height);
        rect.origin = CGPointMake((self.width - width) / 2, 0.0f);
        rect.size = CGSizeMake(width, self.height);
    }
    
    UIGraphicsBeginImageContextWithOptions(self.frame.size, YES, [[UIScreen mainScreen] scale]);
    [centerImage drawInRect:rect];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.image = scaledImage;
}


@end
