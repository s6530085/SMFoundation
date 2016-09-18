//
//  UIView+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIView (SMFoundation)


- (void)removeAllGestureRecognizer;
- (void)removeAllSubviews;
// 只移除特定类型的子控件
- (void)removeAllSubviewsWhenInstancesOfClasses:(NSArray *)classes;
- (void)addSubviews:(NSArray *)sb;
- (void)addAlwaysFitSubview:(UIView *)subview;
- (void)addAlwaysFitSubview:(UIView *)subview withEdgeInsets:(UIEdgeInsets)edgeInsets;
- (NSArray *)captureDisplayImage;

- (CGFloat)height;
- (CGFloat)width;

- (void)setOrigin:(CGPoint)origin;
- (void)setSize:(CGSize)size;
- (void)setX:(CGFloat)x;
- (CGFloat)x;
- (void)setY:(CGFloat)y;
- (CGFloat)y;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;

// 这些move动作方向是第二象限为正
- (void)moveXOffset:(CGFloat)xOffset;
- (void)moveYOffset:(CGFloat)yOffset;
- (void)moveToCenterOfSuperview;

- (void)setTop:(CGFloat)top;
- (CGFloat)top;

- (void)setBottom:(CGFloat)bottom;
- (CGFloat)bottom;

- (void)setCenterX:(CGFloat)centerX;
- (CGFloat)centerX;

- (void)setCenterY:(CGFloat)centerY;
- (CGFloat)centerY;

- (void)setLeft:(CGFloat)left;
- (CGFloat)left;

- (void)setRight:(CGFloat)right;
- (CGFloat)right;

- (CGSize)size;


@end

// 一些对CGRect和CGPoint等的操作就写这里了
CG_EXTERN CGFloat sm_RectCenterX(CGRect rect);
CG_EXTERN CGFloat sm_RectCenterY(CGRect rect);

NS_ASSUME_NONNULL_END
