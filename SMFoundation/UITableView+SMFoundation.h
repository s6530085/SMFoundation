//
//  UITableView+SMFoundation.h
//  SMFoundationTest
//
//  Created by study_sun on 15/6/8.
//  Copyright (c) 2015年 study_sun. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UITableView (SMFoundation)

- (NSIndexPath *)lastIndexPath;
- (void)scrollToLastRowAnimated:(BOOL)animated;
- (BOOL)lastCellVisible;
// 单独重载一行的
- (void)reloadRowAtIndexPath:(NSIndexPath *)indexPath withRowAnimation:(UITableViewRowAnimation)rowAnimation;

+ (CGFloat)standardCellHeight;

@end
NS_ASSUME_NONNULL_END
