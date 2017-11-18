//
//  NDInstrment.m
//  RongCardBleSDK
//
//  Created by 吴淼 on 2017/11/18.
//  Copyright © 2017年 Rover. All rights reserved.
//

#import "NDInstrment.h"
#import "number.h"
@implementation NDInstrment

/**
 *  获取压力值
 */
+ (NSData *)getPressureValue {
    
    NSString *s = @"0103000200010000";
    
    NSData *data = [number hexToBytes:s];
    
    return data;
    
}

/**
 *  选择模式
 *  @param num 模式（1-18）
 */
+ (NSData *)SelectionModel:(NSInteger)num {
    
    //防止选择的模式不存在
    if (num < 1) {
        
        num = 1;
        
    }else if (num > 18) {
        
        num = 18;
        
    }
    
    NSString *s = [NSString stringWithFormat:@"0106006800%02lx0000",num];
    
    NSData *data = [number hexToBytes:s];
    
    return data;
    
}

/**
 *  启停电击
 *  @param flat YES开启，NO停止
 */
+ (NSData *)SelectionClick:(BOOL)flat {
    
    NSString *s = @"";
    
    if (flat) {
        
        s = @"0106006600010000";
        
    }else {
        
        s = @"0106006600000000";
        
    }
    
    NSData *data = [number hexToBytes:s];
    
    return data;
    
}

/**
 *  选择电流强度
 *  @param num 强度（0-90）
 */
+ (NSData *)SelectionStrength:(NSInteger)num {
    
    //防止选择的强度不存在
    if (num < 0) {
        
        num = 0;
        
    }else if (num > 90) {
        
        num = 90;
        
    }
    
    NSString *s = [NSString stringWithFormat:@"0106006700%02lx0000",num];
    
    NSData *data = [number hexToBytes:s];
    
    return data;
    
}

@end
