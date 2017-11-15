//
//  XGTextAlertView.m
//  XGPopView
//
//  Created by weifan on 2017/5/8.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "PopAlertView.h"

@interface PopAlertView ()<UITableViewDelegate,UITableViewDataSource>


@end


@implementation PopAlertView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 150, [UIScreen mainScreen].bounds.size.height/2 - 300, 300, 600);
        [self setBackgroundColor:[UIColor yellowColor]];
        
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI{
    
    UIView * showView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,50 , 100)];
    [self addSubview:showView];
    [showView setBackgroundColor:[UIColor redColor]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [showView addGestureRecognizer:tap];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button];
    button.frame = CGRectMake(60, 0, 50, 100);
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"测试" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(120, 0, 50, 100)];
    [self addSubview:bgView];
    UIButton *bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [bgView addSubview:bgButton];
    bgButton.frame = CGRectMake(0, 0, 50, 100);
    [bgButton setBackgroundColor:[UIColor blueColor]];
    [bgButton setTitle:@"测试2" forState:UIControlStateNormal];
    [bgButton addTarget:self action:@selector(bgButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, 300, 500) style:UITableViewStyleGrouped];
    [self addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"headerView"];
    
}

#pragma mark -  UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"测试";
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"输出tableView的选择");
}

#pragma mark - 私有方法
- (void)buttonAction:(id)sender{
    NSLog(@"输出按钮实现");
}

- (void)bgButtonAction:(id)sender{
    NSLog(@"输出背景按钮实现");
}

- (void)tapAction:(id)sender{
    NSLog(@"输出手势点击事件");
}



@end
