//
//  ZCHelper_TableViewController.h
//  Community
//
//  Created by yuxin tang on 14-4-11.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCHelper_TableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) NSMutableArray *itemsInTable;
@property (strong, nonatomic) IBOutlet UITableView *menuTableView;

@end
