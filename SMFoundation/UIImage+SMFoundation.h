//
//  UIImage+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SMFoundation)

- (CGFloat)width;
- (CGFloat)height;

// 如果参数比原image的size小，是截取原image相应的rect里的部分，如果参数比原image大，则是白底填充原image
- (UIImage *)imageInRect:(CGRect)aRect;
- (UIImage *)centerSquareImage;
- (UIImage *)imageScaledToFitUploadSize;
- (UIImage *)scaledToFitSize:(CGSize)size;
// quality 为1.0及以上时不压缩，否则按照quality素质压缩
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile quality:(CGFloat)quality;
- (UIImage *)fixOrientation;
+ (UIImage *)retina4CompatibleImageNamed:(NSString *)imageName;
+ (UIImage *)patternImageWithColor:(UIColor *)color;
// 暂时只支持竖屏的4,5,6,6p四种尺寸
+ (UIImage *)launchingImage;

// 以下是用于适配的，一般来说，普通图片只需要加载3x的即可，但是那些需要按比例拉伸的，则需要细化处理,当然拉伸肯定是和屏幕等宽啦，如果需要特别比例拉伸就自己算比例去
- (UIImage *)scaledImage;
- (UIImage *)scaledImageExtend:(BOOL)extend;
+ (UIImage *)scaledImageNamed:(NSString *)imageName;
+ (UIImage *)scaledImageNamed:(NSString *)imageName extend:(BOOL)extend;

@end
