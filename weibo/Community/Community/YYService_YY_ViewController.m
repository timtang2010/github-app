//
//  YYService_YY_ViewController.m
//  Community
//
//  Created by WEB08-V5MCS006 on 14-4-10.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "YYService_YY_ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "YYServiece_YYWithMyCell_TableViewCell.h"
#import "UITableView+DataSourceBlocks.h"
#import "TableViewWithBlock.h"
#import "YYService_YYWithBigTableForMyCell_TableViewCell.h"
#import "YYService_YY_GaodeViewController.h"
#import "RootTabBar_ViewController.h"

@interface YYService_YY_ViewController ()

@end

@implementation YYService_YY_ViewController
{
    NSDictionary *dictData;
    NSArray *nameData;
    NSArray *addressData;
    NSArray *phoneData;
    NSArray *imagePhoto;
}

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
    
    //使用单例获取RootTabBar_ViewController
    RootTabBar_ViewController * rootTabBar_ViewController = (RootTabBar_ViewController *)[RootTabBar_ViewController getInstance];
    
    //隐藏自定义tabBar
    [rootTabBar_ViewController hideCustomTabBar:YES];
    
    //注册BigTable
    [self.tableView registerClass:[YYService_YYWithBigTableForMyCell_TableViewCell class] forCellReuseIdentifier:@"identifier"];
    
    //设置字典
    NSString * pathString = [[NSBundle mainBundle]pathForResource:@"shanghai area" ofType:@"plist"];
    self.dic = [NSDictionary dictionaryWithContentsOfFile:pathString];
    self.keys = [self.dic allKeys];
    self.keys = [self.keys sortedArrayUsingSelector:@selector(compare:)];
    self.keyCount = [self.keys count];
    
    self.values = nil;
    self.valueCount = 0;
    
    //配置textField的初始值
    self.districtTextField.font = [UIFont systemFontOfSize:13];
    self.districtTextField.text = @"全部";
    self.streetTextField.font = [UIFont systemFontOfSize:13];
    self.streetTextField.text = @"全部街道";
    
    //设置当前默认状态是关闭
    isOpened = NO;
    
    //设置初始 tableViewWithBlock1，tableViewWithBlock2 的高度
    CGRect frame1 = self.tableViewWithBlock1.frame;
    frame1.size.height = 0;
    [self.tableViewWithBlock1 setFrame:frame1];
    CGRect frame2 = self.tableViewWithBlock2.frame;
    frame2.size.height = 0;
    [self.tableViewWithBlock2 setFrame:frame2];
    
    //配置tableViewWithBlock
    [self configTableViewBlock];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Property List" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc]initWithContentsOfFile:path];
    nameData = [dict objectForKey:@"name"];
    addressData = [dict objectForKey:@"address"];
    phoneData = [dict objectForKey:@"phone"];
    imagePhoto = [dict objectForKey:@"image"];
}

- (void)configTableViewBlock
{
    [self.tableViewWithBlock1 initTableViewDataSourceAndDelegate:^(UITableView * tableView, NSInteger section)
    {
        return self.keyCount;
        
    } setCellForIndexPathBlock:^(UITableView * tableView, NSIndexPath * indexPath)
    {
        YYServiece_YYWithMyCell_TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        
        cell.textLabel.text = [self.keys objectAtIndex:[indexPath row]];
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        
        return cell;
        
    } setDidSelectRowBlock:^(UITableView * tableView, NSIndexPath * indexPath)
    {
        YYServiece_YYWithMyCell_TableViewCell * cell = (YYServiece_YYWithMyCell_TableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        
        self.districtTextField.text = cell.textLabel.text;
        self.values = [self.dic objectForKey:[self.keys objectAtIndex:[indexPath row]]];
        self.valueCount = [self.values count];
        [self.tableViewWithBlock2 reloadData];
        [self.openButton1 sendActionsForControlEvents:UIControlEventTouchUpInside];
    }];
    
    [self.tableViewWithBlock1.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.tableViewWithBlock1.layer setBorderWidth:1];
    
    //////////////////////////////////////////////////
    
    //配置tableViewWithBlock2
    [self.tableViewWithBlock2 initTableViewDataSourceAndDelegate:^(UITableView * tableView, NSInteger section)
     {
         return self.valueCount;
         
     } setCellForIndexPathBlock:^(UITableView * tableView, NSIndexPath * indexPath)
     {
         YYServiece_YYWithMyCell_TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
         
         [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
         
         cell.textLabel.text = [self.values objectAtIndex:[indexPath row]];
         cell.textLabel.font = [UIFont systemFontOfSize:13];
         
         return cell;
         
     } setDidSelectRowBlock:^(UITableView * tableView, NSIndexPath * indexPath)
     {
         YYServiece_YYWithMyCell_TableViewCell * cell = (YYServiece_YYWithMyCell_TableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
         
         self.streetTextField.text = cell.textLabel.text;
         [self.openButton2 sendActionsForControlEvents:UIControlEventTouchUpInside];
     }];
    
    [self.tableViewWithBlock2.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [self.tableViewWithBlock2.layer setBorderWidth:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//点击button1改变状态
- (IBAction)changeOpenStatus1:(id)sender
{
    if (isOpened)
    {
        [UIView animateWithDuration:0.3 animations:^
        {
            UIImage * closeImage = [UIImage imageNamed:@"dropdown.png"];
            [self.openButton1 setImage:closeImage forState:UIControlStateNormal];
            
            CGRect frame = self.tableViewWithBlock1.frame;
            //未展开tableView的高度
            frame.size.height = 0;
            [self.tableViewWithBlock1 setFrame:frame];
            
        } completion:^(BOOL finished)
        {
            isOpened=NO;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^
        {
            UIImage * openImage = [UIImage imageNamed:@"dropup.png"];
            [self.openButton1 setImage:openImage forState:UIControlStateNormal];
            
            CGRect frame = self.tableViewWithBlock1.frame;
            //展开后tableView的高度
            frame.size.height = 176;
            [self.tableViewWithBlock1 setFrame:frame];
            
        } completion:^(BOOL finished)
        {
            isOpened=YES;
        }];
    }
}

//点击button2改变状态
- (IBAction)changeOpenStatus2:(id)sender
{
    if (isOpened)
    {
        [UIView animateWithDuration:0.3 animations:^
         {
             UIImage * closeImage = [UIImage imageNamed:@"dropdown.png"];
             [self.openButton2 setImage:closeImage forState:UIControlStateNormal];
             
             CGRect frame = self.tableViewWithBlock2.frame;
             //未展开tableView的高度
             frame.size.height = 0;
             [self.tableViewWithBlock2 setFrame:frame];
             
         } completion:^(BOOL finished)
         {
             isOpened=NO;
         }];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^
         {
             UIImage * openImage = [UIImage imageNamed:@"dropup.png"];
             [self.openButton2 setImage:openImage forState:UIControlStateNormal];
             
             CGRect frame = self.tableViewWithBlock2.frame;
             //展开后tableView的高度
             frame.size.height = 176;
             [self.tableViewWithBlock2 setFrame:frame];
             
         } completion:^(BOOL finished)
         {
             isOpened=YES;
         }];
    }
}

//textField不可编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [nameData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    static NSString * identifier = @"identifier";
    
    YYService_YYWithBigTableForMyCell_TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    return cell;
    */
    static NSString *simpleTableIdentifier = @"Cell";
    YYService_YYWithBigTableForMyCell_TableViewCell *cell = (YYService_YYWithBigTableForMyCell_TableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.YYName.text = [nameData objectAtIndex:indexPath.row];
    cell.yyAddress.text =[addressData objectAtIndex:indexPath.row];
    cell.YYPhone.text = [phoneData objectAtIndex:indexPath.row];
    cell.YYImage.image = [UIImage imageNamed:[imagePhoto objectAtIndex:indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath, row = %d", [indexPath row]);
}

/*
- (IBAction)pushGaodeMapView:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    YYService_YY_GaodeViewController *gaodeViewController = [storyboard instantiateViewControllerWithIdentifier:@"YYService_YY_GaodeViewController"];
    
    //隐藏tabBar的
    //    [self setHidesBottomBarWhenPushed:YES];
    
    [self.navigationController pushViewController:gaodeViewController animated:YES];
}
*/

@end