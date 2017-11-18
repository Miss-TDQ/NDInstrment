//
//  NDInstrment.h
//  RongCardBleSDK
//
//  Created by 吴淼 on 2017/11/18.
//  Copyright © 2017年 Rover. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NDInstrment : NSObject

/**
 *  获取压力值
 */
+ (NSData *)getPressureValue;

/**
 *  选择模式
 *  @param num 模式（1-18）
 */
+ (NSData *)SelectionModel:(NSInteger)num;

/**
 *  启停电击
 *  @param flat YES开启，NO停止
 */
+ (NSData *)SelectionClick:(BOOL)flat;

/**
 *  选择电流单强度
 *  @param num 强度（0-90）
 */
+ (NSData *)SelectionStrength:(NSInteger)num;
@end
