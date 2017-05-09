//
//  XGAlertAnimationProtocol.m
//  XGPopView
//
//  Created by weifan on 2017/5/3.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "XGAlertAnimationProtocol.h"


#pragma mark - XGAlertAnimation

@implementation XGAlertAnimation
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

@implementation XGAlertView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor yellowColor]];
    }
    return self;
}

@end
