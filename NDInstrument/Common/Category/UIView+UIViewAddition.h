//
//  UIView+UIViewAddition.h
//  BCBL
//
//  Created by chmtech003 on 14-4-29.
//  Copyright (c) 2014年 Chmtech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIViewAddition)

@property(nonatomic) CGFloat left;
@property(nonatomic) CGFloat right;
@property(nonatomic) CGFloat top;
@property(nonatomic) CGFloat bottom;
@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat height;

- (void)showFrame;
//设置view边框
-(id)setCheekWithColor:(UIColor*)color borderWidth:(float)width;
//计算两点距离
+(float)distanceFromPointX:(CGPoint)start distanceToPointY:(CGPoint)end;


/**
 *  获取自动布局的属性 不用拉线
 *
 *  @param identifier  Constraintidentifier
 *  @param isSuperView 是否是父视图，不是就是自己
 *
 *  @return NSLayoutConstraint
 */
-(NSLayoutConstraint *)getConstraintForIdentifier:(NSString *)identifier isSuperView:(BOOL)isSuperView;

- (void)customPushView:(UIView *)view toViewController:(UIViewController *)vc;
- (void)customDismissView:(UIView *)view;

@end


