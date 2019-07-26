//
//  UIView+ZZAdds.h
//  demo
//
//  Created by Cun ethan on 2019/7/25.
//  Copyright © 2019 Cun ethan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZZAdds)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;


/**
 添加圆角
 */
- (void)addCorner:(UIRectCorner)rectCorner widthRadii:(CGFloat)radii;

/**
 当前view所在的控制器
 */
- (UIViewController *)viewController;



@end

NS_ASSUME_NONNULL_END
