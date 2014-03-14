//
//  ViewController.h
//  PageNacigation
//
//  Created by yuxin tang on 14-3-14.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate> {
    //当前页面的索引
    int pageIndex;
}
@property (strong, nonatomic)UIPageViewController *pageViewController;


@end
