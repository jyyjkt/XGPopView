//
//  XGPopView.m
//  XGPopView
//
//  Created by weifan on 2017/5/3.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "XGPopView.h"

#define DefultAnimationStr @"GraduallyShowAnimation"
#define DefultAlertViewStr @"XGTextAlertView"

@interface XGPopView ()<UIGestureRecognizerDelegate>

@end

@implementation XGPopView

+ (instancetype)showPopViewAddedTo:(UIView *)view animationStr:(NSString *)animationStr alertViewStr:(NSString *)alertViewStr
{
    XGPopView *popView = [[self alloc]initWithView:view animationStr:animationStr alertViewStr:alertViewStr];
    [view addSubview:popView];
    
    return popView;
}

+ (XGPopView *)PopViewForView:(UIView *)view{
    
    XGPopView *popView = [[self alloc]initWithView:view];
    [view addSubview:popView];
    
    return popView;
}

+ (BOOL)hidePopViewForView:(UIView *)view animationStr:(NSString *)animationStr
{
    XGPopView *popView = [self FindPopViewForView:view];

    if (popView != nil) {
        
        [popView hideAnimated];
        return YES;
    }
    return NO;
}

+ (XGPopView *)FindPopViewForView:(UIView *)view
{
    NSEnumerator *subviewsEnumerator = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnumerator) {
        if ([subview isKindOfClass:self]) {
            return (XGPopView *)subview;
        }
    }
    return nil;
}

#pragma mark - 生命周期

- (id)initWithView:(UIView *)view animationStr:(NSString *)animationStr alertViewStr:(NSString *)alertViewStr
{
    NSAssert(view, @"view不能为空");
    [self eidtWithAnimationStr:animationStr alertViewStr:animationStr];
    
    return [self initWithFrame:view.bounds];
}

- (id)initWithView:(UIView *)view{
    NSAssert(view, @"view不能为空");
    
    _animation = [[NSClassFromString(DefultAnimationStr) class]new];
    _alertView = [[NSClassFromString(DefultAlertViewStr) class]new];

    
    return [self initWithFrame:view.bounds];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self commonInit];
    }
    return self;
}

- (void)dealloc{
    
}

#pragma mark - 初始化属性 和 编辑UI
- (void)eidtWithAnimationStr:(NSString *)animationStr alertViewStr:(NSString *)alertViewStr{
    
    if (animationStr.length > 0
        && [[NSClassFromString(animationStr) class] isKindOfClass:[XGAlertAnimation class]]) {
        
        _animation = [[NSClassFromString(animationStr) class] new];
    }else{
        
        _animation = [[NSClassFromString(DefultAnimationStr) class]new];
    }
    
    if (alertViewStr.length > 0
        && [[NSClassFromString(alertViewStr) class] isKindOfClass:[XGAlertView class]]) {
        
        _alertView = [[NSClassFromString(alertViewStr) class] new];
    }else{
        
        _alertView = [[NSClassFromString(DefultAlertViewStr) class] new];
    }
}

- (void)commonInit{
    
    if (_alertView != nil) {
        [self addSubview:_alertView];
    }
    
    UITapGestureRecognizer *popViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(popViewTouchAction:)];
    [self addGestureRecognizer:popViewTap];
    popViewTap.delegate = self;
    
    
    self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
}

#pragma mark - Show & Hidden
     
- (void)showAnimated{
    
    if (self.animation != nil && self != nil) {
        
        [self.animation showAnimationForView:self];
        if (_delegate && [_delegate respondsToSelector:@selector(showAnimationFinishedForView:)]) {
            [_delegate showAnimationFinishedForView:self];
        }
    }else{
        return;
    }
    
}

- (void)hideAnimated{
    
    if (self.animation != nil && self != nil) {
        [self.animation hiddenAnimationForView:self];
        if (_delegate && [_delegate respondsToSelector:@selector(hiddenAnimationFinshedForView:)]) {
            [_delegate hiddenAnimationFinshedForView:self];
            [self removeFromSuperview];
        }
    }else{
        return;
    }
}

#pragma mark - 属性



#pragma mark - Delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    /* 将子视图的tap手势屏蔽 */
    if ([[touch.view class] isSubclassOfClass:[XGAlertView class]]) {
        return NO;
    }
    
    return YES;

}

#pragma mark - 点击实现
- (void)popViewTouchAction:(UITapGestureRecognizer *)sender{
    
    [self hideAnimated];
}


@end
