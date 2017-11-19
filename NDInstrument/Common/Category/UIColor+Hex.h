//
//  UIColor+Hex.h
//  ParkBeesIOS
//
//  Created by charles_wtx on 16/7/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

//根据十六进制值获取颜色值
+ (UIColor*)getColorWithHex:(NSString*)hexColor;
+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (NSString*)hexFromUIColor:(UIColor*)color;

@end
