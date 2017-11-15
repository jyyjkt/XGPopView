//
//  UIView+Add.m
//  iOS_Architecture
//
//  Created by weifan on 2017/4/11.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "UIView+Add.h"

@implementation UIView (Add)


- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (CGFloat)yj_left {
    return self.frame.origin.x;
}

- (void)setYj_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)yj_top {
    return self.frame.origin.y;
}

- (void)setYj_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)yj_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setYj_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)yj_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setYj_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)yj_width {
    return self.frame.size.width;
}

- (void)setYj_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)yj_height {
    return self.frame.size.height;
}

- (void)setYj_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)yj_centerX {
    return self.center.x;
}

- (void)setYj_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)yj_centerY {
    return self.center.y;
}

- (void)setYj_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)yj_origin {
    return self.frame.origin;
}

- (void)setYj_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)yj_size {
    return self.frame.size;
}

- (void)setYj_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)removeAllSubviews {
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
}

@end
