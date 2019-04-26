//
//  baseTabBarController.m
//  punctuallyTime
//
//  Created by THEWALKINGDEAD on 2019/4/24.
//  Copyright © 2019 THEWALKINGDEAD. All rights reserved.
//

#import "baseTabBarController.h"
#import "CalendarViewController.h"
#import "TimeViewController.h"
#import "SettingViewController.h"
#import "baseNavigationController.h"


@interface baseTabBarController ()

@end

@implementation baseTabBarController


+(void)initialize{

    NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];

    mutDic[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    mutDic[NSForegroundColorAttributeName] =[UIColor grayColor];

    NSMutableDictionary *selectDic = [NSMutableDictionary dictionary];
    selectDic[NSFontAttributeName] = mutDic[NSFontAttributeName];
    selectDic[NSForegroundColorAttributeName] =[UIColor darkGrayColor];

    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:mutDic forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectDic forState:UIControlStateSelected];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CalendarViewController *calen = [CalendarViewController new];
    [self setUpchildVc:calen title:@"闹钟" image:@"tabBar_new_icon" selectImage:@"tabBar_new_click_icon"];
    
    TimeViewController *time = [TimeViewController new];
    [self setUpchildVc:time title:@"日历" image:@"tabBar_essence_icon" selectImage:@"tabBar_essence_click_icon"];
    
    SettingViewController *set = [SettingViewController new];
    [self setUpchildVc:set title:@"设置" image:@"tabBar_friendTrends_icon" selectImage:@"tabBar_friendTrends_click_icon"];
    
}



-(void)setUpchildVc:(UIViewController *)VC title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage{
    
    VC.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:image];
    VC.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    VC.navigationItem.title = title;

    baseNavigationController *na = [[baseNavigationController alloc]initWithRootViewController:VC];
    [self addChildViewController:na];
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
