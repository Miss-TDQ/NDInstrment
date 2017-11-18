//
//  BLEManager.h
//  BLE_Test
//
//  Created by 吴淼 on 2017/11/18.
//  Copyright © 2017年 wumiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLeHelper.h"
@interface BLEManager : NSObject<BleHelperDelegate>

@property (nonatomic, strong) BLeHelper *ble;

+ (BLEManager *)getInstance;

@end
