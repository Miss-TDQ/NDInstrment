//
//  SearchBluetoothViewController.m
//  NDInstrument
//
//  Created by miss on 2017/11/18.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "SearchBluetoothViewController.h"

@interface SearchBluetoothViewController ()

@end

@implementation SearchBluetoothViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(findNewDevice:) name: @"findNewDevice" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(connectSuccess:) name: @"connectSuccess" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(connectFailed:) name: @"connectFailed" object:nil];

    
}
#pragma mark -----通知
//发现新设备
- (void)findNewDevice:(NSNotification *)noti {
    
    NSLog(@"%@",noti);
    
    CBPeripheral *per = noti.object;
    
    if ([per.name hasPrefix:@"VKA"]) {
        
        [[BLEManager getInstance].ble stopScann];
        
        [[BLEManager getInstance].ble connectDevice:per isneedAutoReconnect:YES];
        
    }
    
}
//连接失败
- (void)connectFailed:(NSNotification *)noti {
    
    NSLog(@"连接失败了");
    
}
//连接成功
- (void)connectSuccess:(NSNotification *)noti {
    
    NSLog(@"成功连接!");
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cusBar.titleStr = @"蓝牙连接";
    
}

- (IBAction)bleConnect:(id)sender {
    
    [[BLEManager getInstance].ble startScann];
    
}

@end
