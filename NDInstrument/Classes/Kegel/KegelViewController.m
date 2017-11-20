//
//  KegelViewController.m
//  NDInstrument
//
//  Created by miss on 2017/11/15.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "KegelViewController.h"
#import "WLScrollView.h"
#import "KegelClassViewController.h"
@interface KegelViewController ()<WLScrollViewDelegate>
@property (nonatomic, strong) WLScrollView *wlScrView;
@property (nonatomic, strong) NSMutableArray *imageArray;
@end

@implementation KegelViewController
{
    CGFloat ratio;     //按6比例适配
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [MyUserManager shareInstance].isCanDragBack=NO;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [MyUserManager shareInstance].isCanDragBack = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.cusBar.titleStr = @"凯格尔训练";
    
    ratio = SCREENWIDTH/375;
    
    NSArray * itemsImg = @[@"zhanlizishi_03",@"pingtangzishi_03",@"xiadunzishi_03",@"ziyouzishi_03"];
    for (int i = 0;i<itemsImg.count;i++) {
        UIImage *image = [UIImage imageNamed:itemsImg[i]];
        [self.imageArray addObject:image];
    }
    
    [self addFelicityView];
}
//-(void)leftBtnClick
//{
//    [self.navigationController popViewControllerAnimated:NO];
//}
- (void)addFelicityView {
    
    self.wlScrView = [[WLScrollView alloc]initWithFrame:CGRectMake(0, 133, SCREENWIDTH, 753/2*ratio)];
    self.wlScrView.delegate = self;
    self.wlScrView.isAnimation = YES;
    self.wlScrView.scale = 0.7;
    self.wlScrView.marginX = 10;
    self.wlScrView.maxAnimationScale = 1;
    self.wlScrView.minAnimationScale = 0.8;
    self.wlScrView.backgroundColor = [UIColor clearColor];
    [self.wlScrView starRender];
    [self.view addSubview:self.wlScrView];
    
}

#pragma mark - WLScrollViewDelegate
- (NSInteger)numOfContentViewScrollView:(WLScrollView *)scrollView{
    return self.imageArray.count;
}

- (WLSubView *)scrollView:(WLScrollView *)scrollView subViewFrame:(CGRect)frame cellAtIndex:(NSInteger)index {
    
    NSString *cellID = @"cell";
    WLSubView *sub = [scrollView dequeueReuseCellWithIdentifier:cellID];
    if (!sub) {
        sub = [[WLSubView alloc] initWithFrame:frame Identifier:cellID];
    }
    sub.im.image = self.imageArray[index];
    return sub;
}

- (void)scrollView:(WLScrollView *)scrollView didSelectedAtIndex:(NSInteger)index {
    NSLog(@"点击 index %zd",index);
    KegelClassViewController *vc = [[KegelClassViewController alloc] init];
    vc.type = (int)index;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)scrollView:(WLScrollView *)scrollView didCurrentCellAtIndex:(NSInteger)index {
    NSLog(@"现在显示的 index %zd",index);
}

#pragma mark --懒加载
- (NSMutableArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}
@end
