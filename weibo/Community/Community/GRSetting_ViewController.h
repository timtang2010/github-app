//
//  GRSetting_ViewController.h
//  Community
//
//  Created by WEB08-V5MCS006 on 14-4-1.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRSetting_ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray * keys;
@property (strong, nonatomic) NSDictionary * dictionary;
@property (strong, nonatomic) UIAlertView * alert;
@property (assign ,nonatomic) int oldRow;

@end
