//
//  SexButton.h
//  GHYJ
//
//  Created by weifan on 2017/8/10.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UIView+Add.h"

@class EditSexButton;
@protocol SexButtonDelegate <NSObject>

- (void)touchSexButtonAction:(EditSexButton *)button;

@end

@interface EditSexButton : UIView

- (instancetype)initWithFrame:(CGRect)frame imageNormalStr:(NSString *)imageNormalStr imageSelectStr:(NSString *)imageSelectStr;

@property (strong, nonatomic) UIImageView * imageView;

@property (strong, nonatomic) UILabel *titleLabel;

@property (assign, nonatomic) BOOL isSelect;

@property (assign, nonatomic) id<SexButtonDelegate> delegate;

@end
