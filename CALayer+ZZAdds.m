//
//  CALayer+ZZAdds.m
//  demo
//
//  Created by Cun ethan on 2019/7/25.
//  Copyright © 2019 Cun ethan. All rights reserved.
//

#import "CALayer+ZZAdds.h"
#import <objc/runtime.h>
#import <objc/message.h>

const static void *animationDidStopKey = &animationDidStopKey;

@implementation CALayer (ZZAdds)

- (void)setTransformRotation:(CGFloat)transformRotation
{
    [self setValue:@(transformRotation) forKeyPath:@"transform.rotation"];
}

- (CGFloat)transformRotation
{
    return [[self valueForKeyPath:@"transform.rotation"] floatValue];
}

- (void)setTransformRotationX:(CGFloat)transformRotationX
{
    [self setValue:@(transformRotationX) forKeyPath:@"transform.rotation.x"];
}

- (CGFloat)transformRotationX
{
    return [[self valueForKeyPath:@"transform.rotation.x"] floatValue];
}

- (void)setTransformRotationY:(CGFloat)transformRotationY
{
    [self setValue:@(transformRotationY) forKeyPath:@"transform.rotation.y"];
}

-  (CGFloat)transformRotationY
{
    return [[self valueForKeyPath:@"transform.rotation.y"] floatValue];
}

- (void)setTransformScale:(CGFloat)transformScale
{
    [self setValue:@(transformScale) forKeyPath:@"transform.scale"];
}

- (CGFloat)transformScale
{
    return [[self valueForKeyPath:@"transform.scale"] floatValue];
}

- (void)setTransformScaleX:(CGFloat)transformScaleX
{
    [self setValue:@(transformScaleX) forKeyPath:@"transform.scale.x"];
}

- (CGFloat)transformScaleX
{
    return [[self valueForKeyPath:@"transform.scale.x"] floatValue];
}

- (void)setTransformScaleY:(CGFloat)transformScaleY
{
    [self setValue:@(transformScaleY) forKeyPath:@"transform.scale.y"];
}

- (CGFloat)transformScaleY
{
    return [[self valueForKeyPath:@"transform.scale.y"] floatValue];
}

- (void)setTransformScaleZ:(CGFloat)transformScaleZ
{
    [self setValue:@(transformScaleZ) forKeyPath:@"transform.scale.z"];
}

- (CGFloat)transformScaleZ
{
    return [[self valueForKeyPath:@"transform.scale.z"] floatValue];
}

- (void)setTransformTranslationX:(CGFloat)transformTranslationX
{
    [self setValue:@(transformTranslationX) forKeyPath:@"transform.translation.x"];
}

- (CGFloat)transformTranslationX
{
    return [[self valueForKeyPath:@"transform.translation.x"] floatValue];
}

- (void)setTransformTranslationY:(CGFloat)transformTranslationY
{
    [self setValue:@(transformTranslationY) forKeyPath:@"transform.translation.y"];
}

- (CGFloat)transformTranslationY
{
    return [[self valueForKeyPath:@"transform.translation.y"] floatValue];
}

- (void)setTransformTranslationZ:(CGFloat)transformTranslationZ
{
    [self setValue:@(transformTranslationZ) forKeyPath:@"transform.translation.z"];
}

- (CGFloat)transformTranslationZ
{
    return [[self valueForKeyPath:@"transform.translation.z"] floatValue];
}

- (void)setAnimationDidStop:(AnimationDidStop)animationDidStop
{
    objc_setAssociatedObject(self, animationDidStopKey, animationDidStop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AnimationDidStop)animationDidStop
{
    return objc_getAssociatedObject(self, animationDidStopKey);
}

- (void)addBasicAnimationWithKeyPath:(NSString *)keypath
                                from:(id)fromValue
                                  to:(id)toValue
                            duration:(CGFloat)duration
                         repeatCount:(CGFloat)repeatCount
{
    return [self addBasicAnimationWithKeyPath:keypath from:fromValue to:toValue duration:duration repeatCount:repeatCount
                                                    autoreverses:NO timingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear] removedOnCompletion:YES keypathStr:@"basicAnimation"];
}

- (void)addBasicAnimationWithKeyPath:(NSString *)keypath
                                from:(id)fromValue
                                  to:(id)toValue
                            duration:(CGFloat)duration
                         repeatCount:(CGFloat)repeatCount
                     autoreverses:(BOOL)                    autoreverses
                      timingFunction:(CAMediaTimingFunction *)timingFunction
                 removedOnCompletion:(BOOL)removedOnCompletion
                             keypathStr:(NSString *)keypathStr
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keypath];
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    
    if (!timingFunction) {
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    }else{
        animation.timingFunction = timingFunction;
    }
    
    if (!removedOnCompletion) {
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
    }else{
        animation.removedOnCompletion = YES;
    }
    
    animation.delegate = self;
    
    [self addAnimation:animation forKey:keypathStr];
}

- (void)addKeyframeAnimationWithKeyPath:(NSString *)keypath
                                 values:(NSArray *)values
                               duration:(CGFloat)duration
                            repeatCount:(CGFloat)repeatCount
{
    [self addKeyframeAnimationWithKeyPath:keypath values:values duration:duration repeatCount:repeatCount
                          autoreverses:NO  timingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear] removedOnCompletion:YES keypathStr:@"keyframeAnimation"];
}

- (void)addKeyframeAnimationWithKeyPath:(NSString *)keypath
                                 values:(NSArray *)values
                               duration:(CGFloat)duration
                            repeatCount:(CGFloat)repeatCount
                           autoreverses:(BOOL)autoreverses
                         timingFunction:(CAMediaTimingFunction *)timingFunction
                    removedOnCompletion:(BOOL)removedOnCompletion
                        keypathStr:(NSString *)keypathStr
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = keypath;
    animation.values = values;
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    
    if (!timingFunction) {
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    }else{
        animation.timingFunction = timingFunction;
    }
    
    animation.autoreverses = autoreverses;
    
    if (!removedOnCompletion) {
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
    }else{
        animation.removedOnCompletion = YES;
    }
    
    animation.delegate = self;
    
    [self addAnimation:animation forKey:keypathStr];
}

- (void)removeBasicAnimationForKeyPath:(NSString *)keypath
{
    [self removeBasicAnimationForKeyPath:keypath];
}

//MARK: - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (self.animationDidStop) {
        self.animationDidStop(anim, flag);
    }
}

- (UIImage *)snapshotImage{
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius {
    
    self.shadowColor = color.CGColor;
    self.shadowOffset = offset;
    self.shadowRadius = radius;
    self.shadowOpacity = 1;
    self.shouldRasterize = YES;
    self.rasterizationScale = [UIScreen mainScreen].scale;
}

@end
