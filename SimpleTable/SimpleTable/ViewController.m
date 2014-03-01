//
//  ViewController.m
//  SimpleTable
//
//  Created by yuxin tang on 14-2-24.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UISearchBarDelegate, UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
//listTeams是为了装载全部球队的信息
@property (nonatomic, strong) NSArray *listTeams;
//listFilterTeams是查询之后的球队信息
@property (nonatomic, strong) NSMutableArray *listFilterTeams;

//filterContentForSearchText:scope:方法用于查询过滤结果集,其中searchText是查询条件,scope 是查询范围的索引
- (void)filterContentForSearchText:(NSString *)searchText scope:(NSUInteger)scope;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    //设定搜索栏ScopeBar隐藏
//    [self.searchBar setShowsScopeBar:NO];
//    [self.searchBar sizeToFit];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *pliatPath = [bundle pathForResource:@"team"
                                           ofType:@"plist"];
    
    //获取属性列表文件中的全部数据
    self.listTeams = [[NSArray alloc]initWithContentsOfFile:pliatPath];
    
    //初期进入查询所有数据
    [self filterContentForSearchText:@"" scope:-1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listFilterTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSInteger row = [indexPath row];
    NSDictionary *rowDict = [self.listFilterTeams objectAtIndex:row];
    cell.textLabel.text = [rowDict objectForKey:@"name"];
    
    NSString *imagePath = [rowDict objectForKey:@"image"];
    imagePath = [imagePath stringByAppendingString:@".png"];
    cell.imageView.image = [UIImage imageNamed:imagePath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)filterContentForSearchText:(NSString *)searchText scope:(NSUInteger)scope
{
    if ([searchText length] == 0) {
        //查询所有
        self.listFilterTeams = [NSMutableArray arrayWithArray:self.listTeams];
        return;
    }
    NSPredicate *scopePredicate;
    NSArray *tempArray;
    
    switch (scope) {
        case 0: //英文
            scopePredicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@", searchText];
            tempArray = [self.listTeams filteredArrayUsingPredicate:scopePredicate];
            self.listFilterTeams = [NSMutableArray arrayWithArray:tempArray];
            break;
        case 1:
            scopePredicate = [NSPredicate predicateWithFormat:@"SELF.image contains[c] %@", searchText];
            tempArray = [self.listTeams filteredArrayUsingPredicate:scopePredicate];
            self.listFilterTeams = [NSMutableArray arrayWithArray:tempArray];
            break;
            
        default:
            //查询所有
            self.listFilterTeams = [NSMutableArray arrayWithArray:self.listTeams];
            break;
    }
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:self.searchBar.selectedScopeButtonIndex];
    //如果返回yes，则表示图从新加载
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:self.searchBar.text scope:searchOption];
    //如果返回yew，则表示图可以重新加载
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    //查询所有
    [self filterContentForSearchText:@"" scope:-1];
}
@end
