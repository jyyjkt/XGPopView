//
//  XGDataPickerView.h
//  XGPopView
//
//  Created by weifan on 2017/5/31.
//  Copyright © 2017年 xiaoguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDate+YU.h"
#import "YUDateConfig.h"

typedef NS_ENUM(NSInteger, XGUIDatePickerMode) {
    XGUIDatePickerModeTime,            // 上午/下午 时 分
    XGUIDatePickerModeDate,            // 年 月 日
    XGUIDatePickerModeDateAndTime,     // 月 星期 上午/下午 时 分
    XGUIDatePickerModeCountDownTimer,  // 时 分
    XGUIDatePickerModeYYYYMMDDHHmm,    // 年 月 日 时 分
    XGUIDatePickerModeYYYYMMAndDDHHmm, // 年 月日 时 分
};


@interface XGDataPickerView : UIControl

@property (nonatomic) XGUIDatePickerMode datePickerMode; // 默认 XGUIDatePickerModeDateAndTime

@property (nonatomic, retain) NSLocale   *locale;   // default is [NSLocale currentLocale]. setting nil returns to default

@property (nonatomic, copy)   NSCalendar *calendar; // default is [NSCalendar currentCalendar]. setting nil returns to default

@property (nonatomic, retain) NSTimeZone *timeZone; // default is nil. use current time zone or time zone from calendar

@property (nonatomic, retain) NSDate *date;        // default is current date when picker created. Ignored in countdown timer mode. for that mode, picker starts at 0:00
@property (nonatomic, readonly) NSString *dateStr;//return current date Formatter yyyy-MM-dd HH:mm:ss

@property (nonatomic, retain) NSDate *minimumDate; // specify min/max date range. default is nil. When min > max, the values are ignored. Ignored in countdown timer mode
@property (nonatomic, retain) NSDate *maximumDate; // default is nil


@property (nonatomic) NSTimeInterval countDownDuration; // for UIDatePickerModeCountDownTimer, ignored otherwise. default is 0.0. limit is 23:59 (86,399 seconds). value being set is div 60 (drops remaining seconds).
@property (nonatomic) NSInteger      minuteInterval;    // display minutes wheel with interval. interval must be evenly divided into 60. default is 1. min is 1, max is 30
- (void)setDate:(NSDate *)date animated:(BOOL)animated; // if animated is YES, animate the wheels of time to display the new date

@property (nonatomic, assign) BOOL showToolbar;

@end
