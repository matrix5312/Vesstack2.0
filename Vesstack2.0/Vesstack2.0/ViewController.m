//
//  ViewController.m
//  Vesstack2.0
//
//  Created by Holmes on 16/4/8.
//  Copyright © 2016年 xcl. All rights reserved.
//

#import "ViewController.h"
#import "MainTabBarController.h"
#import "LeftMenuViewController.h"
#import "FirstViewController.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
//@property (nonatomic, strong) UINavigationController *homeNavigationController;
@property (nonatomic, strong) LeftMenuViewController *leftMenu;
//@property (nonatomic, strong) FirstViewController *first;

@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, strong) UIView *tabBarView;

@property (nonatomic) CGFloat distance;
@property (nonatomic) CGFloat coverPersent;
@property (nonatomic) CGPoint *centerOfLeftViewAtBeginning;
@property (nonatomic) CGFloat proportionOfLeftMenu;
@property (nonatomic) CGFloat distanceOfLeftMenu;
@property (nonatomic) CGFloat alphaOfTabBarView;

@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;

//@property (nonatomic, strong) UIViewController *rootViewController;

@end

static const CGFloat FullDistance = 0.78;
static const CGFloat Proportion = 0.77;

@implementation ViewController

static ViewController *singletonInstance;

+(ViewController *)sharedInstance{
    if(!singletonInstance)
        NSLog(@"ViewController has not been initialized .Either place one in your storyboard or initialize one in code");
    return singletonInstance;
}


-(instancetype)init{
    if(self = [super init]) {
        singletonInstance = self;
        _rootViewController = [[UIApplication sharedApplication] keyWindow].rootViewController;
        _distance = 0;
        _proportionOfLeftMenu = 1;
        _distanceOfLeftMenu = 50;
        self.panGesture = [[UIPanGestureRecognizer alloc] init];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        _distance = 0;
        _proportionOfLeftMenu = 1;
        _distanceOfLeftMenu = 50;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _leftMenu = [[LeftMenuViewController alloc] init];
    _leftMenu.view.center = CGPointMake(_leftMenu.view.center.x, _leftMenu.view.center.y);
    [self.view addSubview:_leftMenu.view];
    
    _mainView = [[UIView alloc] initWithFrame:self.view.frame];
    _coverView = [[UIView alloc] initWithFrame:self.view.frame];
    _coverView.backgroundColor = [UIColor blackColor];
    
    _mainTabBar = [[MainTabBarController alloc] init];
    
    _tabBarView = _mainTabBar.view;
    
    [_mainView addSubview:_coverView];
    [_mainView addSubview:_tabBarView];
    
    [_tabBarView bringSubviewToFront:_mainTabBar.tabBar];
    
    [self.view addSubview:_mainView];

    //[self setShadow:_mainView];
    
    UIPanGestureRecognizer *panGesture = self.panGesture;
    [panGesture addTarget:self action:@selector(pan:)];
    [_mainView addGestureRecognizer:panGesture];

    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showHome)];
    
    NSLog(@"delete It's me");
}

-(void)setShadow:(UIView *)view{
    view.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    view.layer.shadowRadius = 10.0;
    view.layer.shadowOpacity = 1.0;
    view.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.view.bounds].CGPath;
    view.layer.shouldRasterize = YES;
    view.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

-(void)pan:(UIPanGestureRecognizer *)recognizer{
    CGFloat x = [recognizer translationInView:self.view].x;
    CGFloat trueDistance = _distance + x;
    _alphaOfTabBarView = x / 1000;

    //当panGesture结束时，菜单自动停靠
    if(recognizer.state == UIGestureRecognizerStateEnded) {
        if(trueDistance > ([[UIScreen mainScreen] bounds].size.width) * (Proportion / 3)){
            [self showLeft];
        }
        else{
            [self showHome];
        }
        return;
    }
    
    recognizer.view.center = CGPointMake(self.view.center.x + trueDistance, self.view.center.y);
    if(recognizer.view.frame.origin.x < self.view.center.x * (FullDistance * 2 + Proportion - 1)){
        if(x > 0) {
            self.tabBarView.alpha = 1.0 - _alphaOfTabBarView;
        }else{
            self.tabBarView.alpha = 0.7 - _alphaOfTabBarView;
        }
    }

}

-(void)showHome{
//    self.tabBarView.alpha = 1.0;
    [_mainView removeGestureRecognizer:_tapGesture];
    _distance = 0;
    _alphaOfTabBarView = 0.0;
    [self slideAnimate];
    
}

-(void)showLeft{
//    self.tabBarView.alpha = 0.7;
    _alphaOfTabBarView = 0.3;
    [_mainView addGestureRecognizer:_tapGesture];
    _distance = self.view.center.x * (FullDistance * 2 + Proportion - 1);
    [self slideAnimate];
    
}

-(void)slideAnimate{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.mainView.center = CGPointMake(self.view.center.x + self.distance, self.view.center.y);
                         
                         self.tabBarView.alpha = 1.0 - _alphaOfTabBarView;
                         
                     }
                     completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
