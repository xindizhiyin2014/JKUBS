//
//  JKBViewController.m
//  JKUBS
//
//  Created by Jack on 17/4/6.
//  Copyright © 2017年 HHL110120. All rights reserved.
//

#import "JKBViewController.h"

@interface JKBViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_contentTable;
    NSArray *_dataArray;
}
@end

@implementation JKBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _dataArray = @[@"UIbutton事件1",@"UIbutton事件2",@"手势事件1",@"单元格选中事件"];
    
    _contentTable = [[UITableView alloc] initWithFrame:self.view.frame];
    [_contentTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell1"];
    _contentTable.dataSource = self;
    _contentTable.delegate = self;
    [self.view addSubview:_contentTable];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *vcName = [NSString stringWithFormat:@"JKVC%d",(int)indexPath.row+1];
    Class vcClassName = NSClassFromString(vcName);
    UIViewController *vc = (UIViewController *)[vcClassName new];
    vc.title = _dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    


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
