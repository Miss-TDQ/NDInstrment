//
//  BLeHelper.m
//  testBleStable
//
//  Created by Rover on 16/7/6.
//  Copyright © 2016年 Rover. All rights reserved.
//

#import "BLeHelper.h"
#import "number.h"
#import "BabyBluetooth.h"
#import "BabyCentralManager.h"

@interface BLeHelper()
@property (nonatomic, retain) NSArray             *sendDataArray;       //需要发送的指令数组
@property (assign)            int                 sendDataCount;        //已经成功发送指令的计数

@property BOOL scanState;                                               //扫描状态

@property (nonatomic, retain) NSString                          *deviceUUID;
@property (nonatomic, retain) NSString                          *serviceUUID;
@property (nonatomic, retain) NSString                          *writeUUID;
@property (nonatomic, retain) NSString                          *serviceCOSUUID;
@property (nonatomic, retain) NSString                          *upgradeUUID;
@property (nonatomic, retain) NSString                          *writeCOSUUID;
@property (nonatomic, retain) NSMutableDictionary               *deviceDic;     //扫描到的设备
@property (nonatomic, retain) CBCharacteristic                  *connectCharacter;    //连接成功的外设的特征
@property (nonatomic, retain) CBCharacteristic                  *connectCOSCharacter;    //连接成功的外设的特征
@property (nonatomic, retain) NSArray                           *characterUUIDArray;
@property (nonatomic, retain) NSArray                           *characterCOSUUIDArray;

@property (nonatomic, strong) BabyBluetooth                     *babyBle;

@property (assign)            int                 conncetChaCount;        //连接成功特征的数量

@property (nonatomic, strong) CBPeripheral                      *p;
@property BOOL connectFlat;
@property BOOL stateFlat;


@end


@implementation BLeHelper
@synthesize babyBle;
@synthesize CBble;
@synthesize deviceDic;
@synthesize delegate;
@synthesize scannTime;
@synthesize connectTime;
@synthesize deviceUUID;
@synthesize serviceUUID;
@synthesize serviceCOSUUID;
@synthesize upgradeUUID;
@synthesize characterUUIDArray;
@synthesize characterCOSUUIDArray;
@synthesize connectCharacter;
@synthesize connectCOSCharacter;
@synthesize writeUUID;
@synthesize writeCOSUUID;
@synthesize scanState;


#pragma mark ------------------------------------------- 初始化
- (id)initBabyBle{
    
    self = [super init];
    if (self != nil) {
        babyBle = [BabyBluetooth shareBabyBluetooth];
        self.CBble = babyBle.centralManager;
        scannTime  = 3;
        connectTime = 10;
        scanState = NO;
        self.stateFlat = NO;
        connectCharacter = nil;
        connectCOSCharacter = nil;
        deviceUUID    = @"FC5E94AF-E763-49AA-9296--7F27A9DE53E0";
        serviceUUID   = @"FFE0";
        writeUUID     = @"FFE1";
        characterUUIDArray = [[NSArray alloc] initWithObjects:
                              @"FFE1",
                              nil];
        
        self.conncetChaCount = 0;
        //设置蓝牙委托
        [self babyDelegate];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopScann) name: @"stopScann" object:nil];

    }
    return self;
}

- (void)attemptDalloc{
    [babyBle attempDealloc];
}


#pragma mark ------------------------------------------- 开始扫描
- (void)startScann {

    deviceDic = [[NSMutableDictionary alloc] init];
    
    //设置babybluetooth运行时参数，查找制定设备，可让程序在进入后台后继续运行
    NSMutableArray *device = [NSMutableArray arrayWithObjects:[CBUUID UUIDWithString:serviceUUID], nil];
    [babyBle setBabyOptionsWithScanForPeripheralsWithOptions:nil connectPeripheralWithOptions:nil scanForPeripheralsWithServices:nil discoverWithServices:device discoverWithCharacteristics:nil];
    babyBle.scanForPeripherals().begin();
    babyBle.scanForPeripherals().stop(scannTime);
    scanState = YES;
}

#pragma mark ------------------------------------------- 停止扫描
- (void)stopScann {
    
    [babyBle cancelScan];
    
    scanState = NO;
    
}

#pragma mark ------------------------------------------- 查询扫描状态
- (BOOL)queryScanStatus {
    
    return scanState;
    
}

#pragma mark ------------------------------------------- 连接某一个设备
- (void)connectDevice:(CBPeripheral *)per isneedAutoReconnect:(BOOL)flag{
    
    [babyBle.centralManager connectPeripheral:per options:nil];
    
    self.stateFlat = NO;
    
    self.p = per;
    
    self.connectFlat = flag;
    //超时处理
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:@selector(outTime)
                                               object:nil];
    
    [self performSelector:@selector(outTime) withObject:nil afterDelay:connectTime];
}

//超时
- (void)outTime {
    
    if (self.stateFlat) {
        
        return;
        
    }
    
    if (!self.connectPer) {
        
        //回调连接失败
        if ([self.delegate respondsToSelector:@selector(connectFailed)]){
            
            [self.delegate connectFailed];
            
        }
        
        [babyBle.centralManager cancelPeripheralConnection:self.p];

        
    }
    
}

#pragma mark ------------------------------------------- 跳开扫描连接特定的设备
- (void)connectSpecificDevice:(NSString *)UUIDString{
    CBPeripheral *per = [babyBle retrievePeripheralWithUUIDString:UUIDString];
    if (per) {
        [babyBle.centralManager connectPeripheral:per options:nil];
        self.connectPer = per;
        [babyBle AutoReconnect:per];
    }else {
        [self.delegate connectFailed];
    }
}
#pragma mark ------------------------------------------- 断开连接
- (void)breakConnect{
    [babyBle AutoReconnectCancel:self.connectPer];
    [babyBle cancelAllPeripheralsConnection];
//    if ([self.delegate respondsToSelector:@selector(connectFailed)]){
//        [self.delegate connectFailed];
//    }
//    [babyBle.centralManager cancelPeripheralConnection:self.connectPer];
}

#pragma mark ------------------------------------------- 获取已连接设备的RSSI值
- (void)getRSSIValueOfConnectDevice{
    if(self.connectPer != nil){
        [self.connectPer readRSSI];
    }
}
#pragma mark ------------------------------------------- 获取正在通讯的外设
- (BOOL)queryConnectStatus {
    
    if (self.connectPer) {
        
        return YES;
        
    }else {
        
        return NO;
        
    }
    
}

#pragma mark ------------------------------------------- 获取连接的外设
- (NSArray *)getConnectedBleDevice{
    return [self.babyBle findConnectedPeripherals];
}

#pragma mark ------------------------------------------- 获取服务、特征
- (NSMutableArray *)getDeviceServices{
    NSMutableArray *servicesUUID = [NSMutableArray arrayWithObjects:[CBUUID UUIDWithString:serviceUUID], nil];
    return servicesUUID;
}


- (void)writeValueToDevice:(NSData *)data{
    if(self.connectPer != nil  && connectCharacter != nil){
        NSString *newString = @"";
        Byte *testByte = (Byte *)[data bytes];
        for (int i = 0; i < [data length]; i++) {
            NSString *newHexStr = [NSString stringWithFormat:@"%02x",testByte[i]&0xff];
            newString = [newString stringByAppendingString:newHexStr];
        }
        if (newString.length/2 <= 20) {
            NSData *newData = [number hexToBytes:newString];
            NSLog(@"======>%@",newString);
            [self.connectPer writeValue:newData forCharacteristic:connectCharacter type:CBCharacteristicWriteWithResponse];
        }else{
            for (NSInteger i = 0; i <= newString.length/40; i++) {
                NSString *fstring = @"";
                if (newString.length/2 > 20 * (i + 1)) {
                    fstring = [newString substringToIndex:40 * (i + 1)];
                    fstring = [fstring substringFromIndex:40 * i];
                }else{
                    fstring = [newString substringToIndex:newString.length];
                    fstring = [fstring substringFromIndex:40 * i];
                }
                NSData *newData = [number hexToBytes:fstring];
                NSLog(@"======>%@",fstring);
                [self.connectPer writeValue:newData forCharacteristic:connectCharacter type:CBCharacteristicWriteWithResponse];
                
            }
        }
    }
}
- (NSString *)replace:(NSString *)string {
    
    NSString *newString = @"";
    
    for (int i = 0; i < string.length/2; i++) {
        
        NSString *ssss = [string substringWithRange:NSMakeRange(i*2, 2)];
        
        if ([ssss isEqualToString:@"db"]) {
            ssss = @"dbdd";
        }
        if ([ssss isEqualToString:@"c0"]) {
            ssss = @"dbdc";
        }
        
        newString = [newString stringByAppendingString:ssss];
        
    }
    
    return newString;
    
}

- (void)writeValueToCOSDevice:(NSData *)data{
    if(self.connectPer != nil  && connectCOSCharacter != nil){
        NSString *newString = @"";
        Byte *testByte = (Byte *)[data bytes];
        for (int i = 0; i < [data length]; i++) {
            NSString *newHexStr = [NSString stringWithFormat:@"%02x",testByte[i]&0xff];
            newString = [newString stringByAppendingString:newHexStr];
        }
        if (newString.length/2 <= 20) {
            //by wumiao
            newString = [newString substringWithRange:NSMakeRange(2, newString.length-4)];
            
            newString = [self replace:newString];
            
            newString = [NSString stringWithFormat:@"c0%@c0",newString];
            NSData *newData = [number hexToBytes:newString];
            [self.connectPer writeValue:newData forCharacteristic:connectCOSCharacter type:CBCharacteristicWriteWithoutResponse];
        }else{
            newString = [newString substringWithRange:NSMakeRange(2, newString.length-4)];
            
            newString = [self replace:newString];
            
            newString = [NSString stringWithFormat:@"c0%@c0",newString];
            
            for (NSInteger i = 0; i <= newString.length/40; i++) {
                NSString *fstring = @"";
                if (newString.length/2 > 20 * (i + 1)) {
                    fstring = [newString substringToIndex:40 * (i + 1)];
                    fstring = [fstring substringFromIndex:40 * i];
                }else{
                    fstring = [newString substringToIndex:newString.length];
                    fstring = [fstring substringFromIndex:40 * i];
                }
                NSData *newData = [number hexToBytes:fstring];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(500 * i * NSEC_PER_USEC)), dispatch_get_main_queue(), ^{
                    [self.connectPer writeValue:newData forCharacteristic:connectCOSCharacter type:CBCharacteristicWriteWithoutResponse];
                });
                
            }
        }
    }
}

#pragma mark ------------------------------------------- 设置蓝牙委托
-(void)babyDelegate {
    __weak BLeHelper *weakSelf = self;
/********************************************/
#pragma mark +++++++++++++++++++++++++++++++++++++++++++ 搜索到外围设备的回调
/********************************************/
    [babyBle setBlockOnDiscoverToPeripherals:^(CBCentralManager *central, CBPeripheral *peripheral, NSDictionary *advertisementData, NSNumber *RSSI) {
        NSLog(@"%@--%@",peripheral.name,RSSI);
        if(peripheral.name.length > 0){
            NSArray *keys = [weakSelf.deviceDic allKeys];
            if(![keys containsObject:peripheral]){
                NSDictionary *dic = [NSDictionary dictionaryWithObject:RSSI
                                                                forKey:peripheral];
                [weakSelf.deviceDic addEntriesFromDictionary:dic];
            }
            /*if ([weakSelf.delegate respondsToSelector:@selector(findNewDevice:)]){
                [weakSelf.delegate findNewDevice:weakSelf.deviceDic];
            }*/
        }
    }];
    
    
/********************************************/
#pragma mark +++++++++++++++++++++++++++++++++++++++++++ 结束扫描操作的回调
/********************************************/
    [babyBle setBlockOnCancelScanBlock:^(CBCentralManager *central){
        
        if ([weakSelf.delegate respondsToSelector:@selector(scannFinish:)]){
            
            [weakSelf.delegate scannFinish:weakSelf.deviceDic];
            
        }
    }];
    
    
/********************************************/
#pragma mark +++++++++++++++++++++++++++++++++++++++++++ 连接设备成功的回调，此时并不知道设备提供的服务和特征
/********************************************/
    [babyBle setBlockOnConnected:^(CBCentralManager *central, CBPeripheral *peripheral) {
        weakSelf.connectPer = peripheral;
        NSLog(@"连接 成功   device = %@",[weakSelf.babyBle findConnectedPeripherals]);
        //找特定的服务
//        [weakSelf.connectPer discoverServices:[weakSelf getDeviceServices]];
        //不指定服务查找
        [weakSelf.connectPer discoverServices:nil];
    }];
    
    
/********************************************/
#pragma mark +++++++++++++++++++++++++++++++++++++++++++ 连接设备失败的回调
/********************************************/
    [babyBle setBlockOnFailToConnect:^(CBCentralManager *central, CBPeripheral *peripheral, NSError *error) {
       NSLog(@"连接 失败 error = %@",error);
        if ([weakSelf.delegate respondsToSelector:@selector(connectFailed)]){
            [weakSelf.delegate connectFailed];
            weakSelf.stateFlat = YES;
        }
    }];
    
    
/********************************************/
#pragma mark +++++++++++++++++++++++++++++++++++++++++++ 捕获蓝牙断开的回调，如距离、断电等
/********************************************/
    [babyBle setBlockOnDisconnect:^(CBCentralManager *central, CBPeripheral *peripheral, NSError *error) {
        NSLog(@"各种原因 断开连接");
        weakSelf.conncetChaCount = 0;
        weakSelf.connectPer = nil;
        weakSelf.connectCharacter = nil;
        weakSelf.connectCOSCharacter = nil;
        if ([weakSelf.delegate respondsToSelector:@selector(disConnectWithDevice)]  && weakSelf.stateFlat){
            [weakSelf.delegate disConnectWithDevice];
        }
//        if(weakSelf.breakBySelf == NO){
//            
//            [weakSelf.babyBle.centralManager connectPeripheral:peripheral options:nil]; //断开连接后重连
//        }
    }];
    
    
/********************************************/
#pragma mark +++++++++++++++++++++++++++++++++++++++++++ 获取手机蓝牙状态的回调，如蓝牙开启，关闭
/********************************************/
    [babyBle setBlockOnCentralManagerDidUpdateState:^(CBCentralManager *central) {
        NSLog(@"当前的蓝牙状态 == %ld",(long)weakSelf.babyBle.centralManager.state);
        if((long)weakSelf.babyBle.centralManager.state == 4){
            if ([weakSelf.delegate respondsToSelector:@selector(blePowerOff)]){
                [weakSelf.delegate blePowerOff];
            }
        }else if ((long)weakSelf.babyBle.centralManager.state == 5){
            if ([weakSelf.delegate respondsToSelector:@selector(blePowerOn)]){
                [weakSelf.delegate blePowerOn];
            }
        }
    }];
   
    
/********************************************/
#pragma mark +++++++++++++++++++++++++++++++++++++++++++ 读取已经连接设备的RSSI回调
/********************************************/
    [babyBle setBlockOnDidReadRSSI:^(NSNumber *RSSI, NSError *error) {
       NSLog(@"当前的蓝牙 RSSI  = %@ ",RSSI );
    }];
    
    
/********************************************/
#pragma mark +++++++++++++++++++++++++++++++++++++++++++ 发现设备服务的回调
/********************************************/
    [babyBle setBlockOnDiscoverServices:^(CBPeripheral *peripheral, NSError *error) {
        
        
        for (CBService *service in peripheral.services){
            /*
            NSLog(@"服务=====%@",service.UUID);
            
            if (![[weakSelf getDeviceServices] containsObject:service.UUID]) {
                
                NSLog(@"不是指定服务：%@",service.UUID);
                
                if ([weakSelf.delegate respondsToSelector:@selector(connectFailed)]){
                    [weakSelf.delegate connectFailed];
                }
                
                return ;
                
            }
         */
            
            NSLog(@"发现外设的服务号为 ------> %@",service.UUID);
            if ([service.UUID isEqual:[CBUUID UUIDWithString:weakSelf.serviceUUID]]){
                NSMutableArray *arr = [[NSMutableArray alloc] init];
                for(int i = 0;i<weakSelf.characterUUIDArray.count;i++){
                    [arr addObject:[CBUUID UUIDWithString:weakSelf.characterUUIDArray[i]]];
                }
                [weakSelf.connectPer discoverCharacteristics:arr forService:service];     //读取服务上的特征
            }
            
        }
    }];
    
    
/********************************************/
#pragma mark +++++++++++++++++++++++++++++++++++++++++++ 发现设备的特征回调
/********************************************/
    [babyBle setBlockOnDiscoverCharacteristics:^(CBPeripheral *peripheral, CBService *service, NSError *error) {
        for (CBCharacteristic *cha in service.characteristics){
            if ([cha.UUID isEqual:[CBUUID UUIDWithString:weakSelf.writeUUID]])
            {
                
                weakSelf.connectCharacter = cha;
                
            }
            
            [weakSelf.babyBle notify:peripheral
                      characteristic:cha
                               block:^(CBPeripheral *peripheral, CBCharacteristic *characteristics, NSError *error) {
                                   //接收到值会进入这个方法
                                   NSLog(@"<=====%@",characteristics.value);
                                   [weakSelf.delegate sendDataScuccess:characteristics.value];
                               }];
            NSLog(@"连接 成功，发现制定的服务和特征  %@",cha);
        }
    }];
    
/********************************************/
#pragma mark +++++++++++++++++++++++++++++++++++++++++++ 写Characteristic成功后的block
/********************************************/
    [babyBle setBlockOnDidWriteValueForCharacteristic:^(CBCharacteristic *characteristic, NSError *error){
//        NSLog(@"写Characteristic成功后的block = %@",characteristic.value);
        
    }];

    
/********************************************/
#pragma mark +++++++++++++++++++++++++++++++++++++++++++ characteristic订阅状态改变的block
/********************************************/
    [babyBle setBlockOnDidUpdateNotificationStateForCharacteristic:^(CBCharacteristic *characteristic, NSError *error) {
        NSLog(@"characteristic订阅状态改变的block = %@",characteristic);
        
        if (characteristic.isNotifying) {
            
            weakSelf.conncetChaCount++;
            
            if (weakSelf.conncetChaCount == self.connectPer.services.count  - 1) {
                
                weakSelf.conncetChaCount = 0;
                
                if ([weakSelf.delegate respondsToSelector:@selector(connectSuccess:)]){
                    
                    [weakSelf.delegate connectSuccess:weakSelf.connectPer];
                    
                    weakSelf.stateFlat = YES;
                    
                    if(self.connectFlat == YES){
                        
                        [weakSelf.babyBle AutoReconnect:weakSelf.connectPer];
                        
                        
                    }

                }
                
            }
            
        }
    }];
    
}



@end
