//
//  MyUserShare.h
//  ChmtechIOS
//
//  Created by taixiangwang on 15/10/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUserManager : NSObject

/**
 *   单例对象 用来保存一些信息
 */
+ (MyUserManager *)shareInstance;

//是否支持右滑返回
@property (nonatomic,assign) BOOL isCanDragBack;


@end
