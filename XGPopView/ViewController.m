//
//  ViewController.m
//  XGPopView
//
//  Created by weifan on 2017/5/3.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "ViewController.h"
#import "PopView.h"
#import "PopAlertView.h"
#import "GraduallyShowAnimation.h"
#import <objc/runtime.h>

@interface ViewController ()<PopViewDelegate>

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
    
    PopView *popView = [PopView showPopViewAddedTo:self.view animationStr:kGraduallyShowAnimation alertViewStr:kPopAlertView];
    PopAlertView * popAlertView = (PopAlertView *)popView.alertView;
    GraduallyShowAnimation *graduallyShowAnimation = (GraduallyShowAnimation *)popView.animation;
    
    

}

- (void)showAnimationFinishedForView:(PopView *)popView{
   
    NSLog(@"显示动画结束--------");
}

- (void)hiddenAnimationFinshed{
     NSLog(@"隐藏动画结束--------");
}

@end
