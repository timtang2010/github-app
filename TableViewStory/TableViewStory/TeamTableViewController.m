//
//  TeamTableViewController.m
//  TableViewStory
//
//  Created by yuxin tang on 14-2-22.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "TeamTableViewController.h"
#import "TeamTableViewCell.h"

@interface TeamTableViewController ()

@end

@implementation TeamTableViewController

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
    /*
     _teamLabel = [NSMutableArray arrayWithObjects:
                    @"A1-南非",
                    @"A2-墨西哥",
                    @"B1-阿根廷",
                    @"B2-尼日利亚",
                    @"C1-英格兰",
                    @"C2-美国",
                    @"D1-德国",
                    @"D2-澳大利亚",
                    @"E1-荷兰",
                    @"E2-丹麦",
                    @"G1-巴西",
                    @"G2-朝鲜",
                    @"H1-西班牙",
                    @"H2-瑞士",
                    nil];

    
    _teamName = [NSMutableArray arrayWithObjects:
                  @"SouthAfrica",
                  @"Mexico",
                  @"Argentina",
                  @"Nigeria",
                  @"England",
                  @"USA",
                  @"Germany",
                  @"Australia",
                  @"Holland",
                  @"Denmark",
                  @"Brazil",
                  @"NorthKorea",
                  @"Spain",
                  @"Switzerland",
                  nil];
    
    _teamImagel = [NSMutableArray arrayWithObjects:
                 @"SouthAfrica",
                 @"Mexico",
                 @"Argentina",
                 @"Nigeria",
                 @"England",
                 @"USA",
                 @"Germany",
                 @"Australia",
                 @"Holland",
                 @"Denmark",
                 @"Brazil",
                 @"NorthKorea",
                 @"Spain",
                 @"Switzerland",
                 nil];
     */
    NSString *path = [[NSBundle mainBundle]pathForResource:@"team"
                                                    ofType:@"plist"];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]
                                 initWithContentsOfFile:path];
    
    _teamName = [dict objectForKey:@"name"];
    _teamLabel = [dict objectForKey:@"image"];
    _teamImagel = [dict objectForKey:@"image"];
    

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

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return _teamName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"teanTabelCell";
    
    TeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    long row = [indexPath row];
    
    cell.TeamName.text = _teamName[row];
    cell.TeamLabel.text = _teamLabel[row];
    cell.TeamImage.image = [UIImage imageNamed:_teamImagel[row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Remove the row from data model 从数据模型中删除的行
    [_teamName removeObjectAtIndex:indexPath.row];
    [_teamLabel removeObjectAtIndex:indexPath.row];
    [_teamImagel removeObjectAtIndex:indexPath.row];
    //Request table view to reload 请求表视图重装
    [tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
