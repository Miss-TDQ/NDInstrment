//
//  KegelClassViewController.m
//  NDInstrument
//
//  Created by miss on 2017/11/18.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "KegelClassViewController.h"

@interface KegelClassViewController ()
{
    NSTimer *_pointAnimationTimer;
    NSInteger _pointAnimationValue;
}
@property (weak, nonatomic) IBOutlet UIImageView *topImg;
@property (weak, nonatomic) IBOutlet UILabel *todayTargetLab;
@property (weak, nonatomic) IBOutlet UILabel *durationLab;
@property (weak, nonatomic) IBOutlet UILabel *exerciseTimeLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;

@property (weak, nonatomic) IBOutlet UIView *pointView;
@end

@implementation KegelClassViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if(_pointAnimationTimer){
        [_pointAnimationTimer invalidate];
        _pointAnimationTimer = nil;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    switch (_type) {
        case KEGELTYPE_ZIYOU:
            self.cusBar.titleStr = @"自由姿势";break;
        case KEGELTYPE_XIADUN:
            self.cusBar.titleStr = @"下蹲姿势";break;
        case KEGELTYPE_ZHANLI:
            self.cusBar.titleStr = @"站立姿势";break;
        case KEGELTYPE_PINGTANG:
            self.cusBar.titleStr = @"平躺姿势";break;
        default:
            break;
    }
    [self layoutPointView];
    
    [self startPointAnimation];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopPointAnimation];
    });
}
-(void)layoutPointView
{
    CGFloat width = 7;
    CGFloat offset = 5;
    for(int i = 0;i<10;i++){
        UIImageView *point = [[UIImageView alloc]initWithFrame:CGRectMake(offset*i+width*i, 0, width, width)];
        point.image = [UIImage imageNamed:@"dian_11"];
        point.tag = 1024+i;
        [self.pointView addSubview:point];
    }
}
#pragma mark - 开启和关闭播放时点动画
- (void)startPointAnimation{
    _pointAnimationTimer= [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(pointAnimation) userInfo:nil repeats:YES];
}
- (void)stopPointAnimation{
    [_pointAnimationTimer invalidate];
    _pointAnimationTimer = nil;
    _pointAnimationValue = 0;
    
    for (UIImageView *img in self.pointView.subviews) {
        img.image = [UIImage imageNamed:@"dian_11"];
    }
}
- (void)pointAnimation{
    UIImageView *point = (UIImageView *)[self.view viewWithTag:1024+_pointAnimationValue];
    point.image = [UIImage imageNamed:@"dian_shixin_11"];
    
    if(_pointAnimationValue == 10){
        _pointAnimationValue = 0;
        for (UIImageView *img in self.pointView.subviews) {
            img.image = [UIImage imageNamed:@"dian_11"];
        }
    }else{
        _pointAnimationValue++;
    }
}

#pragma mark - btn event

- (IBAction)frapEvent:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)relaxEvent:(UIButton *)sender {
    sender.selected = !sender.selected;
}
- (IBAction)startEvent:(UIButton *)sender {
    sender.selected = !sender.selected;
}


@end
