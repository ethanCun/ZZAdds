//
//  NSDate+ZZAdds.h
//  demo
//
//  Created by Cun ethan on 2019/7/25.
//  Copyright © 2019 Cun ethan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZZAddsConst.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, DateFormatterType)  {
    
    DateFormatterTypeDefault,             //yyyy-MM-dd HH:mm:ss
    DateFormatterTypeDay,                 //yyyy-MM-dd
    DateFormatterTypeHour,                //yyyy-MM-dd HH
    DateFormatterTypeMinute,              //yyyy-MM-dd HH:mm
    DateFormatterTypeMinuteNoYear,        //MM-dd HH:mm
    DateFormatterTypeMonthAndDay,         //MM-dd
    DateFormatterTypeYearOnly,            //yyyy
    DateFormatterTypeMonthOnly,           //MM
    DateFormatterTypeDayOnly,             //dd
    DateFormatterTypeTimeOnly,            //HH:mm:ss
    DateFormatterTypeTimeShortOnly,       //HH:mm
    DateFormatterTypeHourOnly,            //HH
    DateFormatterTypeMinuteOnly,          //mm
    DateFormatterTypeMonthAndDayOfText,   //MM月dd日
    DateFormatterTypeDayOfText            //yyyy年MM月dd日
};

@interface NSDate (ZZAdds)

- (NSInteger)year;
- (NSInteger)month;
- (NSInteger)day;
- (NSInteger)hour;
- (NSInteger)minute;
- (NSInteger)second;

/*
 *获取当前日期当月有多少天
 */
+ (NSInteger)getNumberOfDaysInMonth:(NSDate *)date;

/**
 *  获取当前时间
 */
- (NSString *)currentTime;

/**
 *  将时间戳转换为日期
 */
+ (NSDate *)toDateFromTimestamp:(NSTimeInterval)timestamp;

/**
 *  将日期转换为各种时间格式的字符串
 */
- (NSString *)toStringWithDateFormatterType:(DateFormatterType)dateFormatterType;

/**
 *  将日期转换为特定的格式
 */
- (NSString *)toStringWithDateFormatter:(NSDateFormatter *)dateFormatter;

/**
 *
 *  将字符串转化为指定格式的日期
 *
 *  @param dateString        字符串
 *  @param dateFormatterType 日期格式
 *
 *  @return 日期
 */
+ (NSDate *)toDateWithDateString:(NSString *)dateString withFormatterFype:(DateFormatterType)dateFormatterType;

/**
 *  显示日期格式
 *
 *  @param needDate 需要日期
 *
 *  @return 显示日期格式
 */
+ (NSString *)formatShowDateTime:(NSDate *)needDate;

//2015/08/08
+ (NSString *)formatShowServerDateTime:(NSDate *)needDate;

//MM-SS 月-日
+ (NSString *)formatShowMMSSDateTime:(NSDate *)needDate;

//HHMM 小时:分钟
+ (NSString *)formatShowHHMMDateTime:(NSDate *)needDate;

//两个日期之间的秒数
+ (NSInteger)timeIntervalDistanceWithCurrentDateBetweenOverdueTime:(NSInteger)overDueTime;

//距离今天天数
+ (NSInteger)dayNumberBetweenDate:(NSDate *)date withNowDate:(NSDate *)nowDate;

//两个日期之间具体的天数
+ (NSInteger)detailDayNumberBetweenDate:(NSDate *)date withNowDate:(NSDate *)nowDate;

//字符串日期
+ (NSString *)formatShowPayDateTime:(NSDate *)needDate;

+ (NSString *)formatShowMMDDHHMMDateTime:(NSDate *)needDate;

//用户版时间显示格式
+(NSString *)normalTimeDisplay:(NSTimeInterval)timeStamp;

+(NSString *)takeTimeDisplay:(NSTimeInterval)timeStamp;

+(NSString *)expireTimeDispaly:(NSTimeInterval)timeStamp;

+(NSString *)endTimeDispaly:(NSTimeInterval)timeStamp;

//比较两个时间的大小
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
//是否是一年前
+ (NSString *)formatShowDateTimeYear:(NSDate *)needDate;

/*
 日期在今年内:“月-日”，如“8-9”
 日期年份与今年不同:“年-月-日”，如“2015-8-9”
 */
+ (NSString *)receiveMoneyTimeDispaly:(NSTimeInterval)timeStamp;
/*年-月-日 时:分
 如“2016-08-12 08:34”*/
+ (NSString *)signingDispalyPayTime:(NSTimeInterval)timeStamp;

@end

NS_ASSUME_NONNULL_END
