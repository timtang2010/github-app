//
//  ViewController.h
//  test2
//
//  Created by yuxin tang on 14-4-2.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSDictionary *dictData;
@property (strong, nonatomic) NSArray *listData;

@end
