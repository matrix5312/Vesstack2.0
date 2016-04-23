//
//  LeftMenuViewController.m
//  Vesstack2.0
//
//  Created by Holmes on 16/4/8.
//  Copyright © 2016年 xcl. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "ViewController.h"
#import "MainTabBarController.h"
#import "HomeViewController.h"

@interface LeftMenuViewController()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, strong) UITableViewCell *tableViewCell;
//@property (nonatomic, strong) UIViewController *rootViewController;
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) MainTabBarController *mainTabBar;
@property (nonatomic, strong) UINavigationController *jumpViewController;

@end

@implementation LeftMenuViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    _rootViewController = [[UIApplication sharedApplication] keyWindow].rootViewController;
//    self.tableView.backgroundColor = [UIColor clearColor];
    
    _viewController = [ViewController sharedInstance].rootViewController;
    
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"aaa";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.backgroundColor = [UIColor clearColor];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 1){
        _mainTabBar = [[ViewController sharedInstance] mainTabBar];
        _mainTabBar.selectedIndex = 0;
        _mainTabBar.tabBar.hidden = YES;
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        _jumpViewController = [[_mainTabBar viewControllers] firstObject];
        HomeViewController *home = [[HomeViewController alloc] init];
        [_jumpViewController pushViewController:home animated:NO];
//        NSLog(@"%@", _jumpViewController.title);
        
//        [_jumpViewController.navigationController pushViewController:home animated:NO];
        [[ViewController sharedInstance] showHome];
    }
}


@end
