//
//  NSString+ZZAdds.h
//  demo
//
//  Created by Cun ethan on 2019/7/25.
//  Copyright © 2019 Cun ethan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZZAdds)

//MARK: - 常用属性
/**
 固定高度获取文字宽度
 */
- (CGFloat)getWidthWithHeight:(CGFloat)height textColor:(UIColor *)textColor textFont:(UIFont *)textFont;

/**
 固定宽度获取文字高度
 */
- (CGFloat)getHeightWithWidth:(CGFloat)width textColor:(UIColor *)textColor textFont:(UIFont *)textFont;

//是否是表情
- (BOOL)stringContainsEmoji;

//是否是手机号
- (BOOL)isMobileNumber;

//是否是电话号码
//- (BOOL)isFixPhoneNumber;

//是否是邮箱
- (BOOL)isAvailableEmail;

//是否是纯数字
- (BOOL)isNumText;
/**
 是否是身份证
 */
- (BOOL)isIdentityNumber;

//最多显示两位小数
+ (NSString *)returnActualFormatNumber:(double)number;

//保留几位小数
+ (NSString *)returnDetailFormatNumber:(double)number leaveCount:(NSInteger)count;

//设置富文本
+ (NSMutableAttributedString *)setNbLabelTextProperty:(NSString *)text
                                               string:(NSString *)string
                                            textColor:(UIColor *)color
                                             textFont:(UIFont *)font;

+ (NSMutableAttributedString *)attributeStringWithText:(NSString *)text
                                         withLineSpace:(CGFloat )lineSpace
                                     withLineBreakMode:(NSLineBreakMode )lineBreakMode
                                              withFont:(UIFont *)font;

/**
 是否是身份证
 */
+ (BOOL)validateIdentityCard:(NSString *)identityCard;

//是否有空格
- (BOOL)isHaveSpaceInString;

//是否有中文字符
- (BOOL)isHaveChineseInString;

//是否是url
- (BOOL)isWebUrlStr;

//MARK: - 字符串日期转换
//字符串转换为NSDate  2019年1月1日
+(NSDate*)convertDateYearMonthDayFromString:(NSString*)uiDate;
//2019-01-01 seperator :@"2019/1/1"中的/
+(NSDate*)convertDateYearMonthDayFromString:(NSString*)uiDate seperator:(NSString *)seperator;
//年月日时分秒
+(NSDate*)convertDateYearMonthDayHourMinuteSecondFromString:(NSString*)uiDate;

//MARK: - 路径
// 获取Documents目录 Documents：需要始终被保存的数据存储到这里，iTunes在备份和恢复时包含此目录。
+ (NSString *)documentsPath;
// 获取Cache目录 Library/Caches：缓存一般性的文件，iTunes不会备和恢复份此目录，该目录不会在应用退出是被清空。
+ (NSString *)cacheLibraryPath;
// 获取tmp目录 tmp：存放临时文件，iTunes不会备份和恢复此目录，该目录下文件可能会在应用退出后删除。
+ (NSString *)tempPath;

@end

NS_ASSUME_NONNULL_END
