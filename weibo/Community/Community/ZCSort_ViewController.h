//
//  ViewController.h
//  Community
//
//  Created by yuxin tang on 14-3-27.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCSort_ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

//创建静态字典
@property (strong, nonatomic) NSDictionary *dictData;
//创建数组
@property (strong, nonatomic) NSArray *listData;
@end
