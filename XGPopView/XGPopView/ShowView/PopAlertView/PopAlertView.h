//
//  XGTextAlertView.h
//  XGPopView
//
//  Created by weifan on 2017/5/8.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PopView.h"

#define kPopAlertView @"PopAlertView"

@protocol PopAlertViewDelegate <AlertViewProtocol>
#pragma mark - 私有代理


@end

@interface PopAlertView : AlertView

@property (assign, nonatomic) id<PopAlertViewDelegate> delegate;

@end
