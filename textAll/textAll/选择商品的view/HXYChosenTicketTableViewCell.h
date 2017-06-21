//
//  HXYChosenTicketTableViewCell.h
//  manmanda
//
//  Created by liangqi on 17/5/9.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HXYChosenTicketTableViewCellDelegate;

@interface HXYChosenTicketTableViewCell : UITableViewCell
@property (nonatomic, assign) NSInteger cnt;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) id<HXYChosenTicketTableViewCellDelegate>delegate;
@end

@protocol HXYChosenTicketTableViewCellDelegate <NSObject>

- (void)HXYChosenTicketTableViewCell:(HXYChosenTicketTableViewCell *)cell;

@end
