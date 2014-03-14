//
//  ViewController.h
//  PageNavigation
//
//  Created by yuxin tang on 14-3-14.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import <UIKit/UIKit.h>

enum DirectionForward
{
    ForwardBefore = 1 //向前
    ,ForwardAfter = 2 //向后
};

@interface ViewController : UIViewController <UIPageViewControllerDataSource,UIPageViewControllerDelegate>
{
    //当前Page的索引
    int pageIndex;
    //翻页的方向 BeforeForward 向前 AfterForward 向后
    int directionForward;
}

@property (strong, nonatomic) UIPageViewController *pageViewController;
@end
