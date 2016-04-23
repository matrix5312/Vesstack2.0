//
//  MainTabBarController.m
//  Vesstack2.0
//
//  Created by Holmes on 16/4/8.
//  Copyright © 2016年 xcl. All rights reserved.
//

#import "MainTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"


@implementation MainTabBarController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self setUpAllChildViewController];
}

-(void)setUpAllChildViewController{
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    [self setUpSingleChildViewController:firstVC image:[UIImage imageNamed:@"tab_home_icon"] title:@"首页"];
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self setUpSingleChildViewController:secondVC image:[UIImage imageNamed:@"js"] title:@"技术"];
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    [self setUpSingleChildViewController:thirdVC image:[UIImage imageNamed:@"qw"] title:@"博文"];
    
    FourViewController *fourVC = [[FourViewController alloc] init];
    [self setUpSingleChildViewController:fourVC image:[UIImage imageNamed:@"user"] title:@"我的"];
}

-(void)setUpSingleChildViewController:(UIViewController *)viewController image:(UIImage *)image title:(NSString *)title{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    nav.title = title;  //设置tabBar的标题
    nav.tabBarItem.image = image;
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"commentary_num_bg"] forBarMetrics:UIBarMetricsDefault];
    
    viewController.navigationItem.title = title;//设置navigationBar的标题
    
    [self addChildViewController:nav];
}


@end
