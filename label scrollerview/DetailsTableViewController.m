//
//  DetailsTableViewController.m
//  label scrollerview
//
//  Created by yuxin tang on 14-4-4.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "DetailsTableViewController.h"
#import "TableViewCell.h"

@interface DetailsTableViewController ()

@end

@implementation DetailsTableViewController
@class question;
@class answer;

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.listData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellInedntifier = @"Cell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellInedntifier
    
                                                          forIndexPath:indexPath];
    if (!cell) {
        cell = [[TableViewCell alloc]init];
    }
    
    NSInteger row = [indexPath row];
    NSDictionary * dict = [self.listData objectAtIndex:row];
    
    cell.question.text = [dict objectForKey:@"qusetion"];
    cell.answer.text = [dict objectForKey:@"Answer"];
    
    return cell;
}


@end
