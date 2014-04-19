//
//  ViewController.m
//  ImageView
//
//  Created by yuxin tang on 14-4-8.
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
    //设置图片url数组
    NSMutableArray *arr=[[NSMutableArray alloc]initWithObjects:
                         @"http://203.156.251.85/sqmis/uploads//imgs/20140408150038332.jpg",
                         @"http://203.156.251.85/sqmis/uploads//imgs/20140408143136483.jpg",
                         @"http://203.156.251.85/sqmis/uploads//imgs/20140408141926671.jpg", nil];
    //设置标题数组
    NSMutableArray *strArr = [[NSMutableArray alloc]initWithObjects:
                              @"上门服务",
                              @"关注夕阳红生活品质 关爱老年人视力健康 ",
                              @"金橘居委制作的道德讲评台宣传版面“登台亮相",nil];
    
    // 初始化自定义ScrollView类对象
    AOScrollerView *aSV = [[AOScrollerView alloc]initWithNameArr:arr titleArr:strArr height:200];
    //设置委托
    aSV.vDelegate = self;
    //添加进view
    [self.view addSubview:aSV];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma AOScrollViewDelegate
-(void)buttonClick:(int)vid{
    NSLog(@"%d",vid);
}

@end
