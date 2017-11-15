//
//  PopView.m
//  GHYJ
//
//  Created by weifan on 2017/8/7.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "PopView.h"

#define DefultAnimationStr @"GraduallyShowAnimation"
#define DefultAlertViewStr @"PopAlertView"

@interface PopView ()<UIGestureRecognizerDelegate>{
    NSString *_alertViewStr;
    NSString *_animationStr;
}

@end

@implementation PopView

- (void)dealloc{
    
}

+ (PopView *)showPopViewAddedTo:(UIView *)view animationStr:(NSString *)animationStr alertViewStr:(NSString *)alertViewStr
{
    PopView *popView = [[self alloc]initWithView:view animationStr:animationStr alertViewStr:alertViewStr];
    [view addSubview:popView];
    
    return popView;
}

+ (PopView *)showPopViewAddedTo:(UIView *)view alertViewStr:(NSString *)alertViewStr{
    PopView *popView = [[self alloc]initWithView:view alertViewStr:alertViewStr];
    [view addSubview:popView];
    return popView;
}

+ (PopView *)PopViewForView:(UIView *)view{
    
    PopView *popView = [[self alloc]initWithView:view];
    [view addSubview:popView];
    
    return popView;
}

+ (BOOL)hidePopViewForView:(UIView *)view animationStr:(NSString *)animationStr
{
    PopView *popView = [self FindPopViewForView:view];
    
    if (popView != nil) {
        
        [popView hideAnimated];
        return YES;
    }
    return NO;
}

+ (PopView *)FindPopViewForView:(UIView *)view
{
    NSEnumerator *subviewsEnumerator = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnumerator) {
        if ([subview isKindOfClass:self]) {
            return (PopView *)subview;
        }
    }
    return nil;
}

#pragma mark - 生命周期

- (id)initWithView:(UIView *)view animationStr:(NSString *)animationStr alertViewStr:(NSString *)alertViewStr
{
    NSAssert(view, @"view不能为空");
    [self eidtWithAnimationStr:animationStr alertViewStr:alertViewStr];
    
    return [self initWithFrame:view.bounds];
}

- (id)initWithView:(UIView *)view alertViewStr:(NSString *)alertViewStr{
    NSAssert(view, @"view不能为空");
    [self eidtWithAnimationStr:nil alertViewStr:alertViewStr];
    return [self initWithFrame:view.bounds];
    
}

- (id)initWithView:(UIView *)view{
    NSAssert(view, @"view不能为空");
    [self eidtWithAnimationStr:nil alertViewStr:nil];
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

#pragma mark - 初始化属性 和 编辑UI
- (void)eidtWithAnimationStr:(NSString *)animationStr alertViewStr:(NSString *)alertViewStr{
    
    _alertViewStr = alertViewStr;
    _animationStr = animationStr;
    
    if ((animationStr.length > 0
         && [[NSClassFromString(animationStr) class] isSubclassOfClass:[AlertAnimation class]])
        || (animationStr.length > 0 &&[[NSClassFromString(animationStr) class] isKindOfClass:[AlertAnimation class]])) {
        
        _animation = [[NSClassFromString(animationStr) class] new];
    }else{
        
        _animation = [[NSClassFromString(DefultAnimationStr) class]new];
    }
    
    if ((alertViewStr.length > 0
         && [[NSClassFromString(alertViewStr) class] isSubclassOfClass:[AlertView class]])
        || (alertViewStr.length > 0 &&[[NSClassFromString(alertViewStr) class] isKindOfClass:[AlertView class]])) {
        
        _alertView = [[NSClassFromString(alertViewStr) class] new];
    }else{
        
        _alertView = [[NSClassFromString(DefultAlertViewStr) class] new];
    }
}

- (void)commonInit{
    
    self.isBackReturn = YES;
    
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
        
        __weak __typeof(self)weakSelf = self;
        [self.animation showAnimationForView:self animateFinished:^(BOOL    isFinished) {
            
            if (weakSelf.delegate
                && [weakSelf.delegate respondsToSelector:@selector(showAnimationFinishedForView:)]
                && isFinished) {
                [weakSelf.delegate showAnimationFinishedForView:self];
            }
            
        }];
    }else{
        return;
    }
    
}

- (void)hideAnimated{
    
    if (self.animation != nil && self != nil) {
        __weak __typeof(self)weakSelf = self;
        [self.animation hiddenAnimationForView:self animateFinished:^(BOOL isFinished) {
            
            if (weakSelf.delegate
                && [weakSelf.delegate respondsToSelector:@selector(hiddenAnimationFinshed)]
                && isFinished) {
                [weakSelf.delegate hiddenAnimationFinshed];
            }
            
        }];
    }else{
        return;
    }
}

#pragma mark - 属性

- (void)setAnimation:(AlertAnimation *)animation{
    
    _animation = animation;
    
}

- (void)setAlertView:(AlertView *)alertView{
    
    _alertView = alertView;
}

#pragma mark - Delegate

/**
 *  UIGestureRecognizerDelegate
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    AlertView * alertView = _alertView;
    for (UIView *view in alertView.subviews) {
        if ([view isEqual:touch.view]) {
            return NO;
        }
    }

    /* 将子视图的tap手势屏蔽 */
    if ([[touch.view class] isSubclassOfClass:[AlertView class]]) {
        return NO;
    }
    
    return YES;
    
}

#pragma mark - 点击实现
- (void)popViewTouchAction:(UITapGestureRecognizer *)sender{
    //点击alterview视图不取消视图
    CGPoint point = [sender locationInView:_alertView];
    BOOL isContain =   CGRectContainsPoint(_alertView.bounds, point);
    if (isContain) {
        return;
    }
    if (self.isBackReturn) {
        [self hideAnimated];
    }else{
        
    }
}

@end


#pragma mark - AlertAnimation

@implementation AlertAnimation

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

/**
 * 协议
 */
- (void)showAnimationForView:(UIView *)view{
    
    NSLog(@"父类实现-显示动画");
    
}

- (void)hiddenAnimationForView:(UIView *)view{
    
    NSLog(@"父类实现-隐藏动画");
}

@end

#pragma mark - AlertView

@implementation AlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

@end
