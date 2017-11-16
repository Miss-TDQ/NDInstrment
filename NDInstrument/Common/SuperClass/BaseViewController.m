//
//  BaseViewController.m
//  NDInstrument
//
//  Created by miss on 2017/11/15.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showCutomBar];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    if ([self.titleStr length] > 0 )
    {
        self.cusBar.titleStr = self.titleStr;
    }

    self.bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    self.bgImageView.image = [UIImage imageNamed:@""];//背景图默认图片
    
    [self.view addSubview:self.bgImageView];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)showCutomBar
{
    self.navigationController.navigationBarHidden = YES;
    if([SDiPhoneVersion deviceSize] == iPhoneXinch){
        self.cusBar = [[CustomBar alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH,  44 + 44)];
    }else{
        self.cusBar = [[CustomBar alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH,  20 + 44)];
    }
    
    [self.view addSubview:self.cusBar];
    [self.cusBar lt_setBackgroundColor:[UIColor clearColor]];
    self.cusBar.tickerView.tickerLabel.textColor = [UIColor colorWithRed:202/255.0 green:163/255.0 blue:127/255.0 alpha:1.0];
    self.cusBar.customdelegate = self;
    [self.cusBar setLeftBtnImgWith:[UIImage imageNamed:@"back_arrow"] RightBtnImgWith:nil];
    
}

@end
