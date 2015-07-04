//
//  SMBlockView.h
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/7/4.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SMTouchBlock)(NSInteger);
typedef BOOL (^SMValidateBlock)();

@interface SMBlockView : UIAlertView

@property (nonatomic, copy) SMTouchBlock block;
@property (nonatomic, copy) SMValidateBlock validateBlock;

// 只有一个other按钮
- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
   otherButtonTitle:(NSString *)otherButtonTitle
              block:(SMTouchBlock)block;

//- (id)initWithTitle:(NSString *)title
//            message:(NSString *)message
//  cancelButtonTitle:(NSString *)cancelButtonTitle
//  otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION
//              block:(TouchBlock)block;


// 仅展示一个标题为"温馨提示", 一个确定按钮的提示框
+ (void)showAlertMessage:(NSString *)message;

@end
