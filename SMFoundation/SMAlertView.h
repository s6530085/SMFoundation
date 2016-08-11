//
//  SMBlockView.h
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/7/4.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SMTouchBlock)(NSInteger);
typedef BOOL (^SMAlertValidateBlock)();

@interface SMAlertView : UIAlertView

@property (nullable, nonatomic, copy) SMTouchBlock block;
@property (nullable, nonatomic, copy) SMAlertValidateBlock validateBlock;

// 只有一个other按钮
- (nonnull instancetype)initWithTitle:(nullable NSString *)title
            message:(nullable NSString *)message
  cancelButtonTitle:(nullable NSString *)cancelButtonTitle
   otherButtonTitle:(nullable NSString *)otherButtonTitle
              block:(nullable SMTouchBlock)block;

// 仅展示一个标题为"温馨提示", 一个确定按钮的提示框
+ (void)showAlertMessage:(nullable NSString *)message;

@end
