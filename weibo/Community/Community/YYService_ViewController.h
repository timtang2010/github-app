//
//  YYService_ViewController.h
//  Community
//
//  Created by yuxin tang on 14-3-27.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YYService_ViewController : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *slideImages;
@property (strong, nonatomic) UIPageControl *pageControl;

/*
 <UIScrollViewDelegate>
 {
 NSMutableArray *imageArray;//存放图片
 NSTimer *myTimer;//定时器
 }
 @property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
 @property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
 //@property (weak, nonatomic) IBOutlet UIButton *JZButton;
 //@property (weak, nonatomic) IBOutlet UIButton *WXButton;
 //@property (weak, nonatomic) IBOutlet UIButton *DQButton;
 //@property (weak, nonatomic) IBOutlet UIButton *WYButton;
 //@property (weak, nonatomic) IBOutlet UIButton *QTButton;
 @property (weak ,nonatomic) NSString *array;
 - (IBAction)pageTurn:(UIPageControl *)sender;
 */



@end
