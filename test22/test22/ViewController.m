//
//  ViewController.m
//  test22
//
//  Created by yuxin tang on 14-4-14.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSDictionary *myDic;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //初始化数据
    NSArray *array1_=@[@"张铁林",
                       @"张国立",
                       @"张国荣",
                       @"张艺谋",
                       @"张惠妹"];
    
    NSArray *array2_=@[@"李小龙",
                       @"李小路"];
    
    NSArray *array3_=@[@"王刚",
                       @"王虎"];
    
    self.myDic=@{@"老张家":array1_,
                 @"老李家":array2_,
                 @"老王家":array3_};
    
    
    UITableView *myTableView_=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStylePlain];
    myTableView_.delegate=self;
    myTableView_.dataSource=self;
    //改变换行线颜色lyttzx.com
    myTableView_.separatorColor = [UIColor blueColor];
    //设定Header的高度，
    myTableView_.sectionHeaderHeight=50;
    //设定footer的高度，
    myTableView_.sectionFooterHeight=100;
    //设定行高
    myTableView_.rowHeight=100;
    //设定cell分行线的样式，默认为UITableViewCellSeparatorStyleSingleLine
    [myTableView_ setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    //设定cell分行线颜色
    [myTableView_ setSeparatorColor:[UIColor redColor]];
    //编辑tableView
    myTableView_.editing=NO;
    
    [self.view addSubview:myTableView_];
    
    //跳到指的row or section
    [myTableView_ scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:2]
                        atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    
}



//指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.myDic allKeys] count];
}


//每个section底部标题高度（实现这个代理方法后前面 sectionHeaderHeight 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

//每个section头部标题高度（实现这个代理方法后前面 sectionFooterHeight 设定的高度无效）
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

//每个section头部的标题－Header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [[self.myDic allKeys] objectAtIndex:section];
}

//每个section底部的标题－Footer
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return nil;
}

//用以定制自定义的section头部视图－Header
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

//用以定制自定义的section底部视图－Footer
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIImageView *imageView_=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    imageView_.image=[UIImage imageNamed:@"1000.png"];
    return imageView_ ;
}


//指定每个分区中有多少行，默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.myDic objectForKey:[[self.myDic allKeys]objectAtIndex:section]] count];
}

//改变行的高度（实现主个代理方法后 rowHeight 设定的高度无效）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SimpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier: SimpleTableIdentifier];
        
        if (indexPath.row == 0) {
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        }
        else {
            [cell setAccessoryType:UITableViewCellAccessoryNone];
        }
        //设定附加视图
//        [cell setAccessoryType:UITableViewCellAccessoryNone];
        //        UITableViewCellAccessoryNone,                   // 没有标示
        //        UITableViewCellAccessoryDisclosureIndicator,    // 下一层标示
        //        UITableViewCellAccessoryDetailDisclosureButton, // 详情button
        //        UITableViewCellAccessoryCheckmark               // 勾选标记
        
        //设定选中cell时的cell的背影颜色
        cell.selectionStyle=UITableViewCellSelectionStyleBlue;     //选中时蓝色效果
        //        cell.selectionStyle=UITableViewCellSelectionStyleNone; //选中时没有颜色效果
        //        cell.selectionStyle=UITableViewCellSelectionStyleGray;  //选中时灰色效果
        //
        //        //自定义选中cell时的背景颜色
        //        UIView *selectedView = [[UIView alloc] initWithFrame:cell.contentView.frame];
        //        selectedView.backgroundColor = [UIColor orangeColor];
        //        cell.selectedBackgroundView = selectedView;
        //        [selectedView release];
        
        
        //        cell.selectionStyle=UITableViewCellAccessoryNone; //行不能被选中
        
    }
    
    //这是设置没选中之前的背景颜色
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.imageView.image=[UIImage imageNamed:@"1001.jpg"];//未选cell时的图片
    cell.imageView.highlightedImage=[UIImage imageNamed:@"1002.jpg"];//选中cell后的图片
    cell.textLabel.text=[[self.myDic objectForKey:[[self.myDic allKeys]objectAtIndex:indexPath.section]]objectAtIndex:indexPath.row];
    return cell;
}


//行缩进
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row = [indexPath row];
    return row;
}

//选中Cell响应事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    
    //得到当前选中的cell
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"cell=%@",cell);
}

//行将显示的时候调用，预加载行
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"将要显示的行是\n cell=%@  \n indexpath=%@",cell,indexPath);
}

//选中之前执行,判断选中的行（阻止选中第一行）
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    if (row == 0)
        return nil;
    return indexPath;
}



//编辑状态，点击删除时调用
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//cell右边按钮格式为UITableViewCellAccessoryDetailDisclosureButton时，点击按扭时调用的方法
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"当前点击的详情button \n indexpath=%@",indexPath);
}

//右侧添加一个索引表
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [self.myDic allKeys];
}

//划动cell是否出现del按钮
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//设定横向滑动时是否出现删除按扭,（阻止第一行出现）
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return UITableViewCellEditingStyleNone;
    }
    else{
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleDelete;
}

//自定义划动时delete按钮内容
- (NSString *)tableView:(UITableView *)tableView
titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除这行";
    
}

//开始移动row时执行
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath
{
    NSLog(@"sourceIndexPath=%@",sourceIndexPath);
    NSLog(@"sourceIndexPath=%@",destinationIndexPath);
}

//滑动可以编辑时执行
-(void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willBeginEditingRowAtIndexPath");
}

//将取消选中时执行, 也就是上次先中的行
-(NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"上次选中的行是  \n indexpath=%@",indexPath);
    return indexPath;
}


//让行可以移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

//移动row时执行
-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    NSLog(@"targetIndexPathForMoveFromRowAtIndexPath");
    //用于限制只在当前section下面才可以移动
    if(sourceIndexPath.section != proposedDestinationIndexPath.section){
        return sourceIndexPath;
    }
    return proposedDestinationIndexPath;
}

@end
