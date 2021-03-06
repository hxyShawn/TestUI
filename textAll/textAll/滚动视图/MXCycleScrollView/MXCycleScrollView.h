//
//  MXCycleScrollView.h
//  MXScrollViewDemo
//
//  Created by msxf on 2017/5/24.
//  Copyright © 2017年 yellow. All rights reserved.
//

/*
 github:https://github.com/iamhmx
 */

#import <UIKit/UIKit.h>
#import "MXCycleScrollViewHeader.h"
#import "HXYPlayMediumView.h"
/**
 图片和文字模型
 */
@interface MXImageModel : NSObject
@property (nonatomic, assign) NSInteger  type;
@property (nonatomic, copy) NSString *media;
@property (copy, nonatomic) NSString *imageUrl;     //imageUrl已经在前面处理过,这里肯定是图片的url
@property (copy, nonatomic) NSString *imageText;
@end

@protocol MXCycleScrollViewDelegate <NSObject>

@optional
- (void)clickImageIndex:(NSInteger)index imgsViews:(NSArray *)imgViews;

- (void)didChooseMedia:(HXYPlayMediumViewType)type mediaUrl:(NSString *)mediaUrl imageUrl:(NSString *)imageUrl;;
@end

typedef void(^MXClickImageHandler)(NSInteger index);

@interface MXCycleScrollView : UIView
//图片&文字内容
@property (strong, nonatomic) NSArray <MXImageModel*>* contents;
//自动滚动间隔时间
@property (assign, nonatomic) CGFloat delay;
@property (weak, nonatomic)   id <MXCycleScrollViewDelegate> delegate;
@property (strong, nonatomic) UIImage *placeholderImage;
@property (copy, nonatomic)   MXClickImageHandler clickHandler;
//是否显示pageControl，默认显示
@property (assign, nonatomic) BOOL hidePageControl;
//pageControl颜色
@property (nonatomic, strong) UIColor *pageIndicatorTintColor;
@property (nonatomic, strong) UIColor *currentPageIndicatorTintColor;
//pageControl圆点大小
@property (assign, nonatomic) CGFloat pageControlDotWidth;
//pageControl圆点间距
@property (assign, nonatomic) CGFloat pageControlDotMargin;
//显示文字
@property (assign, nonatomic) BOOL showText;
//动画类型，默认无动画
@property (assign, nonatomic) MXImageAnimation animationType;
//缩放动画的缩放系数（0~0.9）
@property (assign, nonatomic) CGFloat scaleRatio;

@property (nonatomic, assign,getter=isAutoPlay) BOOL  autoPlay;

@property (nonatomic, assign) NSInteger  maxCount;
/**
 初始化（用于事先不知道图片数据，一般图片数据有网络请求而来，先设置好视图，然后设置contents属性）

 @param frame 位置
 @param delay 自动滚动间隔时间
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame withScrollDelay:(CGFloat)delay;

/**
 初始化（用于事先知道图片数据）

 @param frame 位置
 @param contents 图片地址
 @param delay 自动滚动间隔时间
 @return self
 */
- (instancetype)initWithFrame:(CGRect)frame withContents:(NSArray<MXImageModel*>*)contents andScrollDelay:(CGFloat)delay;

@end
