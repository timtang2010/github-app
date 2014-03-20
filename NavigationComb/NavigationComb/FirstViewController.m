//
//  FirstViewController.m
//  NavigationComb
//
//  Created by yuxin tang on 14-3-20.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "FirstViewController.h"
#import "DatailViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

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
    NSBundle *bundle = [NSBundle mainBundle]; //：应用程序，框架，插件。
    NSString *path = [bundle pathForResource:@"provinces_cities" ofType:@"plist"];

    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:path];//加载字典文件
    
    UINavigationController *navigationController = (UINavigationController *)self.parentViewController;
    NSString *selectProvinces = navigationController.tabBarItem.title;
    
    NSLog(@"%@",selectProvinces);
    
    //isEqualToString:如果它们具有相同的ID ，或者如果它们是NSOrderedSame在字面比较
    if ([selectProvinces isEqualToString:@"黑龙江"]) {
        self.listData = [self.dictData objectForKey:@"黑龙江省"];
        self.navigationItem.title = @"黑龙江省信息";
    } else if ([selectProvinces isEqualToString:@"吉林"]){
        self.listData = [self.dictData objectForKey:@"吉林省"];
        self.navigationItem.title = @"吉林省信息";
    } else {
        self.listData = [self.dictData objectForKey:@"辽宁省"];
        self.navigationItem.title = @"辽宁省信息";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.listData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    NSDictionary *dict = [self.listData objectAtIndex:row];
    cell.textLabel.text = [dict objectForKey:@"name"];
    // Configure the cell...
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        DatailViewController *detailViewController = segue.destinationViewController;
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow]row];
        NSDictionary *dict = [self.listData objectAtIndex:selectedIndex];
        detailViewController.url = [dict objectForKey:@"url"]; //加载网络
        detailViewController.title = [dict objectForKey:@"name"];//加载名称
    }
}

@end
