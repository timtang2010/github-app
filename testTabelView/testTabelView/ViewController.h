//
//  ViewController.h
//  testTabelView
//
//  Created by yuxin tang on 14-4-2.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *selectedSections;//存贮 NSNumber : (section)
}
@property (weak, nonatomic) IBOutlet UITableView *theTabelView;
@property (weak, nonatomic) UIButton *disclosureButton;

@end
