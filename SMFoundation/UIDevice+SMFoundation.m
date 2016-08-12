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

- (BOOL)sm_systemVersionEqualsTo:(NSString *)version
{
    return ([[self systemVersion] compare:version options:NSNumericSearch range:NSMakeRange(0, [version length])] == NSOrderedSame);
}


- (BOOL)sm_systemVersionReaches:(NSString *)version
{
    return ([[self systemVersion] compare:version options:NSNumericSearch range:NSMakeRange(0, [version length])] != NSOrderedAscending);
}


// 别想抽离公共方法啦，都用static变量保存了，当然必须要每个方法自己执行
- (BOOL)sm_systemVersionEqualsToIOS7
{
    static BOOL equals_;
    SM_DISPATCH_ONCE(^{
        equals_ = [self sm_systemVersionEqualsTo:@"7"];
    });
    return equals_;
}


- (BOOL)sm_systemVersionReachesIOS7
{
    static BOOL reaches_;
    SM_DISPATCH_ONCE(^{
        reaches_ = [self sm_systemVersionReaches:@"7"];
    });
    return reaches_;
}


- (BOOL)sm_systemVersionEqualsToIOS8
{
    static BOOL equals_;
    SM_DISPATCH_ONCE(^{
        equals_ = [self sm_systemVersionEqualsTo:@"8"];
    });
    return equals_;
}


- (BOOL)sm_systemVersionReachesIOS8
{
    static BOOL reaches_;
    SM_DISPATCH_ONCE(^{
        reaches_ = [self sm_systemVersionReaches:@"8"];
    });
    return reaches_;
}


- (BOOL)sm_systemVersionEqualsToIOS9
{
    static BOOL equals_;
    SM_DISPATCH_ONCE(^{
        equals_ = [self sm_systemVersionEqualsTo:@"9"];
    });
    return equals_;
}


- (BOOL)sm_systemVersionReachesIOS9
{
    static BOOL reaches_;
    SM_DISPATCH_ONCE(^{
        reaches_ = [self sm_systemVersionReaches:@"9"];
    });
    return reaches_;
}


- (BOOL)sm_systemVersionEqualsToIOS10
{
    static BOOL equals_;
    SM_DISPATCH_ONCE(^{
        equals_ = [self sm_systemVersionEqualsTo:@"10"];
    });
    return equals_;
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
