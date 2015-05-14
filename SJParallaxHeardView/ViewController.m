//
//  ViewController.m
//  SJParallaxHeardView
//
//  Created by Soldier on 15/5/8.
//  Copyright (c) 2015年 Soldier. All rights reserved.
//

#import "ViewController.h"
#import "SJParalaxHeardView.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, weak) SJParalaxHeardView *headerView;

@end





@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ViewController"];
    [self.view addSubview:_tableView];
    
    SJParalaxHeardView *headerView = [[SJParalaxHeardView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) backgroundImage:@"bg.jpg" logoImage:@"logo.jpg" title:@"Rock Never Die" subTitle:@"I Am Soldier"];
    headerView.viewController = self;
    headerView.scrollView = self.tableView;
    [self.view addSubview:headerView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 28;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ViewController" forIndexPath:indexPath];
    
    [cell.textLabel setText:@"Make some noise"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
