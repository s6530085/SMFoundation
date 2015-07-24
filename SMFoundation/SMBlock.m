//
//  SMBlock.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "SMBlock.h"


void sm_dispatch_execute_in_worker_queue(dispatch_block_t block)
{
    dispatch_queue_t workerQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(workerQueue, block);
}

void sm_dispatch_execute_in_main_queue(dispatch_block_t block)
{
    if ([NSThread isMainThread]) {
        block();
    }
    else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}


void sm_dispatch_execute_in_main_queue_after(double delaySecond, dispatch_block_t block)
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaySecond * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}


BOOL sm_option_contains_bit(NSUInteger option, NSUInteger bit)
{
    if (option & bit) {
        return YES;
    }
    return NO;
}
