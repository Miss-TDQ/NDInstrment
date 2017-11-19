//
//  NeiDiaoViewController.m
//  NDInstrument
//
//  Created by miss on 2017/11/18.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "NeiDiaoViewController.h"
#import "NeiDiaoClassViewController.h"
@interface NeiDiaoViewController ()

@end

@implementation NeiDiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.cusBar.titleStr = @"私密紧致内雕";
}

- (IBAction)onClick:(id)sender {
    NeiDiaoClassViewController *vc = [NeiDiaoClassViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end
