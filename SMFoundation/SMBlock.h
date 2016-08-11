//
//  SMBlock.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^SMBaseBlock)();
typedef void (^SMSelectIndexBlock)(NSInteger selectedIndex);
typedef void (^SMParameterBlock)(id);
typedef BOOL (^SMValidateBlock)(id);

UIKIT_EXTERN void sm_dispatch_execute_in_worker_queue(dispatch_block_t block);
UIKIT_EXTERN void sm_dispatch_execute_in_main_queue(dispatch_block_t block);
UIKIT_EXTERN void sm_dispatch_execute_in_main_queue_after(double delaySecond, dispatch_block_t block);
UIKIT_EXTERN BOOL sm_option_contains_bit(NSUInteger option, NSUInteger bit);
// 在子线程中异步并行执行完tasks后，进行finish的回调，tasks的元素是也是dispatch_block_t
UIKIT_EXTERN void sm_dispatch_tasks(NSArray *tasks, dispatch_block_t finishBlock);
UIKIT_EXTERN void sm_dispatch_once(dispatch_block_t block);
