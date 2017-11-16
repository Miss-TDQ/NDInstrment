//
//  CustomTabBar.m
//
//  Created by chmtech003 on 14-8-28.
//  Copyright (c) 2014年 Chmtech. All rights reserved.
//

#import "CustomTabBar.h"

@interface CustomTabBar ()

@end

@implementation CustomTabBar
@synthesize badgeAry;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)creatBadgeButton
{
    self.badgeAry = [[NSMutableArray alloc]init];
    NSArray *viewCtrlAry = self.viewControllers;
    NSInteger ctrls = viewCtrlAry.count;
    if (ctrls>0)
    {
        for (int i=0; i<viewCtrlAry.count; i++)
        {
            UIButton *badgeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            badgeBtn.backgroundColor = [UIColor clearColor];
            badgeBtn.frame = CGRectMake((SCREENWIDTH/ctrls)*(1+i)-(SCREENWIDTH/ctrls)/2.+ 30/2., 5, 18, 18);
            [badgeBtn.layer setCornerRadius:9];
            [badgeBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 6, 0)];
            badgeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            badgeBtn.titleLabel.textColor = [UIColor whiteColor];
            badgeBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
            badgeBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
            badgeBtn.userInteractionEnabled = NO;
            [self.tabBar addSubview:badgeBtn];
            [self.badgeAry addObject:badgeBtn];
        }
    }
}

-(void)setBadgeWithString:(NSString*)badge andIndex:(int)index
{
    if (index>self.badgeAry.count-1&&self.badgeAry.count==0)
    {
        return;
    }
    NSArray *bagAry = self.badgeAry;
    UIButton *button = [bagAry objectAtIndex:index];
    
    if ([badge isEqualToString:@"0"]||badge == nil)
    {
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:nil forState:UIControlStateNormal];
    }
    else{
        button.backgroundColor = [UIColor orangeColor];
        [button setTitle:badge forState:UIControlStateNormal];
    }
}

-(void)creatDropImgView
{
    self.dropImgAry = [[NSMutableArray alloc]init];
    NSArray *viewCtrlAry = self.viewControllers;
    NSInteger ctrls = viewCtrlAry.count;
    if (ctrls>0)
    {
        for (int i=0; i<viewCtrlAry.count; i++)
        {
            UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bar_dropRed"]];
            img.backgroundColor = [UIColor clearColor];
            img.frame = CGRectMake((SCREENWIDTH/ctrls)*(1+i)-(SCREENWIDTH/ctrls)/2.3, 5, 8, 8);
            img.hidden = YES;
            [self.tabBar addSubview:img];
            [self.dropImgAry addObject:img];
        }
    }
}

-(void)setDropImgShow:(BOOL)show andIndex:(int)index
{
    if (index > (self.dropImgAry.count-1))
    {
        return;
    }
    
    if (self.dropImgAry.count > 0 && index >= 0) {
        UIImageView *img = [self.dropImgAry objectAtIndex:index];
        img.hidden = !show;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
