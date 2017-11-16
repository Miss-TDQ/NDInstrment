//
//  CustomTabBar.h
//
//  Created by chmtech003 on 14-8-28.
//  Copyright (c) 2014年 Chmtech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBar : UITabBarController


@property (nonatomic,strong)NSMutableArray *dropImgAry;
@property (nonatomic,strong)NSMutableArray *badgeAry;

//小红点提示
-(void)creatDropImgView;
-(void)setDropImgShow:(BOOL)show andIndex:(int)index;

//文字提示 必须在tabbar.viewControllers 不为空使用
-(void)creatBadgeButton;
-(void)setBadgeWithString:(NSString*)badge andIndex:(int)index;
@end
