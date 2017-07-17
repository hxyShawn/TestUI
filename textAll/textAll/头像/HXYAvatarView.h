//
//  HXYAvatarView.h
//  manmanda
//
//  Created by liangqi on 17/3/20.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HXYAvatarViewDelegate;
@interface HXYAvatarView : UIView

@property (nonatomic, assign) CGSize  vSize;
@property (nonatomic, assign) NSInteger  userId;
@property (nonatomic, assign) id<HXYAvatarViewDelegate>delegate;

- (void)setWithUrlStr:(NSString *)urlStr isV:(NSInteger )isV;
@end

@protocol HXYAvatarViewDelegate <NSObject>

- (void)HXYAvatarView:(HXYAvatarView *)avatarView didSelectAvatarView:(NSInteger)userId;

@end
