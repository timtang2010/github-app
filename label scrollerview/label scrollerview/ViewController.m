//
//  ViewController.m
//  label scrollerview
//
//  Created by yuxin tang on 14-4-4.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"Property List_ZC"
                                      ofType:@"plist"];
    
    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.listData = [self.dictData allKeys];
    
    self.title = @"信息查询";
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                           forIndexPath:indexPath];
    NSInteger row = [indexPath row];
    
    cell.textLabel.text = [self.listData objectAtIndex:row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowSelected"]) {
        TableViewController *citiesViewController = segue.destinationViewController;
        NSInteger selectedIndex = [[self.tabelView indexPathForSelectedRow]row];
        NSString *selectName = [self.listData objectAtIndex:selectedIndex];
        citiesViewController.listdata = [self.dictData objectForKey:selectName];
        citiesViewController.title = selectName;
    }
}

@end
