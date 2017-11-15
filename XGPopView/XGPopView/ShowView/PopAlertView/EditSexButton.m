//
//  SexButton.m
//  GHYJ
//
//  Created by weifan on 2017/8/10.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "EditSexButton.h"


@interface EditSexButton ()
{
    NSString *_imageNormalStr;
    NSString *_imageSelectStr;
}


@end

@implementation EditSexButton

- (instancetype)initWithFrame:(CGRect)frame imageNormalStr:(NSString *)imageNormalStr imageSelectStr:(NSString *)imageSelectStr
{
    self = [super initWithFrame:frame];
    if (self) {
        _isSelect = NO;
        _imageNormalStr = imageNormalStr;
        _imageSelectStr = imageSelectStr;
        
        [self setupUI];
    }
    return self;
}


- (void)setNeedsLayout{
    [super setNeedsLayout];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self layoutUI];
}

- (void)setupUI{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sexButtonAction:)];
    [self addGestureRecognizer:tap];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_imageNormalStr]];
    [self addSubview:imageView];
    _imageView = imageView;
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    [self addSubview:titleLabel];
    titleLabel.textColor = UIColorFromRGB(0x555555);
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel = titleLabel;
    
}

- (void)layoutUI{
    
    __weak __typeof(self)weakSelf = self;
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(0);
        make.top.equalTo(weakSelf.mas_top).offset(0);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.width.mas_equalTo(42);
        make.height.mas_equalTo(42);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left);
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.right.equalTo(weakSelf.mas_right);
        make.top.equalTo(weakSelf.imageView.mas_bottom).offset(14);
        make.height.mas_equalTo(16);
    }];
    
    
}

#pragma mark - getter,setter

- (void)setIsSelect:(BOOL)isSelect{
    
    if (isSelect) {
        _imageView.image = [UIImage imageNamed:_imageSelectStr];
    }else{
        _imageView.image = [UIImage imageNamed:_imageNormalStr];
    }
    _isSelect = isSelect;
}

#pragma mark - 事件实现
- (void)sexButtonAction:(UITapGestureRecognizer *)tap{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(touchSexButtonAction:)]) {
        [self.delegate touchSexButtonAction:self];
    }
    
}


@end
