//
//  UIScreen+SMFoundation.m
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 16/8/3.
//  Copyright © 2016年 study_sun. All rights reserved.
//

#import "UIScreen+SMFoundation.h"
#import "SMBlock.h"

@implementation UIScreen (SMFoundation)

- (NSInteger)sm_integerScale
{
    return (NSInteger)self.scale;
}

- (CGFloat)sm_width
{
    return CGRectGetWidth(self.bounds);
}
// 这个高是整个screen的高，所以有statusbar的高度
- (CGFloat)sm_height
{
    return CGRectGetHeight(self.bounds);
}


- (CGFloat)sm_portraitHeight
{
    static CGFloat height_ = 0;
    SM_DISPATCH_ONCE(^{
        if ([self respondsToSelector:@selector(nativeBounds)]) {
            height_ = CGRectGetHeight([self nativeBounds])/[self sm_integerScale];
        }
        else {
            height_ = [self sm_height];
        }
    });
    return height_;
}


// 和版本比较一样，也是存在屏幕是否是某某尺寸的，或者屏幕大于某某尺寸的两种比较.如果iOS>=8需要用nativeBounds
- (BOOL)sm_is3Point5Inch
{
    return [self sm_portraitHeight] == 480.0f;
}


- (BOOL)sm_reaches3Point5Inch
{
    return [self sm_portraitHeight] >= 480.0f;
}


- (BOOL)sm_is4Inch
{
    return [self sm_portraitHeight] == 560.0f;
}


- (BOOL)sm_reaches4Inch
{
    return [self sm_portraitHeight] >= 560.0f;
}


- (BOOL)sm_is4Point7Inch
{
    return [self sm_portraitHeight] == 667.0f;
}


- (BOOL)sm_reaches4Point7Inch
{
    return [self sm_portraitHeight] >= 667.0f;
}


- (BOOL)sm_is5Point5Inch
{
    return [self sm_portraitHeight] == 736.0f;
}


- (BOOL)sm_reaches5Point5Inch
{
    return [self sm_portraitHeight] >= 736.0f;
}

@end
