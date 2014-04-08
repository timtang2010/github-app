//
//  TableViewCell.h
//  test2
//
//  Created by yuxin tang on 14-4-2.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *Question;
@property (weak, nonatomic) IBOutlet UITextView *Answer;
@property (weak, nonatomic) IBOutlet UIView *TextView;

@end
