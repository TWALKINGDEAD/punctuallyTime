//
//  RemindTableViewController.m
//  punctuallyTime
//
//  Created by THEWALKINGDEAD on 2019/4/26.
//  Copyright © 2019 THEWALKINGDEAD. All rights reserved.
//

#import "RemindTableViewController.h"



@interface RemindTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView  *tableView;
@property(nonatomic, copy)NSArray *dataArray;



@end

@implementation RemindTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [UITableView new];
    
    _dataArray = @[@"起床闹钟", @"自定义", @"倒计时", @"生日管家", @"纪念日", @"喝水吃药", @"轮班闹钟"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = NO;
    self.tableView.scrollEnabled = NO;
    
}

#pragma mark - Table view data source


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
//    cell.backgroundColor = [UIColor orangeColor];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.text = _dataArray[indexPath.section];
    cell.textLabel.textAlignment =  NSTextAlignmentCenter;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = _dataArray[indexPath.section];
    
    if(self.block != nil) {
    self.block(text);
        
    }
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

@end
