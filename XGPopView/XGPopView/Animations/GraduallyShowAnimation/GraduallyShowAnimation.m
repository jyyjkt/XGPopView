//
//  GraduallyShowAnimation.m
//  XGPopView
//
//  Created by weifan on 2017/5/8.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "GraduallyShowAnimation.h"

@implementation GraduallyShowAnimation

- (void)showAnimationForView:(XGPopView *)view animateFinished:(XGAnimationFinished)animateFinished
{
    NSLog(@"子动画协议实现-显示动画");
    
    /** 平移动画 */
    view.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        view.alpha = 1;
    } completion:^(BOOL finished) {
        if (finished) {
            animateFinished(finished);
        }
    }];

}

- (void)hiddenAnimationForView:(XGPopView *)view animateFinished:(XGAnimationFinished)animateFinished{
    
   NSLog(@"子动画协议实现-隐藏动画");
    
    view.alpha = 1;
    [UIView animateWithDuration:0.3f animations:^{
      view.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            animateFinished(finished);
            [view removeFromSuperview];
        }
    }];
    

}

#pragma mark - UIKit的基本动画

-(void)positionAnimationForView:(UIView *)view{
    view.transform = CGAffineTransformMakeTranslation(100, 100);
    [UIView animateWithDuration:1.0f animations:^{
        view.transform = CGAffineTransformIdentity;
    }];
}

-(void)scaleAnimationForView:(UIView *)view{
    view.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        view.transform = CGAffineTransformMakeScale(2, 2);
    }];
}

-(void)rotateAnimationForView:(UIView *)view{
    view.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        view.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}

-(void)combinationAnimationForView:(UIView *)view{
    //仿射变换的组合使用
    view.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        CGAffineTransform transform1 = CGAffineTransformMakeRotation(M_PI);
        CGAffineTransform transform2 = CGAffineTransformScale(transform1, 0.5, 0.5);
        view.transform = CGAffineTransformTranslate(transform2, 100, 100);
    }];
}

-(void)invertAnimationForView:(UIView *)view{
    view.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        //矩阵反转
        view.transform = CGAffineTransformInvert(CGAffineTransformMakeScale(2, 2));
    }];
}

@end
