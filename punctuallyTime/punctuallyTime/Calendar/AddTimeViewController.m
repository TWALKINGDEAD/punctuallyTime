//
//  AddTimeViewController.m
//  punctuallyTime
//
//  Created by THEWALKINGDEAD on 2019/4/25.
//  Copyright © 2019 THEWALKINGDEAD. All rights reserved.
//

#import "AddTimeViewController.h"
#import "RemindTableViewController.h"



@interface AddTimeViewController ()<UIPopoverPresentationControllerDelegate>

@property (nonatomic,strong)UIButton *button;


@end

@implementation AddTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
 
    self.view.backgroundColor = [UIColor whiteColor];
    [self initview];
    
    
}
-(void)initview{
    self.button =[UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame=CGRectMake(20, 20, 100, 40);
    [self.button setTitle:@"自定义闹钟" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(showAllQuestions:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.titleView =self.button;
    
}

-(void)showAllQuestions:(UIButton *)sender {
    
    RemindTableViewController *tabView = [RemindTableViewController new];
    sender.selected = !sender.isSelected;
    if(sender.selected ==YES){
 
    tabView.preferredContentSize = CGSizeMake(180, 350);
    tabView.modalPresentationStyle = UIModalPresentationPopover;
    
    //4.设置弹出的位置
    tabView.popoverPresentationController.sourceView = sender;
    //5.设置箭头的位置
    tabView.popoverPresentationController.sourceRect = [(UIButton *)sender bounds];
    
    //6.设置弹出框的背景色（不同于视图控制器的视图背景色）
    tabView.popoverPresentationController.backgroundColor = [UIColor whiteColor];
    //7.设置箭头的方向
    tabView.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    /*
     UIPopoverArrowDirectionUp     上,
     UIPopoverArrowDirectionDown   下,
     UIPopoverArrowDirectionLeft   左,
     UIPopoverArrowDirectionRight  右,
     UIPopoverArrowDirectionAny    系统判定
     */
    //8.设置代理，要遵守UIPopoverPresentationControllerDelegate协议
    tabView.popoverPresentationController.delegate = self;
    
        __weak typeof(self) weakSelf = self;
        
        tabView.block = ^(NSString * _Nonnull title) {
            
            [weakSelf.button setTitle:title forState:UIControlStateNormal];
            //            self.button.text = tlitle;
        };
        
    //9.显示菜单
    [self presentViewController:tabView animated:NO completion:nil];
        
    }else{
          [self dismissViewControllerAnimated:NO completion:nil];
      
      
    }
    
}
//要实现的协议方法：
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone; //不适配
}
//点击蒙版popover消失， 默认YES，所以该方法可以不用实现。
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return YES;
}


@end
