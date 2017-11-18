//
//  ClassSelectedViewController.m
//  NDInstrument
//
//  Created by miss on 2017/11/18.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "ClassSelectedViewController.h"
#import "KegelViewController.h"
#import "NeiDiaoViewController.h"
#import "JinZhiViewController.h"
@interface ClassSelectedViewController ()

@end

@implementation ClassSelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.cusBar.titleStr = @"课程选择";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)kegelEvent:(UIButton *)sender {
    
    KegelViewController *vc = [KegelViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)neidiaoEvent:(UIButton *)sender {
    NeiDiaoViewController *vc = [NeiDiaoViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)jinzhiEvent:(UIButton *)sender {
    JinZhiViewController *vc = [JinZhiViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - event

@end
