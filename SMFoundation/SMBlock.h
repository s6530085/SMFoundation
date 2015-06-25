//
//  SMBlock.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SMBaseBlock)();
typedef void (^SMParameterBlock)(id);
typedef BOOL (^SMValidateBlock)(id);

// Thanks to: https://gist.github.com/1057420
#define SHARED_INSTANCE_USING_BLOCK(block) \
static dispatch_once_t pred = 0; \
__strong static id _sharedObject = nil; \
dispatch_once(&pred, ^{ \
_sharedObject = block(); \
}); \
return _sharedObject; \


extern void sm_dispatch_execute_in_worker_queue(dispatch_block_t block);
extern void sm_dispatch_execute_in_main_queue(dispatch_block_t block);
extern void sm_dispatch_execute_in_main_queue_after(double delay, dispatch_block_t block);


extern BOOL sm_option_contains_bit(NSUInteger option, NSUInteger bit);

