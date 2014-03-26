//
//  ZSTableViewController.m
//  shequ
//
//  Created by yuxin tang on 14-3-25.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ZSTableViewController.h"
#import "ZS-Question-ViewController.h"

@interface ZSTableViewController ()

@end

@implementation ZSTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Property List" ofType:@"plist"];
    self.dictData = [[NSDictionary alloc]initWithContentsOfFile:path];
    self.tableData = [self.dictData allKeys];
    
    self.title = @"政策助手";
    
//    tabelData = [NSArray arrayWithObjects:@"其他查询",@"承包查询", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dictData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    cell.textLabel.text = [self.tableData objectAtIndex:row];
    
    return cell;
}



@end
