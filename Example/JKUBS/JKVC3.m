//
//  JKVC3.m
//  JKUBS
//
//  Created by Jack on 17/4/10.
//  Copyright © 2017年 HHL110120. All rights reserved.
//

#import "JKVC3.h"

@interface JKVC3 ()

@end

@implementation JKVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(JKClicked)];
    [self.view addGestureRecognizer:tap];
    
}

- (void)JKClicked{

    NSLog(@"JKClicked : tap");
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
