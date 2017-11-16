//
//  CustomBar.m
//  FYXLook
//
//  Created by user on 13-10-8.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//
#define cusBarBtnWidth  45
#define cusBarBtnHeight 44

//#define cusBarBtnY      [UIApplication sharedApplication].statusBarFrame.size.height

#import "CustomBar.h"
#import <objc/runtime.h>

@implementation CustomBar
{
    NSString *leftBtnTitleStr;
    NSString *rightBtnTitleStr;
    UIImage  *leftBtnImage;
    UIImage  *rightBtnImage;
    CGFloat cusBarBtnY;
}

@synthesize customdelegate;

static char overlayKey;
static char emptyImageKey;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        if([SDiPhoneVersion deviceSize]==iPhoneXinch){
            cusBarBtnY = 40;
        }else{
            cusBarBtnY = 20;
        }
        _tickerView = [[JHTickerView alloc] initWithFrame:CGRectMake(cusBarBtnWidth, cusBarBtnY,frame.size.width-2*cusBarBtnWidth, cusBarBtnHeight)];
        [_tickerView setDirection:JHTickerDirectionLTR];
        [_tickerView setTickerSpeed:60.0f];
        [self addSubview:_tickerView];
        
        self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame = CGRectMake(0, cusBarBtnY, cusBarBtnWidth, cusBarBtnHeight);
        _leftBtn.adjustsImageWhenHighlighted = NO;
        [_leftBtn addTarget:self action:@selector(leftleftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftBtn];
        
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(SCREENWIDTH-cusBarBtnWidth, cusBarBtnY, cusBarBtnWidth, cusBarBtnHeight);
        _rightBtn.adjustsImageWhenHighlighted = NO;
        [_rightBtn addTarget:self action:@selector(rightrightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightBtn];
        
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareBtn.frame = CGRectMake(SCREENWIDTH-2*cusBarBtnWidth, cusBarBtnY, cusBarBtnWidth, cusBarBtnHeight);
        _shareBtn.adjustsImageWhenHighlighted = NO;
        [_shareBtn addTarget:self action:@selector(shareshareClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_shareBtn];
        
    }
    return self;
}

-(void)leftleftBtnClick:(id)sender
{
    if([customdelegate respondsToSelector:@selector(leftBtnClick)])
    {
          [customdelegate  leftBtnClick];
    }

}
-(void)rightrightBtnClick:(id)sender
{
    if([customdelegate respondsToSelector:@selector(rightBtnClick)])
    {
          [customdelegate  rightBtnClick];
    }
}
-(void)shareshareClick:(id)sender
{
    if([customdelegate respondsToSelector:@selector(shareBtnClick)])
    {
          [customdelegate shareBtnClick];
    }
}
- (void)setTitleStr:(NSString *)titleStr
{
    if (titleStr ==_titleStr) {
        return;
    }
    _titleStr = titleStr;

    _tickerView.tickerString =  _titleStr;
    [_tickerView start];
    
}
//获取当前屏幕显示的viewcontroller
- (UIViewController*)getCurrentVC
{
    for (UIView* next = [self superview]; next; next =
         next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController
                                         class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}


- (void)setLeftBtnImgWith:(UIImage  *)leftBtnImg  RightBtnImgWith:(UIImage *)rightBtnImg
{
    //[self.leftBtn setBackgroundImage:leftBtnImg forState:UIControlStateNormal];
    [self.leftBtn setImage:leftBtnImg forState:UIControlStateNormal];
    [self.rightBtn setImage:rightBtnImg forState:UIControlStateNormal];
    
    leftBtnImage = leftBtnImg;
    rightBtnImage = rightBtnImg;
    
    if (leftBtnImg==nil&&leftBtnTitleStr==nil){
        self.leftBtn.userInteractionEnabled = NO;
    }else{
        self.leftBtn.userInteractionEnabled = YES;
    }
    if (rightBtnImg==nil&&rightBtnTitleStr==nil) {
        self.rightBtn.userInteractionEnabled = NO;
    }else{
        self.rightBtn.userInteractionEnabled = YES;
    }
}

- (void)setLeftBtnImage:(UIImage *)aImage
{
    if (aImage)
    {
        self.leftBtn.userInteractionEnabled = YES;
        leftBtnImage = aImage;
        [self.leftBtn setImage:aImage forState:UIControlStateNormal];
    }
}

- (void)setRightBtnImage:(UIImage*)aImage
{
    if (aImage)
    {
        self.rightBtn.userInteractionEnabled = YES;
        rightBtnImage = aImage;
        [self.rightBtn setImage:aImage forState:UIControlStateNormal];
    }
}

- (void)setshareBtnImage:(UIImage*)aImage
{
    if(aImage)
    {
        [self.shareBtn  setImage:aImage  forState:UIControlStateNormal];
    }
}

- (void)setLeftBtnTitle:(NSString *)title
{
    [self.leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [self.leftBtn setTitle:title forState:UIControlStateNormal];
    
    leftBtnTitleStr = title;
    
    if (title==nil&&leftBtnImage==nil){
        self.leftBtn.userInteractionEnabled = NO;
    }else{
        self.leftBtn.userInteractionEnabled = YES;
    }
}

- (void)setRightBtnTitle:(NSString *)title
{
    [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [self.rightBtn setTitle:title forState:UIControlStateNormal];
    
    rightBtnTitleStr = title;
    
    if (title==nil&&rightBtnImage==nil) {
        self.rightBtn.userInteractionEnabled = NO;
    }else{
        self.rightBtn.userInteractionEnabled = YES;
    }
}

- (void)setLeftBtnTitle:(NSString *)leftBtnTitle RightBtnTitleWith:(NSString *)rightBtnTitle
{
    [self.leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [self.leftBtn setTitle:leftBtnTitle forState:UIControlStateNormal];
    [self.rightBtn setTitle:rightBtnTitle forState:UIControlStateNormal];
    
    leftBtnTitleStr = leftBtnTitle;
    rightBtnTitleStr = rightBtnTitle;
    
    if (leftBtnTitle==nil&&leftBtnImage==nil){
        self.leftBtn.userInteractionEnabled = NO;
    }else{
        self.leftBtn.userInteractionEnabled = YES;
    }
    
    if (rightBtnTitle==nil&&rightBtnImage==nil) {
        self.rightBtn.userInteractionEnabled = NO;
    }else{
        self.rightBtn.userInteractionEnabled = YES;
    }
}

//透明navgationbar
- (UIView *)overlay
{
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)emptyImage
{
    return objc_getAssociatedObject(self, &emptyImageKey);
}

- (void)setEmptyImage:(UIImage *)image
{
    objc_setAssociatedObject(self, &emptyImageKey, image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)lt_setBackgroundColor:(UIColor *)backgroundColor
{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new]];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.frame.size.height)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = backgroundColor;
    
}
- (void)lt_setContentAlpha:(CGFloat)alpha
{
    if (!self.overlay) {
        [self lt_setBackgroundColor:self.barTintColor];
    }
    [self setAlpha:alpha forSubviewsOfView:self];
    if (alpha == 1) {
        if (!self.emptyImage) {
            self.emptyImage = [UIImage new];
        }
        self.backIndicatorImage = self.emptyImage;
    }
}
- (void)lt_setTranslationY:(CGFloat)translationY
{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}
- (void)lt_reset
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self setShadowImage:nil];
    
    [self.overlay removeFromSuperview];
    self.overlay = nil;
}
- (void)setAlpha:(CGFloat)alpha forSubviewsOfView:(UIView *)view
{
    for (UIView *subview in view.subviews) {
        if (subview == self.overlay) {
            continue;
        }
        subview.alpha = alpha;
        [self setAlpha:alpha forSubviewsOfView:subview];
    }
}
@end
