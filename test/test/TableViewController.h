//
//  TableViewController.h
//  test
//
//  Created by yuxin tang on 14-4-12.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface TableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>{
    
}

@property (strong, nonatomic) ViewController *detailViewController;


@end
