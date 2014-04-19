//
//  GRServiceEvaluation_ViewController.h
//  Community
//
//  Created by WEB08-V5MCS006 on 14-4-8.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRServiceEvaluation_ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray * array;

- (IBAction)SubmitScore:(id)sender;

@end
