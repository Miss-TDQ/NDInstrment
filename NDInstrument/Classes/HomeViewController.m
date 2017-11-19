//
//  ViewController.m
//  NDInstrument
//
//  Created by miss on 2017/11/15.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "HomeViewController.h"
#import "ClassSelectedViewController.h"
#import "SearchBluetoothViewController.h"
#import "BluetoothListViewController.h"
@interface HomeViewController ()

@property (nonatomic,strong) UIButton *deviceBtn;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.cusBar.titleStr = @"首页";
//    [self.cusBar setRightBtnTitle:@""];
    self.deviceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.deviceBtn addTarget:self action:@selector(classSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self.deviceBtn setBackgroundImage:[UIImage imageNamed:@"neidiaoyi_03"] forState:UIControlStateNormal];
    self.deviceBtn.frame = CGRectMake((SCREENWIDTH - FitSizeValueWidth(345))/2, 15+CGRectGetHeight(self.cusBar.frame), FitSizeValueWidth(345), FitSizeValueHeight(216));
    [self.view addSubview:self.deviceBtn];
    
    //添加右上角BLE按钮--by wumiao
    self.cusBar.rightBtn.frame = CGRectMake(SCREENWIDTH - 16 - 12, 30, 16, 21);
    [self.cusBar setRightBtnImage:[UIImage imageNamed:@"lanya_03"]];
}

- (void)rightBtnClick {
    
    if ([BLEManager getInstance].ble.connectPer) {//判断是非连接设备
        
        BluetoothListViewController *list = [[BluetoothListViewController alloc] init];
        
        [self.navigationController pushViewController:list animated:YES];
        
    }else {
        
        SearchBluetoothViewController *search = [[SearchBluetoothViewController alloc] init];
        
        [self.navigationController pushViewController:search animated:YES];
        
    }
    
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
