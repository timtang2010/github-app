//
//  ViewController.m
//  SearchbarSimpleTable
//
//  Created by yuxin tang on 14-2-26.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UISearchBarDelegate>

//从team_dictionary.pist文件中读取出来的数据
@property (nonatomic, strong) NSDictionary *dictData;
//小组合集合
@property (nonatomic, strong) NSArray *listGroupname;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"team_dictionary"
                                           ofType:@"plist"];
    //获取属性列表中的全部数据
    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSArray * tempList = [self.dictData allKeys];
    //对key进行排序
    self.listGroupname = [tempList sortedArrayUsingSelector:@selector(compare:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回全部的小组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.listGroupname count];
}

//一个小组一个集合
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *groupName = [self.listGroupname objectAtIndex:section];
    return groupName;
}

//取得索引中的全部数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //按照节索引从小组名中取得组名
    NSString *groupName = [self.listGroupname objectAtIndex:section];
    //将组名作为Key，从字典中取出球队数组集合
    NSArray *listTeams = [self.dictData objectForKey:groupName];
    return [listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:CellIdentifier];
    }
    //获得选择的节
    NSUInteger section = [indexPath section];
    //获得选择节选中的行索引
    NSUInteger row = [indexPath row];
    //按照节索引从小组名数组中获得组名
    NSString *groupName = [self.listGroupname objectAtIndex:section];
    //将组名作为Key，从字典中取得球队的数组集合
    NSArray *listTeams = [self.dictData objectForKey:groupName];
    
    cell.textLabel.text = [listTeams objectAtIndex:row];
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *listTitles = [[NSMutableArray alloc]initWithCapacity:[self.listGroupname count]];
    //把“A组“改为”A“
    for (NSString *item in self.listGroupname) {
        NSString *title = [item substringToIndex:2];
        //取几位作为索引
        [listTitles addObject:title];
    }
    return listTitles;
}
@end
