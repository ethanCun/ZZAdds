//
//  UIView+ZZAdds.m
//  demo
//
//  Created by Cun ethan on 2019/7/25.
//  Copyright © 2019 Cun ethan. All rights reserved.
//

#import "UIView+ZZAdds.h"
#import <objc/message.h>
#import <objc/runtime.h>

static const void *topKey = &topKey;
static const void *bottomKey = &bottomKey;
static const void *leftKey = &leftKey;
static const void *rightKey = &rightKey;

@implementation UIView (ZZAdds)

@dynamic x;
@dynamic y;
@dynamic width;
@dynamic height;

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center_ = self.center;
    center_.x = centerX;
    self.center = center_;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center_ = self.center;
    center_.y = centerY;
    self.center = center_;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)addCorner:(UIRectCorner)rectCorner widthRadii:(CGFloat)radii
{
    CGRect bounds = self.bounds;
    
    UIBezierPath *bp = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(radii, radii)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = bp.CGPath;
    layer.frame = bounds;
    
    self.layer.mask = layer;
}

- (UIViewController *)viewController {
    
    for (UIView *view = self; view; view = view.superview) {
        
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}



@end
