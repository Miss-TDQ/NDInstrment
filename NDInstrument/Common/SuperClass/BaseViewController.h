//
//  BaseViewController.h
//  NDInstrument
//
//  Created by miss on 2017/11/15.
//  Copyright © 2017年 miss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomBar.h"
@interface BaseViewController : UIViewController<CustomBarDelegate>
/**导航栏*/
@property (nonatomic,strong) CustomBar         *cusBar;
/**导航栏名称*/
@property (nonatomic,strong) NSString          *titleStr;

@property (nonatomic,strong) UIImageView       *bgImageView;
@end
