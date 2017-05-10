//
//  XGTextAlertView.m
//  XGPopView
//
//  Created by weifan on 2017/5/8.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "XGTextAlertView.h"

@implementation XGTextAlertView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 150, [UIScreen mainScreen].bounds.size.height/2 - 150, 300, 300);
        [self setBackgroundColor:[UIColor yellowColor]];
    }
    return self;
}



@end
