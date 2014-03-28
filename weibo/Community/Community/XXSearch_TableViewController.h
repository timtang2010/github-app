//
//  XXSearch_TableViewController.h
//  Community
//
//  Created by yuxin tang on 14-3-27.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKSTableView.h"

@interface XXSearch_TableViewController : UIViewController<SKSTableViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet SKSTableView *tableView;

//创建静态字典
@property (strong, nonatomic) NSDictionary *dictData;
@property (strong, nonatomic) NSArray *listData;

@end
