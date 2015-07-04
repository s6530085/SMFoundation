//
//  SMBlockView.m
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 15/7/4.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "SMAlertView.h"

@implementation SMAlertView


- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
   otherButtonTitle:(NSString*)otherButtonTitle
              block:(SMTouchBlock)block {
    self = [super initWithTitle:title
                        message:message
                       delegate:self
              cancelButtonTitle:cancelButtonTitle
              otherButtonTitles:otherButtonTitle, nil];
    if (self != nil) {
        self.block = block;
    }
    return self;
}


+ (void)showAlertMessage:(NSString *)message
{
    SMAlertView *alert = [[SMAlertView alloc] initWithTitle:@"温馨提示" message:message cancelButtonTitle:@"确定" otherButtonTitle:nil block:nil];
    [alert show];
}


#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (_block) {
        _block(buttonIndex);
    }
}


- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    if (self.validateBlock) {
        return self.validateBlock();
    }
    return YES;
}

@end
