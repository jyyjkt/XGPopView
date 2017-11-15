//
//  UIView+Add.h
//  iOS_Architecture
//
//  Created by weifan on 2017/4/11.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import <UIKit/UIKit.h>

//根据当前屏幕frame
#define SCREENBOUNDS  [UIScreen mainScreen].bounds
//根据当前屏幕的宽度 返回相应的宽度   iphone6
#define SCREENWIDTH(x)  CGRectGetWidth([UIScreen mainScreen].bounds) * (x) / 375.0f
//根据当前屏幕的宽度 返回相应的高度
#define SCREENHEIGHT(y)    CGRectGetHeight([UIScreen mainScreen].bounds) * (y) / 667.0f
//屏幕大小
#define kScreenBounds [UIScreen mainScreen].bounds
//屏幕宽
#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width
//屏幕高
#define kMainScreenHeight [UIScreen mainScreen].bounds.size.height

//设置颜色
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(rgbValue,al) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(al)]


@interface UIView (Add)
/** 获取视图的视图控制器 */
@property (nullable, nonatomic, readonly) UIViewController *viewController;

/** frame.origin.x */
@property (nonatomic) CGFloat yj_left;
/** frame.origin.y */
@property (nonatomic) CGFloat yj_top;
/** frame.origin.x + frame.size.width */
@property (nonatomic) CGFloat yj_right;
/** frame.origin.y + frame.size.height */
@property (nonatomic) CGFloat yj_bottom;
/** frame.size.width */
@property (nonatomic) CGFloat yj_width;
/** frame.size.height */
@property (nonatomic) CGFloat yj_height;
/** center.x */
@property (nonatomic) CGFloat yj_centerX;
/** center.y */
@property (nonatomic) CGFloat yj_centerY;
/** frame.origin */
@property (nonatomic) CGPoint yj_origin;
/** frame.size */
@property (nonatomic) CGSize  yj_size;
//清空所有子view
- (void)removeAllSubviews;

@end
