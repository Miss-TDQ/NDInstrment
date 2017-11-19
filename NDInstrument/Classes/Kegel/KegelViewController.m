//
//  KegelViewController.m
//  NDInstrument
//
//  Created by miss on 2017/11/15.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "KegelViewController.h"
#import "HXCardSwitchView.h"
#import "KegelClassViewController.h"
@interface KegelViewController ()<HXCardSwitchViewDelegate>

@property (nonatomic,strong) HXCardSwitchView *cardSwitchView;
@property (nonatomic,strong) UIPageControl *pageControl;

@end

@implementation KegelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.cusBar.titleStr = @"凯格尔训练";
    
    [self addFelicityView];
}

- (void)addFelicityView {
    _cardSwitchView = [[HXCardSwitchView alloc] initWithFrame:CGRectMake(0, (SCREENHEIGHT - 377)/2 - 50, self.view.frame.size.width, 377)];
    [_cardSwitchView setCardSwitchViewAry:[self ittemsCardViewAry] delegate:self];
    [self.view addSubview:_cardSwitchView];
    
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.frame = CGRectMake(SCREENWIDTH/2 - 20/2, CGRectGetMaxY(_cardSwitchView.frame)+16, 50, 5);
    self.pageControl.numberOfPages = 4;
    _pageControl.currentPage = 0;
    _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:201/255.0 green:201/255.0 blue:201/255.0 alpha:1.0];
    _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:201/255.0 green:159/255.0 blue:92/255.0 alpha:1.0];
    [self.view addSubview:_pageControl];
}

- (NSArray *)ittemsCardViewAry
{
    NSMutableArray *ary = [NSMutableArray new];
    
    NSArray * itemsImg = @[@"zhanlizishi_03",@"pingtangzishi_03",@"xiadunzishi_03",@"ziyouzishi_03"];
    
    for (int i = 0;i<itemsImg.count;i++) {
        
        UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 233, 377)];
        backImageView.image = [UIImage imageNamed:itemsImg[i]];
        backImageView.userInteractionEnabled = YES;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 119, 43);
        button.center = CGPointMake(backImageView.frame.size.width/2, backImageView.frame.size.height - button.frame.size.height/2 - 43);
        [button setBackgroundImage:[UIImage imageNamed:@"dianjijinru_03"] forState:UIControlStateNormal];
        button.tag = 100+i;
        [button addTarget:self action:@selector(classEvent:) forControlEvents:UIControlEventTouchUpInside];
        [backImageView addSubview:button];
        [ary addObject:backImageView];
    }
    return ary;
}

#pragma mark - HXCardSwitchView delegate
- (void)cardSwitchViewDidScroll:(HXCardSwitchView *)cardSwitchView index:(NSInteger)index
{
    [self.pageControl setCurrentPage:index];
}

#pragma mark - button event
- (void)classEvent:(UIButton *)button{
    KegelClassViewController *vc = [KegelClassViewController new];
    vc.type = (KEGELTYPE)(button.tag - 100);
    [self.navigationController pushViewController:vc animated:YES];
}
@end
