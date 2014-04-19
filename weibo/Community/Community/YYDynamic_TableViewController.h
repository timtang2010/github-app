//
//  YYDynamic_TableViewController.h
//  Community
//
//  Created by yuxin tang on 14-4-10.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYDynamic_TableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSDictionary *dictData;
@property (strong, nonatomic) NSArray * listData;

@end
