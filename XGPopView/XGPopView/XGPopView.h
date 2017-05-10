//
//  XGPopView.h
//  XGPopView
//
//  Created by weifan on 2017/5/3.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XGAlertAnimationProtocol.h"

@class XGPopView;

@protocol XGPopVeiwDelegate <NSObject>
@optional

- (void)showAnimationFinishedForView:(XGPopView *)popView;

- (void)hiddenAnimationFinshed;

@end

@interface XGPopView : UIView

+ (instancetype)showPopViewAddedTo:(UIView *)view animationStr:(NSString *)animationStr alertViewStr:(NSString *)alertViewStr;

+ (XGPopView *)PopViewForView:(UIView *)view;

+ (BOOL)hidePopViewForView:(UIView *)view animationStr:(NSString *)animationStr;

+ (XGPopView *)FindPopViewForView:(UIView *)view;

- (id)initWithView:(UIView *)view animationStr:(NSString *)animationStr alertViewStr:(NSString *)alertViewStr;

- (id)initWithView:(UIView *)view;

- (void)showAnimated;
- (void)hideAnimated;


@property (strong, nonatomic)XGAlertAnimation *animation;

@property (strong, nonatomic)XGAlertView *alertView;

@property (assign, nonatomic) id<XGPopVeiwDelegate> delegate;

@end
