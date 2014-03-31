//
//  ViewController.m
//  Community
//
//  Created by yuxin tang on 14-3-27.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ZCSort_ViewController.h"
#import "ZCDetails_TableViewController.h"

@interface ZCSort_ViewController ()

@end

@implementation ZCSort_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //应用程序，框架，插件。
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Property List_ZC" ofType:@"plist"];
    
    self.dictData =[[NSDictionary alloc] initWithContentsOfFile:path];
    self.listData = [self.dictData allKeys];
    
//    self.title = @"家政服务";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 实现表视图数据源的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    cell.textLabel.text = [self.listData objectAtIndex:row];
    return cell;
}

//选择变视图行时候触发
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ShowSelected"]) {
        ZCDetails_TableViewController *citiesViewController = segue.destinationViewController;
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow]row];
        NSString *selectName = [self.listData objectAtIndex:selectedIndex];
        citiesViewController.listData = [self.dictData objectForKey:selectName];
        citiesViewController.title = selectName;
    }
}

@end
