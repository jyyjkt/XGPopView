//
//  EditSexView.h
//  GHYJ
//
//  Created by weifan on 2017/9/5.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "PopView.h"
#import "EditSexButton.h"

@class EditSexView;

#define kEditSexView @"EditSexView"

typedef NS_ENUM(NSUInteger, EditSexViewType) {
    EditSexViewTypeCancle,
    EditSexViewTypeSure,
};

@protocol EditSexViewDelegate <AlertViewProtocol>

- (void)editSexButtonType:(EditSexViewType)type popView:(EditSexView *)popView;

@end

@interface EditSexView : AlertView


@property (nonatomic, assign) id<EditSexViewDelegate>delegate;

@property (nonatomic, copy) NSString *histroySex;

@property (nonatomic, copy) NSString *selectSex;

@property (nonatomic, strong)UIView *contenView;
@property (nonatomic, strong)UILabel *tipLabel;
@property (nonatomic, strong)EditSexButton *manImageButton;
@property (nonatomic, strong)EditSexButton *womanImageButton;

@property (nonatomic, strong)UIButton *cancleButton;
@property (nonatomic, strong)UIButton *sureButton;

@end
