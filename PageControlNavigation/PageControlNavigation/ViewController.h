//
//  ViewController.h
//  PageControlNavigation
//
//  Created by yuxin tang on 14-3-10.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIScrollViewDelegate>

@property (strong, nonatomic) UIView *page1;
@property (strong, nonatomic) UIView *page2;
@property (strong, nonatomic) UIView *page3;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)changePage:(id)sender;


@end
