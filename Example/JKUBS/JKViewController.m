//
//  JKViewController.m
//  JKUBS
//
//  Created by HHL110120 on 04/05/2017.
//  Copyright (c) 2017 HHL110120. All rights reserved.
//

#import "JKViewController.h"
#import "JKAViewController.h"
#import "JKBViewController.h"

@interface JKViewController ()

@end

@implementation JKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 200, 30);
    button.center = self.view.center;
    [button setTitle:@"页面统计" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(0, 0, 200, 30);
    button1.center = CGPointMake(self.view.center.x, self.view.center.y+50) ;
    
    [button1 setTitle:@"事件统计" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(clicked1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];

    
}

- (void)clicked{

    JKAViewController *jkaVC = [JKAViewController new];
    [self.navigationController pushViewController:jkaVC animated:YES];

}

- (void)clicked1{
    
    JKBViewController *jkbVC = [JKBViewController new];
    [self.navigationController pushViewController:jkbVC animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
