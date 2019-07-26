//
//  CALayer+ZZAdds.h
//  demo
//
//  Created by Cun ethan on 2019/7/25.
//  Copyright © 2019 Cun ethan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (ZZAdds)<CAAnimationDelegate>

/**
 旋转
 */
@property (nonatomic, assign) CGFloat transformRotation;
@property (nonatomic, assign) CGFloat transformRotationX;
@property (nonatomic, assign) CGFloat transformRotationY;
@property (nonatomic, assign) CGFloat transformRotationZ;

/**
 缩放
 */
@property (nonatomic, assign) CGFloat transformScale;
@property (nonatomic, assign) CGFloat transformScaleX;
@property (nonatomic, assign) CGFloat transformScaleY;
@property (nonatomic, assign) CGFloat transformScaleZ;

/**
 平移
 */
@property (nonatomic, assign) CGFloat transformTranslationX;
@property (nonatomic, assign) CGFloat transformTranslationY;
@property (nonatomic, assign) CGFloat transformTranslationZ;

/**
 动画
 */
typedef void(^AnimationDidStop)(CAAnimation *anim, BOOL flag);
@property (nonatomic, copy) AnimationDidStop animationDidStop;

/**
 旋转：transform.rotation
 x轴旋转：transform.rotation.x
 y轴旋转：transform.rotation.y
 z轴旋转：transform.rotation.z
 放大：transform.scale.
 x轴放大：transform.scale.x
 y轴轴放大：transform.scale.y
 z轴放大：transform.scale.z
 移动：position [NSValue valueWithCGPoint:CGPointMake(0, 0)]
 x轴移动：position.x
 y轴移动：position.y
 z轴移动：position.z
 */
- (void)addBasicAnimationWithKeyPath:(NSString *)keypath
                                from:(id)fromValue
                                  to:(id)toValue
                            duration:(CGFloat)duration
                         repeatCount:(CGFloat)repeatCount;
- (void)addBasicAnimationWithKeyPath:(NSString *)keypath
                                from:(id)fromValue
                                  to:(id)toValue
                            duration:(CGFloat)duration
                         repeatCount:(CGFloat)repeatCount
                        autoreverses:(BOOL)autoreverses
                      timingFunction:(CAMediaTimingFunction *)timingFunction 
                removedOnCompletion:(BOOL)removedOnCompletion
                             keypathStr:(NSString *)keypath;

- (void)addKeyframeAnimationWithKeyPath:(NSString *)keypath
                                 values:(NSArray *)values
                               duration:(CGFloat)duration
                            repeatCount:(CGFloat)repeatCount;
- (void)addKeyframeAnimationWithKeyPath:(NSString *)keypath
                                 values:(NSArray *)values
                               duration:(CGFloat)duration
                            repeatCount:(CGFloat)repeatCount
                           autoreverses:(BOOL)autoreverses
                      timingFunction:(CAMediaTimingFunction *)timingFunction
                 removedOnCompletion:(BOOL)removedOnCompletion
                            keypathStr:(NSString *)keypath;

- (void)removeBasicAnimationForKeyPath:(NSString *)keypath;

/**
 截图
 */
- (UIImage *)snapshotImage;

/**
 设置阴影
 */
- (void)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;




@end

NS_ASSUME_NONNULL_END
