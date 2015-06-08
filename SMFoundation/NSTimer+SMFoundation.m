//
//  NSTimer+SMFoundation.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "NSTimer+SMFoundation.h"

@implementation NSTimer (SMFoundation)

+ (void)timerBlockInvoke:(NSTimer *)timer
{
    void (^block)()= timer.userInfo;
    if (block) {
        block();
    }
}


+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void(^)())block repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(timerBlockInvoke:) userInfo:[block copy] repeats:repeats];
}


@end
