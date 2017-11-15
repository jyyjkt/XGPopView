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

#import "PopHomeView.h"
#import "EditSexView.h"

@interface ViewController ()<PopViewDelegate,EditSexViewDelegate>
- (IBAction)button1Action:(id)sender;
- (IBAction)button2Action:(id)sender;
- (IBAction)button3Action:(id)sender;
- (IBAction)button4Action:(id)sender;
- (IBAction)button5Action:(id)sender;
- (IBAction)button6Action:(id)sender;

@property (strong, nonatomic)PopView * popView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAnimationFinishedForView:(PopView *)popView{
   
    NSLog(@"显示动画结束--------");
}

- (void)hiddenAnimationFinshedForView:(PopView *)popView{
     NSLog(@"隐藏动画结束--------");
}

- (IBAction)button1Action:(id)sender {
    
    PopView *popView = [PopView showPopViewAddedTo:self.view animationStr:kGraduallyShowAnimation alertViewStr:kPopAlertView];
    popView.delegate = self;
    PopAlertView * popAlertView = (PopAlertView *)popView.alertView;
    NSLog(@"%@",popAlertView);
    GraduallyShowAnimation *graduallyShowAnimation = (GraduallyShowAnimation *)popView.animation;
    NSLog(@"%@",graduallyShowAnimation);
    popView.isBackReturn = YES;
    
}

- (IBAction)button2Action:(id)sender {
    
    PopView *popView = [PopView showPopViewAddedTo:self.view alertViewStr:kPopHomeView];
    popView.delegate = self;
    PopAlertView * popAlertView = (PopAlertView *)popView.alertView;
    NSLog(@"%@",popAlertView);
    GraduallyShowAnimation *graduallyShowAnimation = (GraduallyShowAnimation *)popView.animation;
    NSLog(@"%@",graduallyShowAnimation);
    popView.isBackReturn = YES;

}

- (IBAction)button3Action:(id)sender {
    
    PopView *popView = [PopView showPopViewAddedTo:[UIApplication sharedApplication].keyWindow animationStr:kGraduallyShowAnimation alertViewStr:kEditSexView];
    _popView = popView;
    EditSexView *sexView = (EditSexView *)popView.alertView;
    sexView.histroySex = @"男";
    sexView.delegate = self;
    [popView showAnimated];
}

#pragma mark - EditSexViewDelegate
- (void)editSexButtonType:(EditSexViewType)type popView:(EditSexView *)popView{
    if (type == EditSexViewTypeCancle) {
        
    }else{
       
    }
    [_popView hideAnimated];
}


- (IBAction)button4Action:(id)sender {
}

- (IBAction)button5Action:(id)sender {
}

- (IBAction)button6Action:(id)sender {
}
@end
