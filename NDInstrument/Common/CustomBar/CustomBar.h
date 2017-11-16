//
//  CustomBar.h
//  FYXLook
//
//  Created by user on 13-10-8.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHTickerView.h"
@protocol CustomBarDelegate <NSObject>
@optional
- (void)leftBtnClick;
- (void)rightBtnClick;
- (void)shareBtnClick;
@end

@interface CustomBar : UINavigationBar
{
    UIImageView   *_topImageView;
    UIButton      *_leftBtn;
    UIButton      *_rightBtn;
    UIButton      *_shareBtn;
    UILabel       *_titleLab;
    NSString      *_titleStr;

}

@property (nonatomic,strong) UILabel   *titleLab;
@property (nonatomic,strong) UIButton  *leftBtn;
@property (nonatomic,strong) UIButton  *rightBtn;
@property (nonatomic,strong) NSString  *titleStr;
@property (nonatomic,strong) UIButton  *shareBtn;
@property (nonatomic,strong) JHTickerView *tickerView;

@property (nonatomic,weak  )  id<CustomBarDelegate> customdelegate;

- (id)initWithFrame:(CGRect)frame;

- (void)setLeftBtnImage:(UIImage *)aImage;
- (void)setRightBtnImage:(UIImage*)aImage;
- (void)setshareBtnImage:(UIImage*)aImage;

- (void)setRightBtnTitle:(NSString *)title;
- (void)setLeftBtnTitle:(NSString *)title;

- (void)setLeftBtnImgWith:(UIImage *)leftBtnImg RightBtnImgWith:(UIImage *)rightBtnImg;
- (void)setLeftBtnTitle:(NSString *)leftBtnTitle RightBtnTitleWith:(NSString *)rightBtnTitle;

- (void)lt_setBackgroundColor:(UIColor *)backgroundColor;
- (void)lt_setContentAlpha:(CGFloat)alpha;
- (void)lt_setTranslationY:(CGFloat)translationY;
- (void)lt_reset;
@end
