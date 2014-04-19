//
//  GRMyOrder_ViewController.m
//  Community
//
//  Created by WEB08-V5MCS006 on 14-4-3.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "GRMyOrder_ViewController.h"
#import "GRMyOrderWithMyCell_TableViewCell.h"
#import "GRServiceEvaluation_ViewController.h"

@interface GRMyOrder_ViewController ()

@end

@implementation GRMyOrder_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //注册自定义cell
    [self.tableView registerClass:[GRMyOrderWithMyCell_TableViewCell class] forCellReuseIdentifier:@"identifier"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"identifier";
    
    GRMyOrderWithMyCell_TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.delegate = self;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 172;
}

//委托方法
-(void)turnToGRServiceEvaluation_ViewController
{
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GRServiceEvaluation_ViewController * grServiceEvaluation_ViewController = [storyboard instantiateViewControllerWithIdentifier:@"GRServiceEvaluation_ViewController"];
    [self.navigationController pushViewController:grServiceEvaluation_ViewController animated:YES];
}

@end
