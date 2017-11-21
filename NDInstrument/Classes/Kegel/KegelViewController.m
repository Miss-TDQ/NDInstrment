//
//  KegelViewController.m
//  NDInstrument
//
//  Created by miss on 2017/11/15.
//  Copyright © 2017年 miss. All rights reserved.
//

#import "KegelViewController.h"
#import "KegelClassViewController.h"
#import "DWFlowLayout.h"
#import "CustomerCollectionViewCell.h"

@interface KegelViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *imageArray;
@end

@implementation KegelViewController
{
    CGFloat ratio;     //按6比例适配
    CGFloat Item_Width;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.cusBar.titleStr = @"凯格尔训练";
    
    ratio = SCREENWIDTH/375;
    Item_Width = 233*ratio;

    NSArray * itemsImg = @[@"zhanlizishi_03",@"pingtangzishi_03",@"xiadunzishi_03",@"ziyouzishi_03"];
    for (int i = 0;i<itemsImg.count;i++) {
        UIImage *image = [UIImage imageNamed:itemsImg[i]];
        [self.imageArray addObject:image];
    }
    
    [self addFelicityView];
}

- (void)addFelicityView {
    //133 753/2
    DWFlowLayout *layout = [[DWFlowLayout alloc] init];
    layout.minimumLineSpacing = (SCREENWIDTH - Item_Width)/3;
    layout.sectionInset = UIEdgeInsetsMake(0,(SCREENWIDTH - Item_Width)/2, 0,(SCREENWIDTH - Item_Width)/2);
    //设置是否需要分页
    [layout setPagingEnabled:YES];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 103, SCREENWIDTH, SCREENHEIGHT - 133) collectionViewLayout:layout];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.collectionViewLayout = layout;
    [self.collectionView reloadData];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CustomerCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CustomerCollectionViewCell"];
    [self.view addSubview:self.collectionView];
    
}

#pragma mark cell的数量
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}

#pragma mark cell的视图
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"CustomerCollectionViewCell";
    CustomerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.im.image = self.imageArray[indexPath.row];
    [cell.start addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchDown];
    cell.start.tag = indexPath.row + 1;
    return cell;
}
- (void)start:(UIButton *)button {
    
    NSLog(@"tag = %ld",button.tag);
    KegelClassViewController *vc = [KegelClassViewController new];
    vc.type = button.tag;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(Item_Width, Item_Width*753/466);
}

#pragma mark cell的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击%ld",indexPath.row);
    
}



#pragma 停止滑动监听
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
//    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:CGPointMake(scrollView.contentOffset.x+Item_Width, 0.5*scrollView.bounds.size.height)];
    
    
    
}



#pragma mark --懒加载
- (NSMutableArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}
@end
