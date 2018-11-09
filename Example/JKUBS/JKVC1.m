//
//  JKVC1.m
//  JKUBS
//
//  Created by Jack on 17/4/10.
//  Copyright © 2017年 HHL110120. All rights reserved.
//

#import "JKVC1.h"

@interface JKVC1 ()

@end

@implementation JKVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(0, 0, 200, 30);
    button1.center = CGPointMake(self.view.center.x, self.view.center.y+50) ;
    
    [button1 setTitle:@"类方法事件" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(JKClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

- (void)JKClicked{
    
    [JKVC1 testFun];
    [self testAAA];

    
}

+ (void)testFun{
    NSLog(@"testFun");
}

- (void)testAAA{
    NSLog(@"testAAA");
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
