//
//  ViewController.m
//  MoveCell
//
//  Created by yuxin tang on 14-3-1.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UINavigationItem *navItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *listTeams;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //设置导航栏
    self.navItem.rightBarButtonItem =  self.editButtonItem;
    self.navItem.title = @"单元格移动";
    
    //分配当前视图控制器给表视图的委托和数据源
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.listTeams = [[NSMutableArray alloc] initWithObjects:@"黑龙江", @"吉林", @"辽宁", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --UITableViewDataSource 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listTeams count] ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier] ;
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self.listTeams objectAtIndex:indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath*)indexPath
{
    return YES;
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath*)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSString *stringToMove = [self.listTeams objectAtIndex:sourceIndexPath.row];
    [self.listTeams removeObjectAtIndex:sourceIndexPath.row];
    [self.listTeams insertObject:stringToMove atIndex:destinationIndexPath.row];
}


#pragma mark --UITableViewDelegate 协议方法

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  UITableViewCellEditingStyleNone;
}


#pragma mark -- UIViewController生命周期方法，用于响应视图编辑状态变化
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    [super setEditing:editing animated:animated];
    
    [self.tableView setEditing:editing animated:YES];
    
}

@end
