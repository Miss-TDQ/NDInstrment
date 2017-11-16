//
//  NSString+PKBSize.m
//  ParkBeesIOS
//
//  Created by charles_wtx on 17/3/29.
//  Copyright © 2017年 Ecaray. All rights reserved.
//

#import "NSString+PKBSize.h"

@implementation NSString (PKBSize)

+(float)getTextHeightWithText:(NSString*)text andFont:(UIFont *)font andWidth:(float)width
{
    if (!text) {
        return 0;
    }
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    CGSize size = CGSizeMake(width, MAXFLOAT);
    size =[text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    return size.height;
}

+(float)getTextWidthWithText:(NSString *)text andFont:(UIFont *)font andHeight:(float)height{
    if (!text) {
        return 0;
    }
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    CGSize size = CGSizeMake(MAXFLOAT, height);
    size = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    return size.width;
}

+(CGSize)getSizeWithText:(NSString*)text andFont:(UIFont *)font andSize:(CGSize)size andSpacing:(float)spacing
{
    if (!text) {
        return CGSizeMake(0, 0);
    }
    
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    if (spacing>0)
    {
        NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:spacing];
        tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,paragraphStyle1,NSParagraphStyleAttributeName, nil];
    }
    
    size =[text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    return size;
}

@end
