//
//  ViewController.m
//  NDInstrument
//
//  Created by miss on 2017/11/15.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "HomeViewController.h"
#import "ClassSelectedViewController.h"
@interface HomeViewController ()

@property (nonatomic,strong) UIButton *deviceBtn;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.cusBar.titleStr = @"首页";
    self.deviceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.deviceBtn addTarget:self action:@selector(classSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.deviceBtn setBackgroundImage:[UIImage imageNamed:@"neidiaoyi_03"] forState:UIControlStateNormal];
    self.deviceBtn.frame = CGRectMake((SCREENWIDTH - FitSizeValueWidth(345))/2, 15+CGRectGetHeight(self.cusBar.frame), FitSizeValueWidth(345), FitSizeValueHeight(216));
    [self.view addSubview:self.deviceBtn];
}

- (void)classSelected:(UIButton *)button{
    ClassSelectedViewController *classVC = [ClassSelectedViewController new];
    [self.navigationController pushViewController:classVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
