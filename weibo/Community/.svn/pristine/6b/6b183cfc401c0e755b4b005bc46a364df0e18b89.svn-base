//
//  GRSetting_ViewController.m
//  Community
//
//  Created by WEB08-V5MCS006 on 14-4-1.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "GRSetting_ViewController.h"
#import "GRAboutUs_ViewController.h"

@interface GRSetting_ViewController ()

@end

@implementation GRSetting_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置初始值
    self.oldRow = -1;
    //设置字典
    self.dictionary = @{@"显示模式": @[@"图文模式", @"文字模式", @"智能模式（推荐）"], @" ": @[@"清除缓存", @"关于我们"]};
    //设置Key值
    self.keys = [self.dictionary allKeys];
    //使用比较排序
    [self.keys sortedArrayUsingSelector:@selector(compare:)];
    //创建可变数组
    NSMutableArray * array = [NSMutableArray arrayWithArray:self.keys];
    //交换位置
    [array exchangeObjectAtIndex:0 withObjectAtIndex:1];
    //形成新Array
    self.keys = [NSArray arrayWithArray:array];
    
    UIBarButtonItem * saveBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(clickSaveBarButtonItem:)];
    self.navigationItem.rightBarButtonItem = saveBarButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.keys count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString * key = [self.keys objectAtIndex:section];
    NSArray * value = [self.dictionary objectForKey:key];
    
    return [value count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"identifier";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    NSString * key = [self.keys objectAtIndex:[indexPath section]];
    NSArray * value = [self.dictionary objectForKey:key];
    
    cell.textLabel.text = [value objectAtIndex:[indexPath row]];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    [cell.detailTextLabel setTextColor:[UIColor grayColor]];
    
    if ([key isEqualToString:@"显示模式"])
    {
        //如果现在显示的行数等于曾经选中的行数
        if ([indexPath row] == self.oldRow)
        {
            //那么让当前行打勾
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else
        {
            //否则就不选中
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        switch ([indexPath row])
        {
            case 0:
            {
                cell.detailTextLabel.text = @"同时显示缩略图和文字，消耗流量较大";
                break;
            }
            case 1:
            {
                cell.detailTextLabel.text = @"仅显示文字，隐藏缩略图";
                break;
            }
            case 2:
            {
                cell.detailTextLabel.text = @"高速网络接入时自动使用图文模式";
                break;
            }
                
            default:
                break;
        }
    }
    
    if ([key isEqualToString:@" "])
    {
        cell.detailTextLabel.text = @" ";
    }
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.keys objectAtIndex:section];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * key = [self.keys objectAtIndex:[indexPath section]];
    
    if ([key isEqualToString:@"显示模式"])
    {
        //用曾经选中的行数创建一个oldIndexPath
        NSIndexPath * oldIndexPath = [NSIndexPath indexPathForRow:self.oldRow inSection:0];
        //用这个oldIndexPath获取曾经选中的内容cell
        UITableViewCell * cell = [tableView cellForRowAtIndexPath:oldIndexPath];
        //将它设置为未选中状态
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        //将现在选中的行数记录下来
        self.oldRow = [indexPath row];
        //通过传进来的indexPath获得当前的内容newCell
        UITableViewCell * newCell = [tableView cellForRowAtIndexPath:indexPath];
        //将现在的cell设置为选中打钩
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    if ([key isEqualToString:@" "])
    {
        if ([indexPath row] == 0)
        {
            self.alert = [[UIAlertView alloc]initWithTitle:@"您是否要清除缓存" message:@"清除后可能会影响运行速度" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [self.alert show];
        }
        
        if ([indexPath row] == 1)
        {
            GRAboutUs_ViewController * grAboutUs_ViewController = [[GRAboutUs_ViewController alloc]init];
            [self.navigationController pushViewController:grAboutUs_ViewController animated:YES];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}

- (void)clickSaveBarButtonItem:(UIBarButtonItem *)item
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"保存成功" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

@end
