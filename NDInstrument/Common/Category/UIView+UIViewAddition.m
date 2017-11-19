//
//  UIView+UIViewAddition.m
//  BCBL
//
//  Created by chmtech003 on 14-4-29.
//  Copyright (c) 2014年 Chmtech. All rights reserved.
//
#import "UIView+UIViewAddition.h"

@implementation UIView (UIViewAddition)

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)showFrame
{
    NSLog(@"%f %f %f %f", self.frame.origin.x, self.frame.origin.y, self.width, self.height);
}
-(id)setCheekWithColor:(UIColor*)color borderWidth:(float)width
{
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
    return self;
}

+(float)distanceFromPointX:(CGPoint)start distanceToPointY:(CGPoint)end
{
    
    float distance;
    
    CGFloat xDist = (end.x - start.x);
    
    CGFloat yDist = (end.y - start.y);
    
    distance = sqrt((xDist * xDist) + (yDist * yDist));
    
    return distance;
    
}

-(NSLayoutConstraint *)getConstraintForIdentifier:(NSString *)identifier isSuperView:(BOOL)isSuperView{
    
    if (isSuperView) {
        for (UIView *subView in self.subviews) {
            for (NSLayoutConstraint *constraint in subView.constraints) {
                if ([constraint.identifier isEqualToString:identifier]) {
                    return constraint;
                }
            }
        }
    }
    else{
        for (NSLayoutConstraint *constraint in self.constraints) {
            if ([constraint.identifier isEqualToString:identifier]) {
                return constraint;
            }
        }
    }
    
    return nil;
}

- (void)customPushView:(UIView *)view toViewController:(UIViewController *)vc
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    [view.layer addAnimation:transition forKey:nil];
    [view addSubview:vc.view];
}

- (void)customDismissView:(UIView *)view
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    [view.superview.layer addAnimation:transition forKey:nil];
}

@end
