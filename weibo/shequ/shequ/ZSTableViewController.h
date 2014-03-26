//
//  ZSTableViewController.h
//  shequ
//
//  Created by yuxin tang on 14-3-25.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *TabelView;

@property (strong, nonatomic) NSDictionary *dictData;
@property (strong, nonatomic) NSArray *tableData;
@end
