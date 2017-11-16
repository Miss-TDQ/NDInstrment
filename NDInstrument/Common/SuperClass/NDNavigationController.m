//
//  MLNavigationController.m
//  MultiLayerNavigation
//
//  Created by Feather Chan on 13-4-12.
//  Copyright (c) 2013年 Feather Chan. All rights reserved.
//

#import "NDNavigationController.h"
#import <QuartzCore/QuartzCore.h>
#import "BaseViewController.h"

@interface NDNavigationController ()<UIGestureRecognizerDelegate>

@end


@implementation NDNavigationController

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
    
    //重写系统的返回手势
    if (IOS7) {
        // 获取系统自带滑动手势的target对象
        id target = self.interactivePopGestureRecognizer.delegate;
        
        // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
        UIScreenEdgePanGestureRecognizer *pan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
        pan.edges = UIRectEdgeLeft;//左侧边缘
        // 设置手势代理，拦截手势触发
        pan.delegate = self;
        // 给导航控制器的view添加全屏滑动手势
        [self.view addGestureRecognizer:pan];
        // 禁止使用系统自带的滑动手势
        self.interactivePopGestureRecognizer.enabled = NO;   // 手势的代理设置为self
    }
}

//系统的方法
- (void)handleNavigationTransition:(UIGestureRecognizer *)recoginzer{
    
}

// 什么时候调用：每次触发手势之前都会询问下代理，是否触发。
// 作用：拦截手势触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.childViewControllers.count == 1) {
        // 表示用户在根控制器界面，就不需要触发滑动手势，
        return NO;
    }
    return YES;
}

// override the pop method
- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    
    return [super popViewControllerAnimated:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
