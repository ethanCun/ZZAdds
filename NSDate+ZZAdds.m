//
//  NSDate+ZZAdds.m
//  demo
//
//  Created by Cun ethan on 2019/7/25.
//  Copyright © 2019 Cun ethan. All rights reserved.
//

#import "NSDate+ZZAdds.h"

static NSString *kDateFormatTypeDefault = @"yyyy-MM-dd HH:mm:ss";
static NSString *kDateFormatTypeDay = @"yyyy-MM-dd";
static NSString *kDateFormatTypeHour = @"yyyy-MM-dd HH";
static NSString *kDateFormatTypeMinute = @"yyyy-MM-dd HH:mm";
static NSString *kDateFormatTypeMinuteNoYear = @"MM-dd HH:mm";
static NSString *kDateFormatTypeMonthAndDay = @"MM-dd";
static NSString *kDateFormatTypeYearOnly = @"yyyy";
static NSString *kDateFormatTypeMonthOnly = @"MM";
static NSString *kDateFormatTypeDayOnly = @"dd";
static NSString *kDateFormatTypeTimeOnly = @"HH:mm:ss";
static NSString *kDateFormatTypeTimeShortOnly = @"HH:mm";
static NSString *kDateFormatTypeHourOnly = @"HH";
static NSString *kDateFormatTypeMinuteOnly = @"mm";
static NSString *kDateFormatTypeMonthAndDayOfText = @"MM月dd日";
static NSString *kDateFormatTypeDayOfText = @"yyyy年MM月dd日";

@implementation NSDate (ZZAdds)

+ (NSInteger)getNumberOfDaysInMonth:(NSDate *)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:date];
    NSUInteger numberOfDaysInMonth = range.length;
    
    return numberOfDaysInMonth;
}

- (NSString *)currentTime
{
    NSDate * date = [NSDate date];
    return [date toStringWithDateFormatterType:DateFormatterTypeDefault];
}

- (NSString *)toStringWithDateFormatterType:(DateFormatterType)dateFormatterType
{
    NSString *dateFormatterStr = nil;
    switch (dateFormatterType) {
        case DateFormatterTypeDefault:
            dateFormatterStr = kDateFormatTypeDefault;
            break;
        case DateFormatterTypeDay:
            dateFormatterStr = kDateFormatTypeDay;
            break;
        case DateFormatterTypeHour:
            dateFormatterStr = kDateFormatTypeHour;
            break;
        case DateFormatterTypeMinute:
            dateFormatterStr = kDateFormatTypeMinute;
            break;
        case DateFormatterTypeMinuteNoYear:
            dateFormatterStr = kDateFormatTypeMinuteNoYear;
            break;
        case DateFormatterTypeMonthAndDay:
            dateFormatterStr = kDateFormatTypeMonthAndDay;
            break;
        case DateFormatterTypeYearOnly:
            dateFormatterStr = kDateFormatTypeYearOnly;
            break;
        case DateFormatterTypeMonthOnly:
            dateFormatterStr = kDateFormatTypeMonthOnly;
            break;
        case DateFormatterTypeDayOnly:
            dateFormatterStr = kDateFormatTypeDayOnly;
            break;
        case DateFormatterTypeTimeOnly:
            dateFormatterStr = kDateFormatTypeTimeOnly;
            break;
        case DateFormatterTypeTimeShortOnly:
            dateFormatterStr = kDateFormatTypeTimeShortOnly;
            break;
        case DateFormatterTypeHourOnly:
            dateFormatterStr = kDateFormatTypeHourOnly;
            break;
        case DateFormatterTypeMinuteOnly:
            dateFormatterStr = kDateFormatTypeMinuteOnly;
            break;
        case DateFormatterTypeDayOfText:
            dateFormatterStr = kDateFormatTypeDayOfText;
            break;
        case DateFormatterTypeMonthAndDayOfText:
            dateFormatterStr = kDateFormatTypeMonthAndDayOfText;
            break;
        default:
            break;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormatterStr];
    
    return [self toStringWithDateFormatter:dateFormatter];
}

- (NSString *)toStringWithDateFormatter:(NSDateFormatter *)dateFormatter
{
    return [dateFormatter stringFromDate:self];
}

+ (NSDate *)toDateWithDateString:(NSString *)dateString withFormatterFype:(DateFormatterType)dateFormatterType
{
    NSString *dateFormatterStr = nil;
    switch (dateFormatterType) {
        case DateFormatterTypeDefault:
            dateFormatterStr = kDateFormatTypeDefault;
            break;
        case DateFormatterTypeDay:
            dateFormatterStr = kDateFormatTypeDay;
            break;
        case DateFormatterTypeHour:
            dateFormatterStr = kDateFormatTypeHour;
            break;
        case DateFormatterTypeMinute:
            dateFormatterStr = kDateFormatTypeMinute;
            break;
        case DateFormatterTypeMinuteNoYear:
            dateFormatterStr = kDateFormatTypeMinuteNoYear;
            break;
        case DateFormatterTypeMonthAndDay:
            dateFormatterStr = kDateFormatTypeMonthAndDay;
            break;
        case DateFormatterTypeYearOnly:
            dateFormatterStr = kDateFormatTypeYearOnly;
            break;
        case DateFormatterTypeMonthOnly:
            dateFormatterStr = kDateFormatTypeMonthOnly;
            break;
        case DateFormatterTypeDayOnly:
            dateFormatterStr = kDateFormatTypeDayOnly;
            break;
        case DateFormatterTypeTimeOnly:
            dateFormatterStr = kDateFormatTypeTimeOnly;
            break;
        case DateFormatterTypeTimeShortOnly:
            dateFormatterStr = kDateFormatTypeTimeShortOnly;
            break;
        case DateFormatterTypeHourOnly:
            dateFormatterStr = kDateFormatTypeHourOnly;
            break;
        case DateFormatterTypeMinuteOnly:
            dateFormatterStr = kDateFormatTypeMinuteOnly;
            break;
        case DateFormatterTypeDayOfText:
            dateFormatterStr = kDateFormatTypeDayOfText;
            break;
        case DateFormatterTypeMonthAndDayOfText:
            dateFormatterStr = kDateFormatTypeMonthAndDayOfText;
            break;
        default:
            break;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormatterStr];
    return [dateFormatter dateFromString:dateString];
}

- (NSInteger)year
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSYearCalendarUnit fromDate:self];
    return [dateComponents year];
}

- (NSInteger)month
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSMonthCalendarUnit fromDate:self];
    return [dateComponents month];
}

- (NSInteger)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSDayCalendarUnit fromDate:self];
    return [dateComponents day];
}

- (NSInteger)hour
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSHourCalendarUnit fromDate:self];
    return [dateComponents hour];
}

- (NSInteger)minute
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSMinuteCalendarUnit fromDate:self];
    return [dateComponents minute];
}

- (NSInteger)second
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSSecondCalendarUnit fromDate:self];
    return [dateComponents second];
}


+ (NSDate *)toDateFromTimestamp:(NSTimeInterval)timestamp
{
    return [NSDate dateWithTimeIntervalSince1970:timestamp];
}

+ (NSString *)formatShowDateTime:(NSDate *)needDate
{
    if (needDate == nil) {
        
        return @"";
    }
    @try {
        
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        NSDate * nowDate = [NSDate date];
        /////  将需要转换的时间转换成 NSDate 对象
        /////  取当前时间和转换时间两个日期对象的时间间隔
        /////  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needDate];
        //// 再然后，把间隔的秒数折算成天数和小时数：
        NSString *dateStr = @"";
        if (time<=60) {  //// 1分钟以内的
            
            dateStr = @"刚刚";
            
        }else if(time<=60*60){  ////  一个小时以内的
            
            NSInteger mins = time/60;
            dateStr = [NSString stringWithFormat:@"%@分钟前",@(mins)];
            
        }
        else if (time <60*60*24 && needDate.day == nowDate.day){
            
            [dateFormatter setDateFormat:kDateFormatTypeTimeShortOnly];
            
            dateStr = [dateFormatter stringFromDate:needDate];
        }
        else if(time<=60*60*24*2 && needDate.day +1 == nowDate.day){   //// 在两天内的
            
            dateStr = @"昨天";
            
        }else if (time<60*60*24*365 && needDate.year == nowDate.year){
            
            [dateFormatter setDateFormat:kDateFormatTypeMonthAndDayOfText];
            
            dateStr = [dateFormatter stringFromDate:needDate];
        }
        else {
            
            [dateFormatter setDateFormat:kDateFormatTypeDayOfText];
            
            dateStr = [dateFormatter stringFromDate:needDate];
        }
        return dateStr;
    }
    @catch (NSException *exception) {
        
        return @"";
    }
}

+ (NSString *)formatShowServerDateTime:(NSDate *)needDate{
    if (needDate == nil) {
        
        return @"";
    }
    
    @try {
        //实例化一个NSDateFormatter对象
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"yyyy/MM/dd"];
        
        return [dateFormatter stringFromDate:needDate];
    }
    @catch (NSException *exception) {
        return @"";
    }
}

+ (NSString *)formatShowMMSSDateTime:(NSDate *)needDate{
    
    if (needDate == nil) {
        
        return @"";
    }
    
    @try {
        //实例化一个NSDateFormatter对象
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"MM-dd"];
        
        return [dateFormatter stringFromDate:needDate];
    }
    @catch (NSException *exception) {
        return @"";
    }
}

+ (NSString *)formatShowHHMMDateTime:(NSDate *)needDate{
    if (needDate == nil) {
        
        return @"";
    }
    
    @try {
        //实例化一个NSDateFormatter对象
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"HH:mm"];
        
        return [dateFormatter stringFromDate:needDate];
    }
    @catch (NSException *exception) {
        return @"";
    }
}

+(NSInteger)timeIntervalDistanceWithCurrentDateBetweenOverdueTime:(NSInteger)overDueTime
{
    NSDate *overdueDate = [NSDate toDateFromTimestamp:overDueTime];
    NSInteger time =  [overdueDate timeIntervalSinceDate:[NSDate date]];
    return time;
}

+ (NSInteger)dayNumberBetweenDate:(NSDate *)date withNowDate:(NSDate *)nowDate
{
    NSDate *date3 =  [NSDate toDateWithDateString:[date toStringWithDateFormatterType:DateFormatterTypeDay] withFormatterFype:DateFormatterTypeDay];
    NSDate *date4 =  [NSDate toDateWithDateString:[nowDate toStringWithDateFormatterType:DateFormatterTypeDay] withFormatterFype:DateFormatterTypeDay];
    
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlag = NSDayCalendarUnit;
    NSDateComponents *gap = [cal components:unitFlag fromDate:date3 toDate:date4 options:0];//计算时间差
    
    NSInteger days = (NSInteger)ABS([gap day]);
    
    return days;
}

+ (NSInteger)detailDayNumberBetweenDate:(NSDate *)date withNowDate:(NSDate *)nowDate
{
    NSTimeInterval time = [date timeIntervalSinceDate:nowDate];
    //开始时间和结束时间的中间相差的时间
    NSInteger days;
    days = ((int)time)/(3600*24);  //一天是24小时*3600秒
    return days;
}

+ (NSString *)formatShowPayDateTime:(NSDate *)needDate{
    if (needDate == nil) {
        
        return @"";
    }
    
    @try {
        //实例化一个NSDateFormatter对象
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"YYYY-MM-dd"];
        
        return [dateFormatter stringFromDate:needDate];
    }
    @catch (NSException *exception) {
        return @"";
    }
}
+ (NSString *)formatShowMMDDHHMMDateTime:(NSDate *)needDate{
    if (needDate == nil) {
        
        return @"";
    }
    
    @try {
        //实例化一个NSDateFormatter对象
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        [dateFormatter setDateFormat:@"MM-dd HH:mm"];
        
        return [dateFormatter stringFromDate:needDate];
    }
    @catch (NSException *exception) {
        return @"";
    }
}

+(NSString *)normalTimeDisplay:(NSTimeInterval)timeStamp
{
    NSDate *date =[NSDate toDateFromTimestamp:timeStamp];
    
    return [NSDate formatShowDateTime:date];
}

+(NSString *)takeTimeDisplay:(NSTimeInterval)timeStamp
{
    NSDate *date =[NSDate toDateFromTimestamp:timeStamp];
    
    return [date toStringWithDateFormatterType:DateFormatterTypeMinute];
}

+(NSString *)expireTimeDispaly:(NSTimeInterval)timeStamp
{
    NSString *expireTimeStr = @"";
    
    NSDate *date =[NSDate toDateFromTimestamp:timeStamp];
    
    NSDate * nowDate = [NSDate date];
    NSTimeInterval time = [nowDate timeIntervalSinceDate:date];
    
    if (time < 60*60) {
        
        NSInteger minute = time/60;
        
        expireTimeStr =[NSString stringWithFormat:@"%@分钟后过期",@(minute)];
    }
    else if (time < 60*60*24){
        
        NSInteger hour = time/60*60;
        
        expireTimeStr =[NSString stringWithFormat:@"%@小时后过期",@(hour)];
        
    }else{
        
        NSInteger day = time/60*60*24;
        
        expireTimeStr =[NSString stringWithFormat:@"%@天后过期",@(day)];
    }
    return expireTimeStr;
}

+(NSString *)endTimeDispaly:(NSTimeInterval)timeStamp
{
    NSString *endTimeStr = @"";
    
    NSDate *date =[NSDate toDateFromTimestamp:timeStamp];
    
    NSDate * nowDate = [NSDate date];
    
    NSInteger dateYear = [date year];
    NSInteger nowDateYear =[nowDate year];
    
    if (dateYear == nowDateYear) {
        
        endTimeStr = [date toStringWithDateFormatterType:DateFormatterTypeMonthAndDayOfText];
    }
    else{
        
        endTimeStr = [date toStringWithDateFormatterType:DateFormatterTypeDayOfText];
    }
    return [NSString stringWithFormat:@"%@结束",endTimeStr];
}
//比较两个时间的大小
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1 是将来的");
        
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 是过去的");
        return -1;
    }
    //NSLog(@"等于");
    return 0;
}
+ (NSString *)formatShowDateTimeYear:(NSDate *)needDate
{
    if (needDate == nil) {
        
        return @"";
    }
    
    @try {
        //实例化一个NSDateFormatter对象
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        NSDate * nowDate = [NSDate date];
        
        /////  将需要转换的时间转换成 NSDate 对象
        /////  取当前时间和转换时间两个日期对象的时间间隔
        /////  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needDate];
        
        //// 再然后，把间隔的秒数折算成天数和小时数：
        
        NSString *dateStr = @"";
        
        
        [dateFormatter setDateFormat:@"yyyy"];
        NSString * yearStr = [dateFormatter stringFromDate:needDate];
        NSString *nowYear = [dateFormatter stringFromDate:nowDate];
        
        if ([yearStr isEqualToString:nowYear]) {
            ////  在同一年
            [dateFormatter setDateFormat:@"MM-dd"];
            dateStr = [dateFormatter stringFromDate:needDate];
        }else{
            
            if (time<=60*60*24*365) {//一年内
                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                dateStr = [dateFormatter stringFromDate:needDate];
            }else{
                
                dateStr = @"一年前";
            }
            
        }
        
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
}


+(NSString *)receiveMoneyTimeDispaly:(NSTimeInterval)timeStamp
{
    NSString *endTimeStr = @"";
    
    NSDate *date =[NSDate toDateFromTimestamp:timeStamp];
    
    NSDate * nowDate = [NSDate date];
    
    NSInteger dateYear = [date year];
    NSInteger nowDateYear =[nowDate year];
    
    if (dateYear == nowDateYear) {
        
        endTimeStr = [date toStringWithDateFormatterType:DateFormatterTypeMonthAndDay];
    }
    else{
        
        endTimeStr = [date toStringWithDateFormatterType:DateFormatterTypeDay];
    }
    return endTimeStr;
}
+(NSString *)signingDispalyPayTime:(NSTimeInterval)timeStamp{
    
    NSString *payTime = @"";
    NSDate *date =[NSDate toDateFromTimestamp:timeStamp];
    payTime = [date toStringWithDateFormatterType:DateFormatterTypeMinute];
    
    return payTime;
    
}

@end
