//
//  BLEManager.m
//  BLE_Test
//
//  Created by 吴淼 on 2017/11/18.
//  Copyright © 2017年 wumiao. All rights reserved.
//

#import "BLEManager.h"
#import "number.h"
@implementation BLEManager

+ (BLEManager *)getInstance {
    static BLEManager *sharedInstance;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        sharedInstance = [[self alloc] init];
        
    });
    
    return sharedInstance;
    
}
- (instancetype)init {
    self = [super init];
    
    if (self) {
        
        self.ble.delegate = self;
        
    }
    return self;
}
#pragma mark ------------BleHelperDelegate
//扫描结束
- (void)scannFinish:(NSMutableDictionary *)bleDic {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"scannFinish" object:bleDic];
    
}
//连接设备成功
- (void)connectSuccess:(CBPeripheral *)per {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"connectSuccess" object:per];
    
}
//连接失败
- (void)connectFailed {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"connectFailed" object:nil];
    
}
//由于距离等一些原因，设备断开连接
- (void)disConnectWithDevice {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"disConnectWithDevice" object:nil];
    
}
//蓝牙被打开
- (void)blePowerOn {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"blePowerOn" object:nil];
    
}
//蓝牙被关闭
- (void)blePowerOff {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"blePowerOff" object:nil];
    
}
//发送数据成功
- (void)sendDataScuccess:(NSData *)backData {
    
    NSString *dataString = [number stringWithHexBytes2:backData];
    
    NSLog(@"收到的数据:%@",dataString);
    
    if ([dataString hasPrefix:@"010300"]) {
        
        NSInteger n = strtoul([[dataString substringWithRange:NSMakeRange(6, 4)] UTF8String], 0, 16);
        
        NSString *string = [NSString stringWithFormat:@"%ld",n];
        
        //压力数据通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getPressureValue" object:string];

    }else if ([dataString hasPrefix:@"01060068"]) {
        
        NSInteger n = strtoul([[dataString substringWithRange:NSMakeRange(10, 2)] UTF8String], 0, 16);
        
        NSString *string = [NSString stringWithFormat:@"%ld",n];
        
        //当前模式通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectionModel" object:string];
        
    }else if ([dataString hasPrefix:@"01060066"]) {
        
        NSInteger n = strtoul([[dataString substringWithRange:NSMakeRange(10, 2)] UTF8String], 0, 16);
        
        NSString *string = [NSString stringWithFormat:@"%ld",n];
        
        //启停电击通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectionClick" object:string];
        
    }else if ([dataString hasPrefix:@"01060067"]) {
        
        NSInteger n = strtoul([[dataString substringWithRange:NSMakeRange(10, 2)] UTF8String], 0, 16);
        
        NSString *string = [NSString stringWithFormat:@"%ld",n];
        
        //电流强度通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectionStrength" object:string];
        
    }
    
}
@end
