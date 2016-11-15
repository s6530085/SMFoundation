//
//  UIDevice+SMFoundation.m
//  SMFoundationTest
//
//  Created by GongpingjiaNanjing on 16/7/11.
//  Copyright © 2016年 study_sun. All rights reserved.
//

#import "UIDevice+SMFoundation.h"
#import "SMBlock.h"

@implementation UIDevice (SMFoundation)


- (BOOL)sm_systemVersionReaches:(NSString *)version
{
    return [self systemVersion].doubleValue >= version.doubleValue;
}


- (BOOL)sm_systemVersionReachesIOS7
{
    static BOOL reaches_;
    SM_DISPATCH_ONCE(^{
        reaches_ = [self sm_systemVersionReaches:@"7"];
    });
    return reaches_;
}



- (BOOL)sm_systemVersionReachesIOS8
{
    static BOOL reaches_;
    SM_DISPATCH_ONCE(^{
        reaches_ = [self sm_systemVersionReaches:@"8"];
    });
    return reaches_;
}



- (BOOL)sm_systemVersionReachesIOS9
{
    static BOOL reaches_;
    SM_DISPATCH_ONCE(^{
        reaches_ = [self sm_systemVersionReaches:@"9"];
    });
    return reaches_;
}


- (BOOL)sm_systemVersionReachesIOS10
{
    static BOOL reaches_;
    SM_DISPATCH_ONCE(^{
        reaches_ = [self sm_systemVersionReaches:@"10"];
    });
    return reaches_;
}

@end

BOOL kUserInterfaceIdiomIsPhone()
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}


BOOL kUserInterfaceIdiomIsPad()
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}
