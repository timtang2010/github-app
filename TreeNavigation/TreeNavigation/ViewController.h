//
//  ViewController.h
//  TreeNavigation
//
//  Created by yuxin tang on 14-3-16.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSDictionary *dictData;
@property (strong, nonatomic) NSArray *listData;

@end
