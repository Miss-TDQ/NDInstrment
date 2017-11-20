//
//  WLSubView.m
//  WLScrollView
//
//  Created by 张子豪 on 2017/11/16.
//  Copyright © 2017年 张子豪. All rights reserved.
//

#import "WLSubView.h"

@interface WLSubView ()
{
    CGPoint isPoint;
}

@end

@implementation WLSubView

- (instancetype)initWithFrame:(CGRect)frame Identifier:(NSString *)indentifier{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.identifier = indentifier;
        
        [self createUI];

    }
    return self;
}

#pragma mark - 重写

- (void)createUI{
    
    //by wumiao
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 238/4, self.frame.size.height - 76/2 - 86/2, 238/2, 76/2)];
    [button setImage:[UIImage imageNamed:@"kaishijiance_11"] forState:UIControlStateNormal];
    button.adjustsImageWhenHighlighted =NO;
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.im];
    [self addSubview:button];
}

- (void)onClick {
    if (self.delegate
        && [self.delegate respondsToSelector:@selector(didSelectedRespond)]) {
        [self.delegate didSelectedRespond];
    }
}


#pragma mark - touchesDelegate

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    isPoint = [touch locationInView:self];
}
/*
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint Point = [touch locationInView:self];
    if (Point.x == isPoint.x && Point.y == isPoint.y
        && self.delegate
        && [self.delegate respondsToSelector:@selector(didSelectedRespond)]) {
        [self.delegate didSelectedRespond];
    }
}
 */
- (UIImageView *)im{
    if (!_im) {
        _im = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
    return _im;
}

@end
