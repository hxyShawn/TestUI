//
//  HXYCancelTableViewCell.h
//  manmanda
//
//  Created by liangqi on 17/6/28.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXYCancelTableViewCell : UITableViewCell
@property (nonatomic, strong) NSIndexPath *indexPath;
- (void)confCell:(NSString *)title;
- (void)changeBtnState:(NSInteger )state;
@end

