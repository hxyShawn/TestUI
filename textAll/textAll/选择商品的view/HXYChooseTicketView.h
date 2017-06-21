//
//  HXYChooseTicketView.h
//  manmanda
//
//  Created by liangqi on 17/5/6.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HXYChooseTicketViewDelegate;

@interface HXYChooseTicketView : UIView
@property (nonatomic, assign) NSInteger cnt;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) id<HXYChooseTicketViewDelegate>delegate;
@end

@protocol HXYChooseTicketViewDelegate <NSObject>

- (void)deleteViewAtIndexPath:(NSIndexPath *)indexPath;

@end
