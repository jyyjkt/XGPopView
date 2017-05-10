//
//  ViewController.m
//  XGPopView
//
//  Created by weifan on 2017/5/3.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "ViewController.h"
#import "XGPopView.h"
#import <objc/runtime.h>
#import "TestShowAnimation.h"
#import "XGTabelAlertView.h"

@interface ViewController ()<XGPopVeiwDelegate>

@property (weak, nonatomic) IBOutlet UIButton *showButton;
- (IBAction)buttonAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonAction:(id)sender {
    
    XGPopView * popView = [XGPopView showPopViewAddedTo:self.view animationStr:@"GraduallyShowAnimation" alertViewStr:@"XGTextAlertView"];
    popView.delegate = self;
    popView.animation = [TestShowAnimation new];
    popView.alertView = [XGTabelAlertView new];
    [popView showAnimated];
    
}

- (void)showAnimationFinishedForView:(XGPopView *)popView{
   
    NSLog(@"显示动画结束--------");
}

- (void)hiddenAnimationFinshed{
     NSLog(@"隐藏动画结束--------");
}

@end
