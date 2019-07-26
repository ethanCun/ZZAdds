//
//  NSObject+ZZAdds.h
//  demo
//
//  Created by Cun ethan on 2019/7/25.
//  Copyright © 2019 Cun ethan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ZZAdds)

/**
 弹框
 */
- (void)showAlertWithMessage:(NSString *)aMsg;
- (void)showAlertWithTitle:(NSString *)aTitle
                   message:(NSString *)aMsg;

/* 调换实例方法 */
+ (BOOL)swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel;

/* 调换类方法 */
+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel;

/* 给类添加属性 */
- (void)setAssociateValue:(id)value withKey:(void *)key;

/* 给类添加弱引用属性,上面的就可以理解为强引用属性 */
- (void)setAssociateWeakValue:(id)value withKey:(void *)key;

/* 获取某个类的属性 */
- (id)getAssociatedValueForKey:(void *)key;

/* 删除一个类的所有属性 */
- (void)removeAssociatedValues;

/* 获取类的所有属性 */
+ (NSArray *)getAllProperties;


@end

NS_ASSUME_NONNULL_END
