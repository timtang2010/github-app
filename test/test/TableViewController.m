//
//  TableViewController.m
//  test
//
//  Created by yuxin tang on 14-4-12.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"


@interface TableViewController (){
    NSMutableArray      *sectionTitleArray;
    NSMutableDictionary *sectionContentDict;
    NSMutableArray      *arrayForBool;
}

@end

@implementation TableViewController

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
    if (!sectionTitleArray) {
        sectionTitleArray = [NSMutableArray arrayWithObjects:@"Aachen", @"Berlin", @"Düren", @"Essen", @"Münster", nil];
    }
    if (!arrayForBool) {
        arrayForBool    = [NSMutableArray arrayWithObjects:[NSNumber numberWithBool:NO],
                           [NSNumber numberWithBool:NO],
                           [NSNumber numberWithBool:NO],
                           [NSNumber numberWithBool:NO],
                           [NSNumber numberWithBool:NO] , nil];
    }
    if (!sectionContentDict) {
        sectionContentDict  = [[NSMutableDictionary alloc] init];
        NSArray *array1     = [NSArray arrayWithObjects:@"bla 1", @"bla 2", @"bla 3", @"bla 4", nil];
        [sectionContentDict setValue:array1 forKey:[sectionTitleArray objectAtIndex:0]];
        NSArray *array2     = [NSArray arrayWithObjects:@"wurst 1", @"käse 2", @"keks 3", nil];
        [sectionContentDict setValue:array2 forKey:[sectionTitleArray objectAtIndex:1]];
        NSArray *array3     = [NSArray arrayWithObjects:@"banane", @"auto2", @"haus", @"eidechse", nil];
        [sectionContentDict setValue:array3 forKey:[sectionTitleArray objectAtIndex:2]];
        NSArray *array4     = [NSArray arrayWithObjects:@"hoden", @"pute", @"eimer", @"wichtel", @"karl", @"dreirad", nil];
        [sectionContentDict setValue:array4 forKey:[sectionTitleArray objectAtIndex:3]];
        NSArray *array5     = [NSArray arrayWithObjects:@"Ei", @"kanone", nil];
        [sectionContentDict setValue:array5 forKey:[sectionTitleArray objectAtIndex:4]];
    }

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
     return [sectionTitleArray count];;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if ([[arrayForBool objectAtIndex:section] boolValue]) {
        return [[sectionContentDict valueForKey:[sectionTitleArray objectAtIndex:section]] count];
    }
    return 1;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.clearsSelectionOnViewWillAppear = NO;
            self.preferredContentSize = CGSizeMake(320.0, 600.0);
        }
    }
    return self;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView              = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    
    headerView.tag                  = section;//标示的tag
    
    headerView.backgroundColor      = [UIColor whiteColor];
    
    UILabel *headerString           = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-20-50, 50)];
    BOOL manyCells                  = [[arrayForBool objectAtIndex:section] boolValue];
    if (!manyCells) {
        headerString.text = @"click to enlarge";
    }else{
        headerString.text = @"click again to reduce";
    }
    headerString.textAlignment      = NSTextAlignmentLeft;
    headerString.textColor          = [UIColor blackColor];
    [headerView addSubview:headerString];
    
    //加载下面的方法
    UITapGestureRecognizer  *headerTapped   = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                      action:@selector(sectionHeaderTapped:)];
    
    [headerView addGestureRecognizer:headerTapped];
    
    //up or down arrow depending on the bool
    UIImageView *upDownArrow        = [[UIImageView alloc] initWithImage:manyCells ? [UIImage imageNamed:@"upArrowBlack"] : [UIImage imageNamed:@"downArrowBlack"]];
    upDownArrow.autoresizingMask    = UIViewAutoresizingFlexibleLeftMargin;
    
    upDownArrow.frame               = CGRectMake(self.view.frame.size.width-40, 10, 30, 30);
    
    [headerView addSubview:upDownArrow];
    
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footer  = [[UIView alloc] initWithFrame:CGRectZero];
    return footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[arrayForBool objectAtIndex:indexPath.section] boolValue]) {
        return 50;
    }
    return 1;
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    BOOL manyCells  = [[arrayForBool objectAtIndex:indexPath.section] boolValue];
    if (!manyCells) {
        cell.textLabel.text = @"click to enlarge";
    }
    else{
        NSArray *content = [sectionContentDict valueForKey:[sectionTitleArray objectAtIndex:indexPath.section]];
        cell.textLabel.text = [content objectAtIndex:indexPath.row];
    }
    
    
    return cell;
}

//让我研究的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    ViewController *dvc;
//    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
//        dvc = [[ViewController alloc] initWithNibName:@"DetailViewController_iPhone"  bundle:[NSBundle mainBundle]];
//    }else{
//        dvc = [[ViewController alloc] initWithNibName:@"DetailViewController_iPad"  bundle:[NSBundle mainBundle]];
//    }
//    dvc.title        = [sectionTitleArray objectAtIndex:indexPath.section];
//    dvc.detailItem   = [[sectionContentDict valueForKey:[sectionTitleArray objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
//    
//    [self.navigationController pushViewController:dvc animated:YES];
    

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    viewController.title = [sectionTitleArray objectAtIndex:indexPath.section];
    viewController.detailItem   = [[sectionContentDict valueForKey:[sectionTitleArray objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}


#pragma mark - gesture tapped
- (void)sectionHeaderTapped:(UITapGestureRecognizer *)gestureRecognizer{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:gestureRecognizer.view.tag];
    
    //只有第0列可以展开
    if (indexPath.row == 0) {
        BOOL collapsed  = [[arrayForBool objectAtIndex:indexPath.section] boolValue];
        collapsed       = !collapsed;
        [arrayForBool replaceObjectAtIndex:indexPath.section withObject:[NSNumber numberWithBool:collapsed]];
        
        //reload specific section animated
        NSRange range   = NSMakeRange(indexPath.section, 1);
        NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationFade];
    }
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
