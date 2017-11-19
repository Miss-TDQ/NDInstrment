//
//  JinZhiChartView.m
//  NDInstrument
//
//  Created by miss on 2017/11/19.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "JinZhiChartView.h"

#define kBarWidth 9
#define kBarOffset (self.width - kBarWidth*4 - kBarBetweenDistance*3)/2
#define kFirstBarColor [UIColor getColorWithHex:@"#b561f1"]
#define kSecondBarColor [UIColor getColorWithHex:@"#ff7bd8"]
#define kThirdBarColor [UIColor getColorWithHex:@"#ff7c9b"]
#define kFourthBarColor [UIColor getColorWithHex:@"#61c0d7"]
#define kBarDefaultColor [UIColor getColorWithHex:@"#ebebeb"]

#define kTextHeigth 20
#define kTextBetweenBar 5

@interface JinZhiChartView()
{
    CGFloat kBarBetweenDistance;
}
@property (nonatomic, strong) NSArray *valueAry;
@property (nonatomic) BOOL animated;

@end
@implementation JinZhiChartView

- (instancetype)initWithFrame:(CGRect)frame valueAry:(NSArray *)valueAry isAnimation:(BOOL)isAnimation
{
    self = [super initWithFrame:frame];
    if (self) {
        self.valueAry = valueAry;
        self.animated = isAnimation;
        
        if([SDiPhoneVersion deviceSize] == iPhone4inch){
            kBarBetweenDistance = 25;
        }else{
            kBarBetweenDistance = 30;
        }
    }
    return self;
}
#pragma mark - 绘图
-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawXCoordinateText:context];

    [self drawDefaultBar:context];

    [self drawBar:context];
}
- (void)drawXCoordinateText:(CGContextRef)context
{
    NSArray * xTextAry = @[@"持久力",@"肌力",@"爆发力",@"重复性"];
    NSArray * textColorAry = @[kFirstBarColor,kSecondBarColor,kThirdBarColor,kFourthBarColor];
    CGFloat textWidth = 60;
    for (int i = 0; i < self.valueAry.count; i++)
    {
        UILabel * lab = [UILabel new];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.textColor = textColorAry[i];
        lab.text = xTextAry[i];
        lab.font = [UIFont systemFontOfSize:9];
        
        CGFloat x = kBarOffset + kBarWidth*i + i * kBarBetweenDistance - textWidth/2;
        CGFloat y = self.frame.size.height - kTextHeigth - kTextBetweenBar;
        
        //把文字画到指定的点
        lab.frame = CGRectMake(x, y, textWidth, kTextHeigth);
        [self addSubview:lab];
    }
}

- (void)drawDefaultBar:(CGContextRef)context
{
    for (int i = 0; i < self.valueAry.count; i++)
    {
        CAShapeLayer *barLayer = [CAShapeLayer layer];
        //填充颜色
        barLayer.fillColor = kBarDefaultColor.CGColor;
        [self.layer addSublayer:barLayer];
        
        CGFloat x = kBarOffset + kBarBetweenDistance * i + kBarWidth*i;
        CGFloat width = kBarWidth;
        CGFloat height = self.height - kTextHeigth - kTextBetweenBar;
        CGFloat y =  self.height - height - kTextHeigth - kTextBetweenBar;
        
        //动画终点path
        CGMutablePathRef endPath = CGPathCreateMutable();
        //添加一个矩形
        CGPathAddRect(endPath, NULL, CGRectMake(x, y, width, height));
        
        //设置path
        barLayer.path = endPath;
        CGPathRelease(endPath);
    }
}

- (void)drawBar:(CGContextRef)context
{
    NSArray * textColorAry = @[kFirstBarColor,kSecondBarColor,kThirdBarColor,kFourthBarColor];
    for (int i = 0; i < self.valueAry.count; i++)
    {
        CAShapeLayer *barLayer = [CAShapeLayer layer];
        //填充颜色
        UIColor *color = textColorAry[i];
        barLayer.fillColor = color.CGColor;
        [self.layer addSublayer:barLayer];
        
        CGFloat value = [self.valueAry[i] floatValue];
        
        CGFloat x = kBarOffset + kBarBetweenDistance * i + kBarWidth*i;
        CGFloat width = kBarWidth;
        CGFloat height = value/100 * (self.height - kTextHeigth - kTextBetweenBar);
        CGFloat y =  self.height - height - kTextHeigth - kTextBetweenBar;
        
        //动画终点path
        CGMutablePathRef endPath = CGPathCreateMutable();
        //添加一个矩形
        CGPathAddRect(endPath, NULL, CGRectMake(x, y, width, height));
        
        //设置path
        barLayer.path = endPath;
        //有动画
        if (self.animated)
        {
            //动画起点path
            CGMutablePathRef startPath = CGPathCreateMutable();
            CGPathAddRect(startPath, NULL, CGRectMake(x, self.frame.size.height - kTextHeigth - kTextBetweenBar, width, 0));
            
            CABasicAnimation *basicAni = [CABasicAnimation animationWithKeyPath:@"path"];
            basicAni.duration = 6;
            basicAni.fromValue = (__bridge id)startPath;
            basicAni.toValue = (__bridge id)endPath;
            [barLayer addAnimation:basicAni forKey:nil];
            
            CGPathRelease(startPath);
        }
        CGPathRelease(endPath);
    }
}
@end
