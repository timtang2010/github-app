//
//  ViewController.h
//  test
//
//  Created by yuxin tang on 14-3-25.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZC_Details_ViewController.h"


@interface ZC_Sort_ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableVIew;

//创建静态字典
@property (strong, nonatomic) NSDictionary *dictData;
//创建数组
@property (strong, nonatomic) NSArray *listData;
@end
