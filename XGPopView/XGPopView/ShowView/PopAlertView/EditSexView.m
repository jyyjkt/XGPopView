//
//  EditSexView.m
//  GHYJ
//
//  Created by weifan on 2017/9/5.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "EditSexView.h"
#import "UIView+Add.h"

@interface EditSexView ()<SexButtonDelegate>


@end

@implementation EditSexView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
        
    }
    return self;
}

- (void)setHistroySex:(NSString *)histroySex{
    _histroySex = histroySex;
    _selectSex = histroySex;
    
    if ([histroySex isEqualToString:@"男"]) {
        _manImageButton.isSelect = YES;
        _womanImageButton.isSelect = NO;
    }else{
        _manImageButton.isSelect = NO;
        _womanImageButton.isSelect = YES;

    }
    
}

- (void)setupUI{
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    self.frame = CGRectMake(12, 0, kMainScreenWidth - 24, SCREENHEIGHT(224));
    self.center = CGPointMake(self.center.x, kMainScreenHeight / 2);
    [self setBackgroundColor:UIColorFromRGB(0xcccccc)];
    
    UIView *contenView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, SCREENHEIGHT(224-47)-1)];
    [self addSubview:contenView];
    [contenView setBackgroundColor:UIColorFromRGB(0xffffff)];
    _contenView = contenView;
    
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(18, 18,100, 18)];
    [_contenView addSubview:tipLabel];
    tipLabel.text = @"编辑性别";
    tipLabel.textColor = UIColorFromRGB(0x606060);
    tipLabel.font = [UIFont systemFontOfSize:17];
    _tipLabel = tipLabel;
    
    EditSexButton *manImageButton = [[EditSexButton alloc]initWithFrame:CGRectMake(92, 70, 42, 72) imageNormalStr:@"Mine_InfomationManNormal" imageSelectStr:@"Mine_InfomationMan"];
    manImageButton.titleLabel.text = @"男";
    manImageButton.isSelect = YES;
    manImageButton.delegate = self;
    [_contenView addSubview:manImageButton];
    _manImageButton = manImageButton;
    
    EditSexButton *womanImageButton = [[EditSexButton alloc]initWithFrame:CGRectMake(self.contenView.frame.size.width - 42 - 82, 70, 42, 72) imageNormalStr:@"Mine_InfomationWomanNormal" imageSelectStr:@"Mine_InfomationWoman"];
    womanImageButton.titleLabel.text = @"女";
    womanImageButton.isSelect = NO;
    womanImageButton.delegate = self;
    [_contenView addSubview:womanImageButton];
    _womanImageButton = womanImageButton;
    
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:cancleButton];
    [cancleButton setBackgroundColor:[UIColor whiteColor]];
    cancleButton.frame = CGRectMake(0, self.contenView.frame.origin.y + self.contenView.frame.size.height +1, self.frame.size.width/2 - 0.5, SCREENHEIGHT(47));
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton setTitleColor:UIColorFromRGB(0x999999) forState:UIControlStateNormal];
    cancleButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [cancleButton addTarget:self action:@selector(cancleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _cancleButton = cancleButton;
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:sureButton];
    [sureButton setBackgroundColor:[UIColor whiteColor]];
    sureButton.frame = CGRectMake(self.yj_width/2 + 1, self.contenView.yj_bottom +1, self.yj_width/2 - 0.5, SCREENHEIGHT(47));
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [sureButton setTitleColor:UIColorFromRGB(0x17c35c) forState:UIControlStateNormal];
    sureButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [sureButton addTarget:self action:@selector(sureButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _sureButton = sureButton;
}

#pragma mark - 事件实现

- (void)cancleButtonAction:(UIButton *)sender{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(editSexButtonType:popView:)]) {
        [self.delegate editSexButtonType:EditSexViewTypeCancle popView:self];
    }
}

- (void)sureButtonAction:(UIButton *)sender{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(editSexButtonType:popView:)]) {
        [self.delegate editSexButtonType:EditSexViewTypeSure popView:self];
    }
}

#pragma mark - EditSexViewDelegate
- (void)touchSexButtonAction:(EditSexButton *)button{
    if ([button isEqual:_manImageButton]) {
        _manImageButton.isSelect = YES;
        _womanImageButton.isSelect = NO;
        _selectSex = @"男";
    }else{
        _manImageButton.isSelect = NO;
        _womanImageButton.isSelect = YES;
        _selectSex = @"女";
    }
    
}



@end
