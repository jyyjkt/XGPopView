//
//  XGAlertAnimationProtocol.h
//  XGPopView
//
//  Created by weifan on 2017/5/3.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class XGPopView;
@class XGAlertView;

#define Scale @"transform.scale"
#define Rotation @"transform.rotation"
#define KeyFrame @"contents"
#define PositionY @"position.y"
#define OPacity @"opacity"

#pragma mark - 动画协议
typedef void (^XGAnimationFinished)(BOOL isFinished);

@protocol XGAlertAnimationProtocol <NSObject>
@optional
/** 显示动画 */
- (void)showAnimationForView:(XGPopView *)view animateFinished:(XGAnimationFinished)animateFinished;
/** 隐藏动画 */
- (void)hiddenAnimationForView:(XGPopView *)view animateFinished:(XGAnimationFinished)animateFinished;
@end

#pragma mark - 动画
@interface XGAlertAnimation: NSObject<XGAlertAnimationProtocol>

/** 动画时长 */
@property (nonatomic, assign) float duration;

/** PopView背景颜色 */
@property (nonatomic, strong) UIColor *popViewBGColor;

/** Alert背景颜色 */
@property (nonatomic, strong) UIColor *alertBGColor;


@end

#pragma mark - 提示协议
@protocol XGAlertViewProtocol <NSObject>
@optional
/** 显示动画 */
- (void)showAnimationForView:(XGAlertView *)view;

/** 隐藏动画 */
- (void)hiddenAnimationForView:(XGAlertView *)view;

@end

#pragma mark - 提示View
@interface XGAlertView : UIView


@end

