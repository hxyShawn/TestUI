//
//  HXYCustomButton.h
//  manmanda
//
//  Created by liangqi on 17/5/31.
//  Copyright © 2017年 nixinyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXYCustomButton : UIButton
/** 图片尺寸,传入0则为图片默认尺寸 */
@property(nonatomic, assign) CGSize imageViewSize;
/** 标签尺寸，传入0则为标签默认尺寸 */
@property(nonatomic, assign) CGSize titleLabelSize;
/** 图片和标签之间的间隙 */
@property(nonatomic, assign) CGFloat space;

@property (nonatomic, copy) NSString *imgName;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *text;
@end
