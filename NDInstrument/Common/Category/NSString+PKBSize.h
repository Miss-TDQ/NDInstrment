//
//  NSString+PKBSize.h
//  ParkBeesIOS
//
//  Created by charles_wtx on 17/3/29.
//  Copyright © 2017年 Ecaray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PKBSize)

//获取字符串高度
+ (float)getTextHeightWithText:(NSString*)text andFont:(UIFont *)font andWidth:(float)width;
//获取字符串宽度
+ (float)getTextWidthWithText:(NSString*)text andFont:(UIFont *)font andHeight:(float)height;
//获取字符串尺寸 spacing为行间距
+ (CGSize)getSizeWithText:(NSString*)text andFont:(UIFont *)font andSize:(CGSize)size andSpacing:(float)spacing;

@end
