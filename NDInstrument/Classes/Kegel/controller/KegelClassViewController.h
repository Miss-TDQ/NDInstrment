//
//  KegelClassViewController.h
//  NDInstrument
//
//  Created by miss on 2017/11/18.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "BaseViewController.h"
typedef NS_ENUM(int,KEGELTYPE)
{
    KEGELTYPE_ZHANLI   = 0,
    KEGELTYPE_PINGTANG = 1,
    KEGELTYPE_XIADUN   = 2,
    KEGELTYPE_ZIYOU    = 3
};
@interface KegelClassViewController : BaseViewController

@property (nonatomic)KEGELTYPE type;

@end
