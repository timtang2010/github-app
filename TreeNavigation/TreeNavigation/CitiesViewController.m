//
//  CitiesViewController.m
//  TreeNavigation
//
//  Created by yuxin tang on 14-3-16.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "CitiesViewController.h"
#import "DetailViewController.h"

@interface CitiesViewController ()

@end

@implementation CitiesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    NSDictionary *dict = [self.listData objectAtIndex:row];
    
	cell.textLabel.text = [dict objectForKey:@"name"];
    
    return cell;
}

//选择表视图行时候触发
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowSelectedCity"])
    {
        DetailViewController *detailViewController = segue.destinationViewController;
        
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        NSDictionary *dict = [self.listData objectAtIndex:selectedIndex];
        
        detailViewController.url = [dict objectForKey:@"url"];
        
        NSString *name = [dict objectForKey:@"name"];
        detailViewController.title = name;
    }
}

@end
