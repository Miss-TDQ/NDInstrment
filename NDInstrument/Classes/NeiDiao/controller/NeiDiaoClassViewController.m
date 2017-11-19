//
//  NeiDiaoClassViewController.m
//  NDInstrument
//
//  Created by 吴淼 on 2017/11/18.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "NeiDiaoClassViewController.h"

@interface NeiDiaoClassViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *StrengthLabel;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;

@end

@implementation NeiDiaoClassViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[BLEManager getInstance].ble writeValueToDevice:[NDInstrment SelectionModel:1]];
    
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getPressure:) name:@"SelectionModel" object:nil];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    self remov
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)getPressure:(NSNotification *)noti{

    NSLog(@"value ;;;%@",noti.object);
}

- (IBAction)add:(id)sender {
}

- (IBAction)reduce:(id)sender {
}

- (IBAction)stop:(id)sender {
}

@end
