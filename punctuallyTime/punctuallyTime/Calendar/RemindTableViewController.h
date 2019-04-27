//
//  RemindTableViewController.h
//  punctuallyTime
//
//  Created by THEWALKINGDEAD on 2019/4/26.
//  Copyright © 2019 THEWALKINGDEAD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^titleBlock)(NSString *title);
@interface RemindTableViewController : UITableViewController
@property(nonatomic, copy)titleBlock block;
@end

NS_ASSUME_NONNULL_END
