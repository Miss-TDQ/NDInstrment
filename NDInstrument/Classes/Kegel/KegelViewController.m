//
//  KegelViewController.m
//  NDInstrument
//
//  Created by miss on 2017/11/15.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "KegelViewController.h"
#import "HXCardSwitchView.h"
@interface KegelViewController ()<HXCardSwitchViewDelegate>

@property (nonatomic,strong) HXCardSwitchView *cardSwitchView;

@end

@implementation KegelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.cusBar.titleStr = @"凯格尔训练";
    
    [self addFelicityView];
}

- (void)addFelicityView {
    _cardSwitchView = [[HXCardSwitchView alloc] initWithFrame:CGRectMake(0, (SCREENHEIGHT - 377)/2, self.view.frame.size.width, 377)];
    [_cardSwitchView setCardSwitchViewAry:[self ittemsCardViewAry] delegate:self];
    [self.view addSubview:_cardSwitchView];
}

- (NSArray *)ittemsCardViewAry
{
    NSMutableArray *ary = [NSMutableArray new];
    
    NSArray * itemsImg = @[@"zhanlizishi_03",@"pingtangzishi_03",@"xiadunzishi_03",@"ziyouzishi_03"];
    
    for (NSString *bgImgName in itemsImg) {
        
        UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 233, 377)];
        backImageView.image = [UIImage imageNamed:bgImgName];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 122, 43);
        button.center = CGPointMake(backImageView.frame.size.width/2, backImageView.frame.size.height - button.frame.size.height/2 - 10);
        [button setBackgroundImage:[UIImage imageNamed:@"dianjijinru_03"] forState:UIControlStateNormal];
        
        [backImageView addSubview:button];
        [ary addObject:backImageView];
    }
    return ary;
}

#pragma mark - HXCardSwitchView delegate
- (void)cardSwitchViewDidScroll:(HXCardSwitchView *)cardSwitchView index:(NSInteger)index
{
    
}
@end
