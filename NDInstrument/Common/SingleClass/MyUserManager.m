//
//  MyUserShare.m
//  ChmtechIOS
//
//  Created by taixiangwang on 15/10/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "MyUserManager.h"

@interface MyUserManager ()

@end

@implementation MyUserManager

static MyUserManager *userManager = nil;

+ (MyUserManager *)shareInstance
{
    if (userManager==nil) {
        userManager = [[MyUserManager alloc]init];
    }
    
    return userManager;
}

@end
