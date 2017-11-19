//
//  NSString+Toast.m
//  NDInstrument
//
//  Created by miss on 2017/11/19.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "NSString+Toast.h"

@implementation NSString (Toast)

+ (void)showTemporaryMessageOnFirstWindow:(NSString*)msg
{
    if (msg.length == 0||[msg isEqualToString:@""]) {
        return;
    }
    
    CGSize titleSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:16], NSFontAttributeName,nil];
    
    if (titleSize.width > 220/320.0*[UIScreen mainScreen].bounds.size.width)
    {
        titleSize.width = 220/320.0*[UIScreen mainScreen].bounds.size.width;
        titleSize = [msg boundingRectWithSize:CGSizeMake(titleSize.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
        titleSize.height = titleSize.height;
    }
    else
    {
        titleSize = [msg boundingRectWithSize:titleSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    }
    
    float width = titleSize.width;
    float height = titleSize.height;
    
    //lab加在最后一个window上 防止在键盘弹出时提示语被挡住
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    
    CGFloat labW = width + 10;
    CGFloat labH = height + 30;
    CGFloat backWidth = labW + 20;
    CGFloat labX = SCREENWIDTH/2 - backWidth/2;
    CGFloat labY = window.height/2 - labH/2;
    
    //背景view
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(labX, labY, backWidth, labH)];
    backView.backgroundColor = [UIColor colorWithRed:68/255.0 green:72/255.0 blue:75/255.0 alpha:1];
    backView.layer.cornerRadius = 4.0;
    backView.layer.masksToBounds = YES;
    backView.alpha = 0;
    backView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [window addSubview:backView];
    [window bringSubviewToFront:backView];
    
    UILabel *promptlable = [[UILabel alloc]initWithFrame:CGRectMake(10,0,backWidth-20,labH)];
    promptlable.textAlignment = NSTextAlignmentCenter;
    promptlable.numberOfLines = 0;
    promptlable.text = msg;
    promptlable.textColor = [UIColor whiteColor];
    promptlable.font = [UIFont boldSystemFontOfSize:16];
    [backView addSubview:promptlable];
    
    [UIView animateWithDuration:0.1 animations:^{
        backView.alpha = 1.0;
        backView.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        //停留时间 看的更清楚些
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.4 animations:^{
                backView.transform = CGAffineTransformMakeScale(0.5, 0.5);
                backView.alpha = 0;
            } completion:^(BOOL finished) {
                [backView removeFromSuperview];
            }];
        });
    }];
}

@end
