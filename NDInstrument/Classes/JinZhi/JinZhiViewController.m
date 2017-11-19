//
//  JinZhiViewController.m
//  NDInstrument
//
//  Created by miss on 2017/11/18.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "JinZhiViewController.h"
#import "EvaluteResultViewController.h"

typedef NS_ENUM(int,EVALUTEMODE){
    EVALUTEMODE_NULL = 0 ,     //无检测
    EVALUTEMODE_SLOW = 1 ,         //慢肌检测
    EVALUTEMODE_FAST = 2 ,         //快肌检测
    
};
typedef NS_ENUM(int,EVALUTESTATUS){
    EVALUTESTATUS_NULL     = 0,     //未开始
    EVALUTESTATUS_END      = 1,     //自然结束
    EVALUTESTATUS_PAUSE    = 2,     //暂停中
    EVALUTESTATUS_TESTING  = 3      //检测中
    
};

@interface JinZhiViewController ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UIButton *slowTestBtn;
@property (weak, nonatomic) IBOutlet UIImageView *slowTestLeftImg;
@property (weak, nonatomic) IBOutlet UIButton *fastTestBtn;
@property (weak, nonatomic) IBOutlet UIImageView *fastTestLeftImg;
@property (weak, nonatomic) IBOutlet UIButton *resultBtn;
@property (weak, nonatomic) IBOutlet UIImageView *resultLeftImg;
//框框中的提示文字
@property (weak, nonatomic) IBOutlet UILabel *tipLab;
@property (weak, nonatomic) IBOutlet UIButton *statusBtn;


@property (nonatomic)EVALUTEMODE mode;
@property (nonatomic)EVALUTESTATUS status;
@property (nonatomic,strong)NSMutableArray *finishAry;
@property (nonatomic,strong)NSTimer * slowTimer;
@property (nonatomic)NSInteger slowTimerValue;
@end

@implementation JinZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.cusBar.titleStr = @"紧致度评估";
    self.slowTimerValue = 60;
    
}
#pragma mark - btn event
- (IBAction)startTest:(UIButton *)sender {
    
    if(_mode == EVALUTEMODE_NULL)
    {
        [NSString showTemporaryMessageOnFirstWindow:@"当前未选中任何模式"];return;
    }
    
    if(self.status == EVALUTESTATUS_NULL){
        self.status = EVALUTESTATUS_TESTING;
    }else if(self.status == EVALUTESTATUS_TESTING){
        self.status = EVALUTESTATUS_PAUSE;
    }else if(self.status == EVALUTESTATUS_PAUSE){
        self.status = EVALUTESTATUS_TESTING;
    }else if(self.status == EVALUTESTATUS_END){
        //判断当前model是否改变
        if([self.finishAry containsObject:@(self.mode)]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"你已经完成该模式测试，是否重新测试？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"重新测试", nil];
            [alert show];
        }
    }
    [self setStatusUIWithMode:self.status];
    
    if(_status == EVALUTESTATUS_TESTING){
        if(_mode == EVALUTEMODE_SLOW){
            [self startSlowClass];
        }else if(_mode == EVALUTEMODE_FAST){
            
        }
    }
}

- (IBAction)slowTestEvent:(UIButton *)sender {
    if(self.mode == EVALUTEMODE_SLOW){
        self.mode = EVALUTEMODE_NULL;
    }else{
        _mode = EVALUTEMODE_SLOW;
    }
    [self setModeUIWithMode:self.mode];
}
- (IBAction)fastTestEvent:(UIButton *)sender {
    
    if(_mode == EVALUTEMODE_FAST){
        _mode = EVALUTEMODE_NULL;
    }else{
        _mode = EVALUTEMODE_FAST;
    }
    [self setModeUIWithMode:_mode];
}
- (IBAction)resultEvent:(UIButton *)sender {
    //判断当前x，y，z，j是否有值或者是否完成慢肌和快肌检测
    
    EvaluteResultViewController *vc = [EvaluteResultViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark --
- (void)startSlowClass{
    self.tipLab.text = @"收紧6秒";
    self.timeLab.text = @"01:00";
    [self slowTimer];
}
#pragma mark - helper
- (void)setModeUIWithMode:(EVALUTEMODE)mode{
    if(mode == EVALUTEMODE_FAST){
        self.slowTestLeftImg.hidden = YES;
        [self.slowTestBtn setBackgroundImage:[UIImage imageNamed:@"manjijiance_07"] forState:UIControlStateNormal];
        self.fastTestLeftImg.hidden = NO;
        [self.fastTestBtn setBackgroundImage:[UIImage imageNamed:@"kuaijijiance_xuanzhong_07"] forState:UIControlStateNormal];
    }else if(mode == EVALUTEMODE_SLOW){
        self.slowTestLeftImg.hidden = NO;
        [self.slowTestBtn setBackgroundImage:[UIImage imageNamed:@"manjijiance_xuanzhong_07"] forState:UIControlStateNormal];
        self.fastTestLeftImg.hidden = YES;
        [self.fastTestBtn setBackgroundImage:[UIImage imageNamed:@"kuaijijiance_07"] forState:UIControlStateNormal];
    }else{
        self.slowTestLeftImg.hidden = YES;
        [self.slowTestBtn setBackgroundImage:[UIImage imageNamed:@"manjijiance_07"] forState:UIControlStateNormal];
        self.fastTestLeftImg.hidden = YES;
        [self.fastTestBtn setBackgroundImage:[UIImage imageNamed:@"kuaijijiance_07"] forState:UIControlStateNormal];
    }
}
- (void)setStatusUIWithMode:(EVALUTESTATUS)status{
    if(status == EVALUTESTATUS_END ||status == EVALUTESTATUS_NULL ||status == EVALUTESTATUS_PAUSE){
        [self.statusBtn setBackgroundImage:[UIImage imageNamed:@"kaishijiance_11"] forState:UIControlStateNormal];
    }else{
        [self.statusBtn setBackgroundImage:[UIImage imageNamed:@"tingzhijiance_11"] forState:UIControlStateNormal];
    }
}
#pragma mark - Timer
-(NSTimer *)slowTimer
{
    if(!_slowTimer){
        _slowTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(slowTimerMethod) userInfo:nil repeats:YES];
    }
    return _slowTimer;
}
- (void)slowTimerMethod
{
    if(_slowTimerValue%12 >= 6){
        self.tipLab.text = @"放松6秒";
    }else{
        self.tipLab.text = @"收紧6秒";
    }
    
    if(_slowTimerValue > 0){
        _slowTimerValue--;
        self.timeLab.text = [NSString stringWithFormat:@"00:%ld",(long)_slowTimerValue];
    }else{
        self.tipLab.text = @"慢肌检测完成";
        _status = EVALUTESTATUS_END;
        _slowTimerValue = 0;
        [_slowTimer invalidate];
        _slowTimer = nil;
    }
}
#pragma mark - UIAlertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.status = EVALUTESTATUS_TESTING;
    [self setStatusUIWithMode:self.status];
}
@end
