//
//  SecondViewController.m
//  Vesstack2.0
//
//  Created by Holmes on 16/4/8.
//  Copyright © 2016年 xcl. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

-(instancetype)init{
    if(self = [super init]){
        _panGesture = [[UIPanGestureRecognizer alloc] init];
    }
    
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
}

@end
