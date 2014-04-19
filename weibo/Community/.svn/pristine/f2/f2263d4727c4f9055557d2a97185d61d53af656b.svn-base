//
//  ZCHelper_TableViewController.m
//  Community
//
//  Created by yuxin tang on 14-4-11.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ZCHelper_TableViewController.h"
#import "ZCHelper_DetailsViewController.h"
#import "ZCHelper_TableViewCell.h"

@interface ZCHelper_TableViewController ()
{
    NSMutableArray *arrayForBool;
    NSMutableArray *sectionTitleArray;
    NSMutableDictionary *sectionContentDict;
}

@end

@implementation ZCHelper_TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	NSDictionary *dict=[[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Property List_XX" ofType:@"plist"]];
	self.items=[dict valueForKey:@"Items"];
	self.itemsInTable=[[NSMutableArray alloc] init];
	[self.itemsInTable addObjectsFromArray:self.items];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.itemsInTable count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Title= [[self.itemsInTable objectAtIndex:indexPath.row] valueForKey:@"Name"];
    return [self createCellWithTitle:Title image:[[self.itemsInTable objectAtIndex:indexPath.row] valueForKey:@"Image name"] indexPath:indexPath];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic=[self.itemsInTable objectAtIndex:indexPath.row];
    ZCHelper_TableViewCell *cell = (ZCHelper_TableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    if([dic valueForKey:@"SubItems"])
    {
        NSArray *arr=[dic valueForKey:@"SubItems"];
        BOOL isTableExpanded=NO;
        
        for(NSDictionary *subitems in arr )
        {
            NSInteger index=[self.itemsInTable indexOfObjectIdenticalTo:subitems];
            isTableExpanded=(index>0 && index!=NSIntegerMax);
            if(isTableExpanded) break;
        }
        
        cell.isOpened = !isTableExpanded;
        [cell.btnExpand setImage:(cell.isOpened ? [UIImage imageNamed:@"up-arrow.png"] : [UIImage imageNamed:@"down-arrow.png"]) forState:UIControlStateNormal];
        // 关闭二级table
        if(isTableExpanded)
        {
            [self CollapseRows:arr];
        }
        // 打开二级table
        else
        {
            NSUInteger count=indexPath.row+1;
            NSMutableArray *arrCells=[NSMutableArray array];
            for(NSDictionary *dInner in arr )
            {
                [arrCells addObject:[NSIndexPath indexPathForRow:count inSection:0]];
                [self.itemsInTable insertObject:dInner atIndex:count++];
            }
            [self.menuTableView insertRowsAtIndexPaths:arrCells withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
    if ([cell indentationLevel] == 0)
        return;
    //获取UIStoryboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ZCHelper_DetailsViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ZCHelper_DetailsViewController"];
    //传表头的代码
    viewController.title = [sectionTitleArray objectAtIndex:indexPath.section];
    //传值的代码
    viewController.detailItem = [[sectionContentDict valueForKey:[sectionTitleArray objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)CollapseRows:(NSArray*)ar
{
	for(NSDictionary *dInner in ar )
    {
		NSUInteger indexToRemove=[self.itemsInTable indexOfObjectIdenticalTo:dInner];
		NSArray *arInner=[dInner valueForKey:@"SubItems"];
		if(arInner && [arInner count]>0)
        {
			[self CollapseRows:arInner];
		}
		
		if([self.itemsInTable indexOfObjectIdenticalTo:dInner]!=NSNotFound)
        {
			[self.itemsInTable removeObjectIdenticalTo:dInner];
			[self.menuTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:
                                                        [NSIndexPath indexPathForRow:indexToRemove inSection:0]
                                                        ]
                                      withRowAnimation:UITableViewRowAnimationLeft];
        }
	}
}

- (UITableViewCell*)createCellWithTitle:(NSString *)title image:(UIImage *)image  indexPath:(NSIndexPath*)indexPath
{
    NSString *CellIdentifier = @"Cell";
    ZCHelper_TableViewCell* cell = [self.menuTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor grayColor];
    cell.selectedBackgroundView = bgView;
    cell.lblTitle.text = title;
    cell.lblTitle.textColor = [UIColor blackColor];
    
    [cell setIndentationLevel:[[[self.itemsInTable objectAtIndex:indexPath.row] valueForKey:@"level"] intValue]];
    cell.indentationWidth = 25;
    
    float indentPoints = cell.indentationLevel * cell.indentationWidth;
    
    cell.contentView.frame = CGRectMake(indentPoints,cell.contentView.frame.origin.y,cell.contentView.frame.size.width - indentPoints,cell.contentView.frame.size.height);
    
#pragma mark 加载过滤第一条的方法
    //加载下面的方法
    UITapGestureRecognizer *headerTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionHeaderTapped:)];
    [bgView addGestureRecognizer:headerTapped];
    
    NSDictionary *d1=[self.itemsInTable objectAtIndex:indexPath.row] ;
    
    if([d1 valueForKey:@"SubItems"])
    {
        cell.btnExpand.alpha = 1.0;
        [cell.btnExpand setImage:(cell.isOpened ? [UIImage imageNamed:@"up-arrow.png"] : [UIImage imageNamed:@"down-arrow.png"]) forState:UIControlStateNormal];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        [cell.btnExpand addTarget:self action:@selector(showSubItems:) forControlEvents:UIControlEventTouchUpInside];
        //解决大类不显示箭头
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else
    {
        cell.btnExpand.alpha = 0.0;
        //小类箭头显示不正常
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

-(void)showSubItems :(id) sender
{
    UIButton *btn = (UIButton*)sender;
    CGRect buttonFrameInTableView = [btn convertRect:btn.bounds toView:self.menuTableView];
    NSIndexPath *indexPath = [self.menuTableView indexPathForRowAtPoint:buttonFrameInTableView.origin];
    
    //    BOOL isOpened = [[arrayForBool objectAtIndex:<#(NSUInteger)#>]]
    //cell.isOpened是我在cell里定义的一个状态位，每次点击展开关闭的时候设置，初始化为NO
    //    UIView * superView = [btn superview];
    //    while (![[superView class] isSubclassOfClass:[UITableViewCell class]])
    //    {
    //        superView = [superView superview];
    //    }
    //    ExpandableTableViewCell *cell = (ExpandableTableViewCell *)superView;
    //    [btn setImage:cell.isOpened ? [UIImage imageNamed:@"down-arrow.png"] : [UIImage imageNamed:@"up-arrow.png"] forState:UIControlStateNormal];
    
    //    if(btn.alpha==1.0)
    //    {
    //        if ([[btn imageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"down-arrow.png"]])
    //        {
    //            [btn setImage:[UIImage imageNamed:@"up-arrow.png"] forState:UIControlStateNormal];
    //        }
    //        else
    //        {
    //            [btn setImage:[UIImage imageNamed:@"down-arrow.png"] forState:UIControlStateNormal];
    //        }
    //
    //    }
    
    NSDictionary *d=[self.itemsInTable objectAtIndex:indexPath.row] ;
    NSArray *arr=[d valueForKey:@"SubItems"];
    if([d valueForKey:@"SubItems"])
    {
        BOOL isTableExpanded=NO;
        for(NSDictionary *subitems in arr )
        {
            NSInteger index=[self.itemsInTable indexOfObjectIdenticalTo:subitems];
            isTableExpanded=(index>0 && index!=NSIntegerMax);
            if(isTableExpanded) break;
        }
        
        UIView * superView = [btn superview];
        while (![[superView class] isSubclassOfClass:[UITableViewCell class]])
        {
            superView = [superView superview];
        }
        ZCHelper_TableViewCell *cell = (ZCHelper_TableViewCell *)superView;
        cell.isOpened = !isTableExpanded;
        [cell.btnExpand setImage:(cell.isOpened ? [UIImage imageNamed:@"up-arrow.png"] : [UIImage imageNamed:@"down-arrow.png"]) forState:UIControlStateNormal];
        if(isTableExpanded)
        {
            [self CollapseRows:arr];
        }
        else
        {
            NSUInteger count=indexPath.row+1;
            NSMutableArray *arrCells=[NSMutableArray array];
            for(NSDictionary *dInner in arr )
            {
                [arrCells addObject:[NSIndexPath indexPathForRow:count inSection:0]];
                [self.itemsInTable insertObject:dInner atIndex:count++];
            }
            [self.menuTableView insertRowsAtIndexPaths:arrCells withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
    
    
}

//
- (void)sectionHeaderTapped:(UITapGestureRecognizer *)gestureRecognizer {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:gestureRecognizer.view.tag];
    
    //只有第0列可以展开
    if (indexPath.row == 0) {
        
        //设置cell的打开关闭状态的代码
        BOOL collapsed = [[arrayForBool objectAtIndex:indexPath.section]boolValue];
        collapsed = !collapsed;
        
        [arrayForBool replaceObjectAtIndex:indexPath.section withObject:[NSNumber numberWithBool:collapsed]];
        
        //动画加载特定部分
        NSRange range = NSMakeRange(indexPath.section, 0);
        NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
        [self.tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationFade];
    }
}

//@implementation ZCHelper_TableViewController
//
//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    // Uncomment the following line to preserve selection between presentations.
//    // self.clearsSelectionOnViewWillAppear = NO;
//    
//    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Property List_XX" ofType:@"plist"]];
//    self.items = [dict
//                  valueForKey:@"Items"];
//    self.itemsInTable = [[NSMutableArray alloc]init];
//    [self.itemsInTable addObjectsFromArray:self.items];
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
////#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
////#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return [self.itemsInTable count];
//}
//
///**/
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSString *Title = [[self.itemsInTable objectAtIndex:indexPath.row] valueForKey:@"Name"];
//    
//    return [self createCellWithTitle:Title image:[[self.itemsInTable objectAtIndex:indexPath.row]valueForKey:@"Image name"]indexPath:indexPath];
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSDictionary *dic = [self.itemsInTable objectAtIndex:indexPath.row];
//    ZCHelper_TableViewCell *cell = (ZCHelper_TableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
//    
//    if ([dic valueForKey:@"SubItems"])
//    {
//        NSArray *arr = [dic valueForKey:@"SubItems"];
//        BOOL isTableExpanded = NO;
//        
//        for (NSDictionary *subitems in arr)
//        {
//            NSInteger index = [self.itemsInTable indexOfObjectIdenticalTo:subitems];
//            isTableExpanded = (index > 0 && index != NSIntegerMax);
//            if (isTableExpanded)
//                break;
//        }
//        //关闭二级table
//        if (isTableExpanded) {
//            [self CollapseRows:arr];
//        }
//        //打开二级table
//        else {
//            NSInteger count = indexPath.row + 1;
//            NSMutableArray *arrCells = [NSMutableArray array];
//            for (NSDictionary * dInner in arr) {
//                [arrCells addObject:[NSIndexPath indexPathForRow:count inSection:0]];
//                [self.itemsInTable insertObject:dInner atIndex:count++];
//            }
//            [self.menuTableView insertRowsAtIndexPaths:arrCells withRowAnimation:UITableViewRowAnimationLeft];
//        }
//    }
//    if ([cell indentationLevel] == 0)
//        return;
//        //获取storyboard
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        
//        ZCHelper_DetailsViewController *detailsViewController = [storyboard instantiateViewControllerWithIdentifier:@"ZCHelper_DetailsViewController"];
//        //传表头的代码
//        detailsViewController.title = [sectionTitleArray objectAtIndex:indexPath.section];
//        //传值的代码
//        detailsViewController.detailItem = [[sectionContentDict valueForKey:[sectionTitleArray objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row];
//        
//        [self.navigationController pushViewController:detailsViewController animated:YES];
//}
//
//- (void)CollapseRows:(NSArray *)ar
//{
//    for (NSDictionary *dInner in ar) {
//        NSUInteger indexToRemove = [self.itemsInTable indexOfObjectIdenticalTo:dInner];
//        NSArray *arInner = [dInner valueForKey:@"SubItems"];
//        if (arInner &&  [arInner count]>0)
//            
//        {
//            [self CollapseRows:arInner];
//        }
//        
//        if ([self.itemsInTable indexOfObjectIdenticalTo:dInner]!=NSNotFound)
//        {
//            [self.itemsInTable removeObjectIdenticalTo:dInner];
//            [self.menuTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexToRemove inSection:0]
//                                                        ]
//                                      withRowAnimation:UITableViewRowAnimationLeft];
//        }
//    }
//}
//
//- (UITableViewCell *)createCellWithTitle:(NSString *)title image:(UIImage *)image indexPath: (NSIndexPath *)indexPath
//{
//    NSString *CellIdentifier = @"Cell";
//    ZCHelper_TableViewCell *cell = [self.menuTableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    UIView *bgView = [[UIView alloc]init];
//    bgView.backgroundColor = [UIColor grayColor];
//    cell.selectedBackgroundView = bgView;
//    cell.lblTitle.text = title;
//    cell.lblTitle.textColor = [UIColor blackColor];
//    
//    [cell setIndentationLevel:[[[self.itemsInTable objectAtIndex:indexPath.row]valueForKey:@"lever"]intValue]];
//    cell.indentationWidth = 25;
//    
//    float indentPoints = cell.indentationLevel * cell.indentationWidth;
//    
//    cell.contentView.frame = CGRectMake(indentPoints,
//                                        cell.contentView.frame.origin.y,
//                                        cell.contentView.frame.size.width - indentPoints,
//                                        cell.contentView.frame.size.height);
//#pragma mark 加载过了第一条记录的方法
//    UITapGestureRecognizer *headerTapped = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionHeaderTapper:)];
//    [bgView addGestureRecognizer:headerTapped];
//    
//    NSDictionary *d1 = [self.itemsInTable objectAtIndex:indexPath.row];
//    
//    if ([d1 valueForKey:@"SubItems"])
//    {
//        cell.btnExpand.alpha = 1.0;
//        [cell.btnExpand setImage:(cell.isOpened ? [UIImage imageNamed:@"up-arrow.png"]:[UIImage imageNamed:@"down-arrow.png"]) forState:UIControlStateNormal];
//        [cell.btnExpand addTarget:self action:@selector(showSubItems:) forControlEvents:UIControlEventTouchUpInside];
//        
//        //去掉大类的箭头
//        cell.accessoryType = UITableViewCellAccessoryNone;
//    }
//    else {
//        cell.btnExpand.alpha = 0.0;
//    }
//    
//    return cell;
//    
//}
//
//- (void)showSubItems :(id)sender
//{
//    UIButton *btn = (UIButton *)sender;
//    CGRect buttonFrameInTableView = [btn convertRect:btn.bounds toView:self.menuTableView];
//    NSIndexPath *indexPath = [self.menuTableView indexPathForRowAtPoint:buttonFrameInTableView.origin];
//    
//    /*
//    if (btn.alpha == 1.0) {
//        if ([[btn imageForState:UIControlStateNormal] isEqual:[UIImage imageNamed:@"carat.png"]]) {
//            
//            [btn setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateNormal];
//        }
//        else
//        {
//            [btn setImage:[UIImage imageNamed:@"carat.png"] forState:UIControlStateNormal];
//        }
//    }
//    */
//    NSDictionary *d = [self.itemsInTable objectAtIndex:indexPath.row];
//    NSArray *arr = [d valueForKey:@"SubItems"];
//    if ([d valueForKey:@"SubItems"])
//    {
//        BOOL isTableExpanded= NO;
//        for (NSDictionary *subitems in arr)
//        {
//            NSInteger index = [self.itemsInTable indexOfObjectIdenticalTo:subitems];
//            isTableExpanded = (index > 0 && index !=NSIntegerMax);
//            if (isTableExpanded)
//                break;
//        }
//        UIView *superUIView = [btn superview];
//        while (![[superUIView class]isSubclassOfClass:[UITableViewCell class]]) {
//            superUIView = [superUIView superview];
//            
//        }
//        ZCHelper_TableViewCell *cell = (ZCHelper_TableViewCell *)superUIView;
//        cell.isOpened = !isTableExpanded;
//        [cell.btnExpand setImage:(cell.isOpened ? [UIImage imageNamed:@"up-arrow.png"]:[UIImage imageNamed:@"down-arrow.png"]) forState:UIControlStateNormal];
//        
//        if (isTableExpanded) {
//            [self CollapseRows:arr];
//        }
//        else
//        {
//            NSUInteger count=indexPath.row+1;
//            NSMutableArray *arrCells = [NSMutableArray array];
//            for (NSDictionary *dInner in arr) {
//                [arrCells addObject:[NSIndexPath indexPathForRow:count inSection:0]];
//                [self.itemsInTable insertObject:dInner atIndex:count++];
//            }
//            [self.menuTableView insertRowsAtIndexPaths:arrCells withRowAnimation:UITableViewRowAnimationLeft];
//        }
//    }
//}
//
//- (void)sectionHeaderTapper:(UITapGestureRecognizer *)gestureRecongizer
//{
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:gestureRecongizer.view.tag];
//    //只有第0列可以展开
//    if (indexPath.row == 0) {
//        //设置cell的打开关闭的状态的代码
//        BOOL collapsed = [[arrayForBool objectAtIndex:indexPath.section]boolValue];
//        collapsed = !collapsed;
//        
//        [arrayForBool replaceObjectAtIndex:indexPath.section withObject:[NSNumber numberWithBool:collapsed]];
//        
//        //动画加载特定部分
//        NSRange range = NSMakeRange(indexPath.section, 0);
//        NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
//        [self.tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationFade];
//    }
//}

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
