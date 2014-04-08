//
//  ViewController.m
//  testTabelView
//
//  Created by yuxin tang on 14-4-2.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.view.backgroundColor = [UIColor redColor];
    //加载视图后进行任何额外的设置。
//    self.theTabelView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.theTabelView.delegate = self;
    self.theTabelView.dataSource = self;
//    [self.view addSubview:theTableView];
    
    if (selectedSections == nil) {
        selectedSections = [[NSMutableArray alloc] init];
        
        //添加分组的箭头按钮和事件toggleOpen
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0.0, 5.0, 35.0, 35.0);
        [button setImage:[UIImage imageNamed:@"carat.png"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        self.disclosureButton = button;
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int numbers = 0;
    if (selectedSections.count == 0) {
        numbers = 1;
    } else {
        numbers = 1;
        
        for (NSIndexPath *indexPath  in selectedSections) {
            if (section == indexPath.section) {
                numbers = 5;
            }
        }
    }
    return numbers;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ffcell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:@"ffcell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"    [%d, %d]", indexPath.section, indexPath.row];
    if (indexPath.row > 0) {
        cell.backgroundColor = [UIColor grayColor];
    } else {
        cell.backgroundColor = [UIColor clearColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        if (![selectedSections containsObject:indexPath]) {
            [selectedSections addObject:indexPath];
        }else {
            [selectedSections removeObject:indexPath];
        }
    }
    [self.theTabelView reloadData];
}

@end
