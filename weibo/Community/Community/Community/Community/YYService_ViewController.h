//
//  YYService_ViewController.h
//  Community
//
//  Created by yuxin tang on 14-3-27.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYService_ViewController : UIViewController<UIScrollViewDelegate>
{
    NSMutableArray *imageArray;//存放图片
    NSTimer *myTimer;//定时器
}
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)pageTurn:(UIPageControl *)sender;


@end
