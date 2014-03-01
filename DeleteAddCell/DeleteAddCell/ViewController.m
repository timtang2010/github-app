//
//  ViewController.m
//  deleteaddcell
//
//  Created by yuxin tang on 14-2-28.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UINavigationItem *navgationItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *txtField;

@property (strong, nonatomic) NSMutableArray *listTeams;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //设置导航栏
    self.navgationItem.rightBarButtonItem = self.editButtonItem;
    self.navgationItem.title = @"单元格插入和删除";
    
//    self.txtField.hidden = YES;
    //初始化的时候是隐藏的！

    
    self.listTeams = [[NSMutableArray alloc]initWithObjects:
                      @"黑龙江",
                      @"吉林",
                      @"辽宁",nil];
    
}

#pragma mark --UIViewController声明手势方法，用于响应视图编辑状态变化
#pragma mark --UIViewController生命周期方法，用于响应视图编辑状态变化
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    //是否以动画形式过渡
    [self.tableView setEditing:editing animated:YES];
    if (editing) {
        self.txtField.hidden = NO;
    } else {
        self.txtField.hidden = YES;
    }
}

#pragma mark -- UITableViewDataSource协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listTeams count] + 1;
    //每次显示会多添加一行
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    BOOL b_addCell = (indexPath.row == self.listTeams.count);
    
    //cell中的内弄是否重复调用
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //cell初始化后的样式
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    if (!b_addCell) {
        //cell样式
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //cell显示的内容
        cell.textLabel.text = [self.listTeams objectAtIndex:indexPath.row];
        //添加的一行的代码//位置，内容，添加
    }else {
        self.txtField.frame = CGRectMake(10, 0, 300, 44);
        self.txtField.text = @"";
        [cell.contentView addSubview:self.txtField];
    }
    return cell;
}

#pragma mark -- UITableViewDelegate协议方法
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.listTeams count]) {
        //绿色的圆圈包围一个加号,添加
        return UITableViewCellEditingStyleInsert;
    } else {
        //红色圈圈的包围一个减号,删除
        return UITableViewCellEditingStyleDelete;
    }
    
    return UITableViewCellEditingStyleNone;
}

//是否可以移动单元格
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSString *stringToMove = [self.listTeams objectAtIndex:sourceIndexPath.row];
    [self.listTeams removeObjectAtIndex:sourceIndexPath.row];
    [self.listTeams insertObject:stringToMove atIndex:destinationIndexPath.row];
}

//用于实现删除或插入处理
#pragma mark -- UITabeleViewDataSource协议方法
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //删除的
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.listTeams removeObjectAtIndex:indexPath.row];
        
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
        
        [self.tableView reloadData];
    //插入的
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        //把txt数据插入到listTeams数组中
        [self.listTeams insertObject:self.txtField.text
                             atIndex:[self.listTeams count]];
        
        //withRowAnimation:参数可以设置删除时的动画效果
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
        
        //重新加载表视图数据
        [self.tableView reloadData];
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.listTeams count]) {
        return NO;
    } else {
        return YES;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark -- UITextFieldDelegate委托方法，关闭键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -- UITextFieldDelegate 委托方法，避免键盘遮挡文本框
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UITableViewCell *cell = (UITableViewCell *)[[textField superview]superview];
    [self.tableView setContentOffset:CGPointMake(0.0, cell.frame.origin.y)animated:YES];
    
}

@end
