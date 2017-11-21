//
//  lineView.m
//  test
//
//  Created by 吴淼 on 2017/11/21.
//  Copyright © 2017年 wumiao. All rights reserved.
//

#import "lineView.h"

@implementation lineView
{
    NSMutableArray *dataArray;
    CGFloat point;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        dataArray = [NSMutableArray array];
        
        point = frame.size.height;
        
        [self initUI];
        
    }
    return self;
}

- (void)initUI {
    
    UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, point/2, [UIScreen mainScreen].bounds.size.width, 1)];
    
    lineLab.backgroundColor = [UIColor greenColor];
    
    [self addSubview:lineLab];
    
}

- (void)addData:(NSInteger)num {
    
    for (UILabel *label in dataArray) {
        
        CGRect rect = label.frame;
        //删除超出view的线条
        if (rect.origin.x >= self.frame.size.width) {
            
            [label removeFromSuperview];
            
        }
        
        rect.origin.x += 5;
        
        label.frame = rect;
        
    }
    
    NSInteger len = 0;
    
    if (num <= 10) {
        
        len = 5;
        
    }else if (num > 10 && num <= 30) {
        
        len = 7;
        
    }else if (num > 10 && num <= 30) {
        
        len = 11;
        
    }else if (num > 30 && num <= 80) {
        
        len = 15;
        
    }else if (num > 80 && num <= 150) {
        
        len = 21;
        
    }else if (num > 150 && num <= 200) {
        
        len = 31;
        
    }
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(2, point/2- (len - 1)/2, 1, len)];
    
    lab.backgroundColor = [UIColor greenColor];
    
    [self addSubview:lab];
    
    [dataArray addObject:lab];
    
}

@end
