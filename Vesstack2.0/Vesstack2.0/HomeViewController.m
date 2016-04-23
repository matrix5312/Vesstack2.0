//
//  HomeViewController.m
//  Vesstack2.0
//
//  Created by Holmes on 16/4/8.
//  Copyright © 2016年 xcl. All rights reserved.
//

#import "HomeViewController.h"
#import "ViewController.h"
#import "MainTabBarController.h"


@interface HomeViewController ()

@property (nonatomic, strong) UIBarButtonItem *backButton;
@property (nonatomic, strong) MainTabBarController *mainTabBar;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"个人资料";
    self.view.backgroundColor = [UIColor purpleColor];
    
//    [_backButton initWithTitle:@"<返回" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    _backButton = [[UIBarButtonItem alloc] initWithTitle:@"<返回" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    self.navigationItem.leftBarButtonItem = _backButton;
}

-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
    _mainTabBar = [[ViewController sharedInstance] mainTabBar];
    _mainTabBar.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
