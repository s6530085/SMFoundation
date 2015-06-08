//
//  UITableView+SMFoundation.m
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import "UITableView+SMFoundation.h"

@implementation UITableView (SMFoundation)


- (NSIndexPath *)lastIndexPath
{
    NSInteger numberOfSections = [self numberOfSections];
    if (numberOfSections == 0) {
        return nil;
    }
    NSInteger lastSection = numberOfSections - 1;
    
    NSInteger numberOfRowsInLastSection = [self numberOfRowsInSection:lastSection];
    if (numberOfRowsInLastSection == 0) {
        return nil;
    }
    NSInteger lastRow = numberOfRowsInLastSection - 1;
    return [NSIndexPath indexPathForRow:lastRow inSection:lastSection];
}


- (void)scrollToLastRowAnimated:(BOOL)animated
{
    NSIndexPath *lastIndexPath = [self lastIndexPath];
    [self scrollToRowAtIndexPath:lastIndexPath
                atScrollPosition:UITableViewScrollPositionBottom
                        animated:animated];
}


- (BOOL)lastCellVisible
{
    NSArray *visibleIndexPaths = [self indexPathsForVisibleRows];
    if ([visibleIndexPaths containsObject:[self lastIndexPath]]) {
        return YES;
    }
    return NO;
}


- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)rowAnimation
{
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:rowAnimation];
}

@end
