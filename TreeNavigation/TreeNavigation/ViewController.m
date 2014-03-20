//
//  ViewController.m
//  TreeNavigation
//
//  Created by yuxin tang on 14-3-16.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"
#import "CitiesViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"provinces_cities" ofType:@"plist"];
    
    self.dictData = [[NSDictionary  alloc] initWithContentsOfFile:path];
    
    self.listData = [self.dictData allKeys];
    
    self.title = @"城市信息";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 实现表视图数据源方法
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

//选择表视图行时候触发
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowSelectedProvince"])
    {
        CitiesViewController *citiesViewController = segue.destinationViewController;
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        NSString *selectName = [self.listData objectAtIndex:selectedIndex];
        citiesViewController.listData = [self.dictData objectForKey:selectName];
        citiesViewController.title = selectName;
    }
}

@end
