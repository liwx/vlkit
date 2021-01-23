//
//  LLViewController.m
//  vlkit
//
//  Created by liwx on 01/08/2021.
//  Copyright (c) 2021 liwx. All rights reserved.
//

#import "LLViewController.h"
#import <vlkit/vlkit.h>

@interface LLViewController ()

@end

@implementation LLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];

    //button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    [button setTitle:@"test" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(100, 100, 100, 100)];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [button vl_setEnlargeEdgeWithMargin:100];
    
    //view
    UIView *view = [UIView new];
    [self.view addSubview:view];
    [view setFrame:CGRectMake(100, 400, 100, 100)];
    view.backgroundColor = [UIColor grayColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]  initWithTarget:self action:@selector(tapAction)];
    [view addGestureRecognizer:tap];
    view.userInteractionEnabled = YES;
    [view vl_setEnlargeEdgeWithMargin:100];
}

- (void)tapAction {
    NSLog(@"%s",__func__);
}

- (void)buttonAction {
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
