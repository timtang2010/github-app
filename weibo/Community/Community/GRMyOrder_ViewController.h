//
//  GRMyOrder_ViewController.h
//  Community
//
//  Created by WEB08-V5MCS006 on 14-4-3.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TurnToGRServiceEvaluation_ViewController <NSObject>

-(void)turnToGRServiceEvaluation_ViewController;

@end

@interface GRMyOrder_ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, TurnToGRServiceEvaluation_ViewController>

@property (strong, nonatomic) IBOutlet UITableView * tableView;

@end