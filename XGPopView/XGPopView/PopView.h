//
//  PopView.h
//  GHYJ
//
//  Created by weifan on 2017/8/7.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class PopView;
@class AlertAnimation;
@class AlertView;

#pragma mark - 弹出视图协议

@protocol PopViewDelegate <NSObject>
@optional

/**
 显示动画结束动画

 @param popView 显示视图
 */
- (void)showAnimationFinishedForView:(PopView *)popView;

/**
 隐藏动画结束方法
 */
- (void)hiddenAnimationFinshedForView:(PopView *)popView;;

@end

#pragma mark - 弹出View
@interface PopView : UIView

/**
 添加弹出视图

 @param view 父视图
 @param animationStr 动画字符串
 @param alertViewStr 弹出视图字符串
 @return 返回初始化
 */
+ (PopView *)showPopViewAddedTo:(UIView *)view animationStr:(NSString *)animationStr alertViewStr:(NSString *)alertViewStr;

/**
 默认动画弹出视图

 @param view 父视图
 @param alertViewStr 弹出视图字符串
 @return 返回初始化
 */
+ (PopView *)showPopViewAddedTo:(UIView *)view alertViewStr:(NSString *)alertViewStr;

/**
 默认弹出视图

 @param view 父视图
 @return 返回弹出视图
 */
+ (PopView *)PopViewForView:(UIView *)view;

/**
 隐藏视图

 @param view 父视图
 @param animationStr 动画字符串
 @return 隐藏结果
 */
+ (BOOL)hidePopViewForView:(UIView *)view animationStr:(NSString *)animationStr;

/**
 寻找弹出视图

 @param view 父视图
 @return 取得PopView
 */
+ (PopView *)FindPopViewForView:(UIView *)view;

/**
 初始化

 @param view 父视图
 @param animationStr 动画字符串
 @param alertViewStr 弹出视图
 @return 初始化
 */
- (id)initWithView:(UIView *)view animationStr:(NSString *)animationStr alertViewStr:(NSString *)alertViewStr;

/**
 初始化

 @param view 父视图
 @return 初始化
 */
- (id)initWithView:(UIView *)view;

/**弹出视图*/
- (void)showAnimated;
/**隐藏视图*/
- (void)hideAnimated;

/** 动画 */
@property (strong, nonatomic)AlertAnimation *animation;
/** 提示View */
@property (strong, nonatomic)AlertView *alertView;
/** 代理 */
@property (assign, nonatomic) id<PopViewDelegate> delegate;
/** 是否点击背景隐藏 */
@property (assign, nonatomic)BOOL isBackReturn;

@end


#pragma mark - 动画协议
typedef void (^AnimationFinished)(BOOL isFinished);

@protocol AlertAnimationProtocol <NSObject>

@optional

/** 显示动画 */
- (void)showAnimationForView:(PopView *)view animateFinished:(AnimationFinished)animateFinished;
/** 隐藏动画 */
- (void)hiddenAnimationForView:(PopView *)view animateFinished:(AnimationFinished)animateFinished;

@end

#pragma mark - 动画
@interface AlertAnimation: NSObject<AlertAnimationProtocol>

/** 动画时长 */
@property (nonatomic, assign) float duration;

@end

#pragma mark - 提示协议
@protocol AlertViewProtocol <NSObject>
@optional
/** 显示动画 */
- (void)showAnimationForView:(AlertView *)view;

/** 隐藏动画 */
- (void)hiddenAnimationForView:(AlertView *)view;

@end

#pragma mark - 提示View
@interface AlertView : UIView<AlertViewProtocol>


@end
