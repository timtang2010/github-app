//
//  GRServiceEvaluation_ViewController.m
//  Community
//
//  Created by WEB08-V5MCS006 on 14-4-8.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "GRServiceEvaluation_ViewController.h"
#import "GRServiceEvaluationWithMyCell_TableViewCell.h"
#import "GRMyOrder_ViewController.h"

@interface GRServiceEvaluation_ViewController ()

@end

@implementation GRServiceEvaluation_ViewController

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
    
    self.array = @[@"响应速度", @"满意程度", @"服务态度", @"服务质量"];
    
    [self.tableView registerClass:[GRServiceEvaluationWithMyCell_TableViewCell class] forCellReuseIdentifier:@"identifier"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"identifier";
    
    GRServiceEvaluationWithMyCell_TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.label.text = self.array[[indexPath row]];
    
    return cell;
}

//提交评分的响应事件
- (IBAction)SubmitScore:(id)sender
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提交成功"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles: nil];
    [alert show];
}

//点击Button消失后的响应事件
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end