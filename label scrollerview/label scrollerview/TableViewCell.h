//
//  TableViewCell.h
//  label scrollerview
//
//  Created by yuxin tang on 14-4-4.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *tableView;
@property (weak, nonatomic) IBOutlet UITextView *question;
@property (weak, nonatomic) IBOutlet UITextView *answer;

@end
