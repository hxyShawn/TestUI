//
//  HXYPlayMediumView.h
//  manmanda
//
//  Created by liangqi on 17/7/13.
//  Copyright © 2017年 nixinyue. All rights reserved.
//


#import <UIKit/UIKit.h>
@protocol HXYPlayMediumViewDelegate;
typedef NS_ENUM(NSUInteger, HXYPlayMediumViewType) {
    HXYPlayMediumViewTypeVideo,
    HXYPlayMediumViewTypeAudio
};

typedef NS_ENUM(NSUInteger, HXYPlayMediaWay) {
    HXYPlayMediaWayInView,
    HXYPlayMediaWayInController,
    HXYPlayMediaWayInCell,
};

@interface HXYPlayMediumView : UIView
- (instancetype)initWithType:(HXYPlayMediumViewType )type;
@property (nonatomic, assign) HXYPlayMediaWay  playWay;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *mediumUrl;
@property (nonatomic, assign) id<HXYPlayMediumViewDelegate>  delegate;
@end

@protocol HXYPlayMediumViewDelegate <NSObject>

- (void)HXYPlayMediumView:(HXYPlayMediumView *)mediumView play:(HXYPlayMediumViewType )type mediaUrl:(NSString *)mediaUrl imageUrl:(NSString *)imageUrl;

@end
