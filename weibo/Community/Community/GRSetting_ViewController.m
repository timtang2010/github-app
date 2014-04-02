//
//  GRSetting_ViewController.m
//  Community
//
//  Created by WEB08-V5MCS006 on 14-4-1.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "GRSetting_ViewController.h"

@interface GRSetting_ViewController ()

@end

@implementation GRSetting_ViewController

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
    
    self.array = @[@"图文模式", @"文字模式", @"智能模式（推荐）", @"清除缓存", @"关于我们"];
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
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [self.array objectAtIndex:[indexPath row]];
    
    if ([indexPath row] == 0)
    {
        cell.detailTextLabel.text = @"同时显示缩略图和文字，消耗流量较大";
    }
    if ([indexPath row] == 1)
    {
        cell.detailTextLabel.text = @"仅显示文字，隐藏缩略图";
    }
    if ([indexPath row] == 2)
    {
        cell.detailTextLabel.text = @"高速网络接入时自动使用图文模式";
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
