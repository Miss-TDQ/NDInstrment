//
//  BLeHelper.h
//  testBleStable
//
//  Created by Rover on 16/7/6.
//  Copyright © 2016年 Rover. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreBluetooth/CoreBluetooth.h>

@protocol BleHelperDelegate <NSObject>
@optional

- (void)findNewDevice:(CBPeripheral *)per;                  //发现新的设备

- (void)scannFinish:(NSMutableDictionary *)bleDic;          //搜索结束

- (void)connectSuccess:(CBPeripheral *)per;                 //连接设备成功

- (void)connectFailed;                                      //连接失败

- (void)disConnectWithDevice;                               //由于距离等一些原因，设备断开连接

- (void)blePowerOn;                                         //蓝牙被打开

- (void)blePowerOff;                                        //蓝牙被关闭

- (void)sendDataScuccess:(NSData *)backData;                //发送数据成功

@end


@interface BLeHelper : NSObject<BleHelperDelegate>{
    int                                 scannTime;
}
@property (assign)            int                               scannTime;      //扫描时间长度
@property (assign)            int                               connectTime;      //连接时间长度
@property (nonatomic, retain) CBPeripheral                    *connectPer;      //连接成功的外设

@property (nonatomic, retain) CBCentralManager                *CBble;

@property (nonatomic, weak) id<BleHelperDelegate>             delegate;

//初始化
- (id)initBabyBle;

//开始扫描
- (void)startScann;

//停止扫描
- (void)stopScann;

//查询扫描状态,YES:在扫描,NO:没有在扫描
- (BOOL)queryScanStatus;

//查询连接状态(设备能通讯),YES:已连接,NO:没有连接设备
- (BOOL)queryConnectStatus;

//连接某一个设备，isneedAutoReconnect：是否需要自动重连
- (void)connectDevice:(CBPeripheral *)per isneedAutoReconnect:(BOOL)flag;

//根据设备uuid连接设备，默认启动自动连接
- (void)connectSpecificDevice:(NSString *)UUIDString;

//断开连接
- (void)breakConnect;

//往设备写值
- (void)writeValueToDevice:(NSData *)data;

//COS升级
- (void)writeValueToCOSDevice:(NSData *)data;

//获取当前的连接设备，如果返回的数组为空，则表示无连接,数组中连接的设备还不能通讯
- (NSArray *)getConnectedBleDevice;

//销毁ble单例（谨慎使用）
- (void)attemptDalloc;



@end
