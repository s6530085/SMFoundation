//
//  UIImage+SMFoundation.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "UIImage+SMFoundation.h"
#import "UIApplication+SMFoundation.h"
#import "SMSize.h"
#import "UIScreen+SMFoundation.h"

@implementation UIImage (SMFoundation)

- (CGFloat)width
{
    return self.size.width;
}


- (CGFloat)height
{
    return self.size.height;
}


- (nonnull UIImage *)imageInRect:(CGRect)aRect
{
    CGImageRef cg = self.CGImage;
    CGFloat scale = self.scale;
    CGRect rectInCGImage = CGRectMake(aRect.origin.x * scale, aRect.origin.y * scale, aRect.size.width * scale, aRect.size.height * scale);
    CGImageRef newCG = CGImageCreateWithImageInRect(cg, rectInCGImage);
    UIImage *image = [UIImage imageWithCGImage:newCG scale:scale orientation:self.imageOrientation];
    CGImageRelease(newCG);
    return image;
}


- (nonnull UIImage *)centerSquareImage
{
    CGImageRef cg = self.CGImage;
    size_t width = CGImageGetWidth(cg);
    size_t height = CGImageGetHeight(cg);
    size_t length = MIN(width, height);
    CGRect rect = CGRectMake(((width / 2.0f) - (length / 2.0f)), ((height / 2.0f) - (length / 2.0f)), length, length);
    CGImageRef newCG = CGImageCreateWithImageInRect(cg, rect);
    UIImage *image = [UIImage imageWithCGImage:newCG scale:[UIScreen mainScreen].scale orientation:self.imageOrientation];
    CGImageRelease(newCG);
    return image;
}


- (nonnull UIImage *)imageScaledToFitUploadSize
{
    UIImage *imageWithoutScale = [UIImage imageWithCGImage:self.CGImage scale:1.0f orientation:self.imageOrientation];
    CGSize size = imageWithoutScale.size;
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        return self;
    }
    
    if ((size.width * size.height) <= 320000.0f) {
        return self;
    }
    
    CGFloat scale = sqrtf(320000.0f / size.width / size.height);
    CGSize newSize = CGSizeMake(ceilf(size.width * scale), ceilf(size.height * scale));
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 1.0f);
    [imageWithoutScale drawInRect:CGRectMake(0.0f, 0.0f, newSize.width, newSize.height)]; // the actual scaling happens here, and orientation is taken care of automatically.
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (nonnull UIImage *)scaledToFitSize:(CGSize)size
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0.0f, 0.0f, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}


- (BOOL)writeToFile:(nonnull NSString *)path atomically:(BOOL)useAuxiliaryFile quality:(CGFloat)quality
{
    // 顺便排除以外
    if (quality >= 1.0f || quality < 0.0f) {
        NSData *imageData = UIImageJPEGRepresentation(self, 1.0f);
        return [imageData writeToFile:path atomically:useAuxiliaryFile];
    }
    else {
        NSData *data = UIImageJPEGRepresentation(self, quality);
        return [data writeToFile:path atomically:useAuxiliaryFile];
    }
}


+ (nonnull UIImage *)patternImageWithColor:(nonnull UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1.0f, 1.0f), NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color set];
    CGContextFillRect(context, CGRectMake(0.0f, 0.0f, 1.0f, 1.0f));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



- (nonnull UIImage *)fixOrientation
{
    
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp)
        return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0.0f);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0.0f, self.size.height);
            transform = CGAffineTransformRotate(transform, - M_PI_2);
            break;
        default:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0.0f);
            transform = CGAffineTransformScale(transform, -1.0f, 1.0f);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0.0f);
            transform = CGAffineTransformScale(transform, -1.0f, 1.0f);
            break;
        default:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0.0f,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0.0f, 0.0f, self.size.height, self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), self.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}


+ (nonnull UIImage *)launchingImage
{
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    NSString* viewOrientation = @"Portrait";
    if (UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])) {
        viewSize = CGSizeMake(viewSize.height, viewSize.width);
        viewOrientation = @"Landscape";
    }
    
    NSString *imageName = @"";
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            imageName = dict[@"UILaunchImageName"];
            break;
        }
    }
    return [UIImage imageNamed:imageName];
}



- (nonnull UIImage *)scaledImage
{
    return [self scaledImageExtend:NO];
}


- (nonnull UIImage *)scaledImageExtend:(BOOL)extend
{
    if (extend) {
        NSInteger scale = [[UIScreen mainScreen] sm_integerScale];
        if (scale == 1) {
            return self;
        }
        else {
            // 即使是2倍的也有两种尺寸，所以还是要一起防缩一下
            if (self.size.width == [[UIScreen mainScreen] sm_width]) {
                return self;
            }
            else {
                return [self scaledToFitSize:CGSizeMake([[UIScreen mainScreen] sm_width], ceilf([[UIScreen mainScreen] sm_width] * self.size.height / self.size.width))];
            }
        }
    }
    else {
        return self;
    }
}


+ (nonnull UIImage *)scaledImageNamed:(nonnull NSString *)imageName
{
    return [[UIImage imageNamed:imageName] scaledImage];
}


+ (nonnull UIImage *)scaledImageNamed:(nonnull NSString *)imageName extend:(BOOL)extend
{
    return [[UIImage imageNamed:imageName] scaledImageExtend:extend];
}

@end
