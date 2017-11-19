//
//  EvaluteResultViewController.m
//  NDInstrument
//
//  Created by miss on 2017/11/18.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "EvaluteResultViewController.h"
#import "JinZhiChartView.h"
@interface EvaluteResultViewController ()
{
    CGFloat _x;
    CGFloat _y;
    CGFloat _z;
    CGFloat _j;
}
@property (weak, nonatomic) IBOutlet UIView *chartView;
@property (weak, nonatomic) IBOutlet UIView *starView;
@property (weak, nonatomic) IBOutlet UILabel *scoreLab;
@property (weak, nonatomic) IBOutlet UIImageView *kegelImg1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *kegelImg1Width;
@property (weak, nonatomic) IBOutlet UIImageView *kegelImg2;
@property (weak, nonatomic) IBOutlet UIImageView *ndImg1;
@property (weak, nonatomic) IBOutlet UIImageView *ndImg2;
@property (weak, nonatomic) IBOutlet UIImageView *ndImg3;

@property (nonatomic)int GScore;     //肌力评分
@property (nonatomic)int CScore;     //持久度评分
@property (nonatomic)int FScore;     //爆发力评分
@property (nonatomic)int DScore;     //重复性评分

@end

@implementation EvaluteResultViewController
-(instancetype)initWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z J:(CGFloat)j
{
    self = [super init];
    if (self) {
        _x = x;
        _y = y;
        _z = z;
        _j = j;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.cusBar.titleStr = @"检测结果";
    
    [self getItemScore];
    [self setUIWithSocre:[self getTotalSocre]];
    [self layoutChartView];
}
#pragma mark - 根据各项分数绘制柱状图
- (void)layoutChartView{
    CGFloat width = FitSizeValueWidth(156);
    CGFloat height = width *430/312;
    JinZhiChartView *chart = [[JinZhiChartView alloc] initWithFrame:CGRectMake(0, 13, width, height) valueAry:@[@(45),@(60),@(80),@(20)] isAnimation:YES];
    chart.backgroundColor = [UIColor clearColor];
    [self.chartView addSubview:chart];
}
#pragma mark - 根据X,Y,Z,J值获取GScore，CScore，FScore，DScore
- (void)getItemScore{
    self.DScore = self.CScore = self.FScore = self.GScore = 0;
    
    //肌力评分
    if(_x >= 14700){
        self.GScore = 100;
    }else if(_x >= 11270){
        self.GScore = 80;
    }else if(_x >= 7840){
        self.GScore = 60;
    }else if(_x >= 2940){
        self.GScore = 40;
    }else{
        self.GScore = 20;
    }
    
    //持久度评分
    if(_y<=5){
        if(_y>4.1){
            self.CScore = 100;
        }else if(_y>3.1){
            self.CScore = 80;
        }else if(_y>2.1){
            self.CScore = 60;
        }else if(_y>1.1){
            self.CScore = 40;
        }else if(_y>0.1){
            self.CScore = 20;
        }
    }
    
    //爆发力评分
    switch (self.GScore) {
        case 20:{
            if(_z >= 5){
                self.FScore = 4;
            }else if(_z>3.1 &&_z<=4){
                self.FScore = 8;
            }else if(_z>2.1&&_z<=3){
                self.FScore = 12;
            }else if(_z >1.1&&_z<=2){
                self.FScore = 16;
            }else if(_z<=1){
                self.FScore = 20;
            }
        }break;
        case 40:{
            if(_z >= 5){
                self.FScore = 24;
            }else if(_z>3.1 &&_z<=4){
                self.FScore = 28;
            }else if(_z>2.1&&_z<=3){
                self.FScore = 32;
            }else if(_z >1.1&&_z<=2){
                self.FScore = 36;
            }else if(_z<=1){
                self.FScore = 40;
            }
        }break;
        case 60:{
            if(_z >= 5){
                self.FScore = 44;
            }else if(_z>3.1&&_z<=4){
                self.FScore = 48;
            }else if(_z>2.1&&_z<=3){
                self.FScore = 52;
            }else if(_z >1.1&&_z<=2){
                self.FScore = 56;
            }else if(_z<=1){
                self.FScore = 60;
            }
        }break;
        case 80:{
            if(_z >= 5){
                self.FScore = 64;
            }else if(_z>3.1&&_z<=4){
                self.FScore = 68;
            }else if(_z>2.1&&_z<=3){
                self.FScore = 72;
            }else if(_z >1.1&&_z<=2){
                self.FScore = 76;
            }else if(_z<=1){
                self.FScore = 80;
            }
        }break;
        case 100:{
            if(_z >= 5){
                self.FScore = 84;
            }else if(_z>3.1&&_z<=4){
                self.FScore = 88;
            }else if(_z>2.1&&_z<=3){
                self.FScore = 92;
            }else if(_z >1.1&&_z<=2){
                self.FScore = 96;
            }else if(_z<=1){
                self.FScore = 100;
            }
        }break;
        default:
            break;
    }
    
    //重复性评分
    switch (self.GScore) {
        case 20:{
            if(_j <= 1){
                self.DScore = 4;
            }else if(_j>1.1 &&_j<=2){
                self.DScore = 8;
            }else if(_j>2.1&&_j<=3){
                self.DScore = 12;
            }else if(_j >3.1&&_j<=4){
                self.DScore = 16;
            }else if(_j >= 5){
                self.DScore = 20;
            }
        }break;
        case 40:{
            if(_j <= 1){
                self.DScore = 24;
            }else if(_j>1.1 &&_j<=2){
                self.DScore = 28;
            }else if(_j>2.1&&_j<=3){
                self.DScore = 32;
            }else if(_j >3.1&&_j<=4){
                self.DScore = 36;
            }else if(_j >= 5){
                self.DScore = 40;
            }
        }break;
        case 60:{
            if(_j <= 1){
                self.DScore = 44;
            }else if(_j>1.1 &&_j<=2){
                self.DScore = 48;
            }else if(_j>2.1&&_j<=3){
                self.DScore = 52;
            }else if(_j >3.1&&_j<=4){
                self.DScore = 56;
            }else if(_j >= 5){
                self.DScore = 60;
            }
        }break;
        case 80:{
            if(_j <= 1){
                self.DScore = 64;
            }else if(_j>1.1 &&_j<=2){
                self.DScore = 68;
            }else if(_j>2.1&&_j<=3){
                self.DScore = 72;
            }else if(_j >3.1&&_j<=4){
                self.DScore = 76;
            }else if(_j >= 5){
                self.DScore = 80;
            }
        }break;
        case 100:{
            if(_j <= 1){
                self.DScore = 84;
            }else if(_j>1.1 &&_j<=2){
                self.DScore = 88;
            }else if(_j>2.1&&_j<=3){
                self.DScore = 92;
            }else if(_j >3.1&&_j<=4){
                self.DScore = 96;
            }else if(_j >= 5){
                self.DScore = 100;
            }
        }break;
        default:
            break;
    }
}


- (CGFloat)getTotalSocre
{
    return (self.GScore + self.CScore + self.FScore + self.DScore)/4.0;
}
#pragma mark - 根据总得分绘制UI
- (void)setUIWithSocre:(CGFloat)score
{
    
    self.scoreLab.text = [NSString stringWithFormat:@"%g",score];
    
    if(score >= 95){
        self.ndImg1.image  = IMG(@"suofangduanl_14");
        self.ndImg2.image  = IMG(@"simikangshuai_14");
        self.ndImg3.hidden = YES;
        
        self.kegelImg1.image  = IMG(@"ziyouzishi_11");
        self.kegelImg2.hidden = YES;
    }else if(score >= 90){
        self.ndImg1.image = IMG(@"wolikongzhi_14");
        self.ndImg2.image = IMG(@"simikangshuai_14");
        self.ndImg3.hidden = YES;
        
        self.kegelImg1.image  = IMG(@"ziyouzishi_11");
        self.kegelImg2.hidden = YES;
    }else if(score >= 85){
        self.ndImg1.image = IMG(@"wolikongzhi_14");
        self.ndImg2.image = IMG(@"xingnenghuanxing_14");
        self.ndImg3.image = IMG(@"simikangshuai_14");
        
        self.kegelImg1.image = IMG(@"xiadunzishi_11");
        self.kegelImg2.hidden = YES;
    }else if(score >= 80){
        self.ndImg1.image = IMG(@"suofangduanl_14");
        self.ndImg2.image = IMG(@"meilichongsu_14");
        self.ndImg3.image = IMG(@"xingnenghuanxing_14");
        
        self.kegelImg1.image = IMG(@"xiadunzishi_11");
        self.kegelImg2.hidden = YES;
    }else if(score >= 75){
        self.ndImg1.image = IMG(@"wolikongzhi_14");
        self.ndImg2.image = IMG(@"meilichongsu_14");
        self.ndImg3.image = IMG(@"xingnenghuanxing_14");
        
        self.kegelImg1.image = IMG(@"pingtangzishi_11");
        self.kegelImg2.image = IMG(@"xiadunzishi_11");
    }else if(score >= 70){
        self.ndImg1.image = IMG(@"wolikongzhi_14");
        self.ndImg2.image = IMG(@"suofangduanl_14");
        self.ndImg3.image = IMG(@"meilichongsu_14");
        
        self.kegelImg1.image = IMG(@"zhanlizishi_11");
        self.kegelImg2.image = IMG(@"xiadunzishi_11");
    }else if(score >= 65){
        self.ndImg1.image = IMG(@"jinshixiufu_14");
        self.ndImg2.image = IMG(@"suofangduanl_14");
        self.ndImg3.image = IMG(@"meilichongsu_14");
        
        self.kegelImg1.image = IMG(@"pingtangzishi_11");
        self.kegelImg2.image = IMG(@"xiadunzishi_11");
    }else if(score >= 60){
        self.ndImg1.image = IMG(@"jinshixiufu_14");
        self.ndImg2.image = IMG(@"wolikongzhi_14");
        self.ndImg3.image = IMG(@"meilichongsu_14");
        
        self.kegelImg1.image = IMG(@"pingtangzishi_11");
        self.kegelImg2.image = IMG(@"zhanlizishi_11");
    }else {
        self.ndImg1.image = IMG(@"jinshixiufu_14");
        self.ndImg2.image = IMG(@"wolikongzhi_14");
        self.ndImg3.image = IMG(@"suofangduanl_14");
        
        self.kegelImg1.image = IMG(@"pingtangzishi_11");
        self.kegelImg2.image = IMG(@"zhanlizishi_11");
    }
    
    if(self.kegelImg2.hidden){
        self.kegelImg1Width.constant = 183;
    }else{
        self.kegelImg1Width.constant = 183;
    }
    
    //    a.0-20分 1星
    //    b.21-40分 2星
    //    c.41-60分 3星
    //    d.61-80分 4星
    //    e.81-100分 5星
    int starNum = 0;
    if(score<=100){
        if(score > 80){
            starNum = 5;
        }else if(score > 60){
            starNum = 4;
        }else if(score > 40){
            starNum = 3;
        }else if (score > 20){
            starNum = 2;
        }else if(score >= 0){
            starNum = 1;
        }
    }else{
        starNum = 0;
    }
   
    CGFloat starWidth = 12;
    CGFloat offset = 3;
    for(int i = 0;i<starNum;i++){
        UIImageView * star = [[UIImageView alloc]initWithFrame:CGRectMake(starWidth * i +offset*(i-1), 0, starWidth, starWidth)];
        star.image = IMG(@"xing_03");
        [self.starView addSubview:star];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
