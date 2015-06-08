//
//  UIImageView+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SMFoundation)


+ (instancetype)imageViewWithImageName:(NSString *)imageName;
// centerImage要完全展示并在view中间，其他部分是黑底
- (void)setCenterImage:(UIImage *)centerImage;

@end
