//
//  PopHomeView.m
//  GHYJ
//
//  Created by cyan on 2017/8/8.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import "PopHomeView.h"
#import "UIView+Add.h"

@implementation PopHomeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - SCREENWIDTH(300)/2.0, [UIScreen mainScreen].bounds.size.height/2 - SCREENWIDTH(300)/2.0, SCREENWIDTH(300) , SCREENWIDTH(300));
        
        [self creatUI];
    }
    return self;
}

-(void)creatUI{
    [self setBackgroundColor:[UIColor whiteColor]];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREENWIDTH(300) - SCREENWIDTH(88))/2.0, SCREENWIDTH(65), SCREENWIDTH(88), SCREENWIDTH(88))];
    imageView.image = [UIImage imageNamed:@"Home_Wait"];
    [self addSubview:imageView];

    UILabel *label  = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREENWIDTH(88) +SCREENWIDTH(65) + 32, SCREENWIDTH(300), 25)];
    label.text = @"敬请期待!";
    label.textColor = UIColorFromRGB(0x323232);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:22];
    [self addSubview:label];
    
    UILabel *label2  = [[UILabel alloc]initWithFrame:CGRectMake(0, label.frame.origin.y + label.frame.size.height + 5, SCREENWIDTH(300), 20)];
    label2.text = @"天气这么热，不如来根冰棍解解暑吧";
    label2.textColor =  UIColorFromRGB(0x646464);
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:14.5];
    [self addSubview:label2];

}
@end
