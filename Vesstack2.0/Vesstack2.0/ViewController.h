//
//  ViewController.h
//  Vesstack2.0
//
//  Created by Holmes on 16/4/8.
//  Copyright © 2016年 xcl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainTabBarController;

@interface ViewController : UIViewController

@property (nonatomic, strong) UIViewController *rootViewController;
@property (nonatomic, strong) MainTabBarController *mainTabBar;

+(ViewController *)sharedInstance;

-(void)showHome;

@end

