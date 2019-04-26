//
//  CalendarViewController.m
//  punctuallyTime
//
//  Created by THEWALKINGDEAD on 2019/4/24.
//  Copyright © 2019 THEWALKINGDEAD. All rights reserved.
//

#import "CalendarViewController.h"
#import "AddTimeViewController.h"


@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor yellowColor];
    [self initBarButtonItem];
    
}
-(void)initBarButtonItem{
    /*
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"tabBar_new_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftItem;
// */
//    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    leftBtn.frame = CGRectMake(0, 0, 25,25);
//    UIImage *img = [UIImage imageNamed:@"tabBar_new_icon"] ;
//    [leftBtn setImage:img forState:UIControlStateNormal];
//    [leftBtn addTarget:self action:@selector(backViewcontroller) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"tabBar_new_icon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"tabBar_new_icon"] forState:UIControlStateHighlighted];
    button.size = CGSizeMake(70, 30);
    // 让按钮内部的所有内容左对齐
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //        [button sizeToFit];
    // 让按钮的内容往左边偏移10
    button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(pushView) forControlEvents:UIControlEventTouchUpInside];
    
    // 修改导航栏左边的item
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    
}

-(void)pushView{
    AddTimeViewController *addTime = [AddTimeViewController new];
    
    [self.navigationController pushViewController:addTime animated:YES];
    
}

-(void)backViewcontroller{
    
    NSLog(@"touch");
    
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
