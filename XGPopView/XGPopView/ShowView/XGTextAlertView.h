//
//  XGTextAlertView.h
//  XGPopView
//
//  Created by weifan on 2017/5/8.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XGAlertAnimationProtocol.h"

@protocol XGTextAlertViewDelegate <XGAlertViewProtocol>
#pragma mark - 私有代理


@end

@interface XGTextAlertView : XGAlertView

@property (assign, nonatomic) id<XGTextAlertViewDelegate> delegate;

@end
