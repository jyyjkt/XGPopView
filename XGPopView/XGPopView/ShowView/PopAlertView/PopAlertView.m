//
//  XGTextAlertView.m
//  XGPopView
//
//  Created by weifan on 2017/5/8.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "PopAlertView.h"

@implementation PopAlertView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 150, [UIScreen mainScreen].bounds.size.height/2 - 300, 300, 600);
        [self setBackgroundColor:[UIColor yellowColor]];
        
    }
    return self;
}





@end
