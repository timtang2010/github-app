//
//  RootTabBar_ViewController.m
//  Community
//
//  Created by WEB08-V5MCS006 on 14-4-1.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "RootTabBar_ViewController.h"

@interface RootTabBar_ViewController ()

@end

@implementation RootTabBar_ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.hidden = YES;
    
    [self createCustomTabBar];
    [self createSpaceImageView];
}

- (void)createCustomTabBar
{
    UIImageView * backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 519, 320, 49)];
    backgroundImageView.image = [UIImage imageNamed:@"底部.png"];
    backgroundImageView.tag = 999;
    backgroundImageView.userInteractionEnabled = YES;
    [self.view addSubview:backgroundImageView];
    
    //创建一个数组临时存放文字
    NSArray * textArray = [NSArray arrayWithObjects:@"预约服务" , @"信息查询", @"政策助手", @"个人中心", nil];
    self.images = [[NSMutableArray alloc] init];
    self.selectImages = [[NSMutableArray alloc] init];
 
    for (int i = 0; i < 4; i++)
    {
        NSString * imageName = [NSString stringWithFormat:@"tabBar_%d.png", i];
        [self.images addObject:imageName];
        NSString * selectedImageName = [NSString stringWithFormat:@"tabBarRed_%d.png", i];
        [self.selectImages addObject:selectedImageName];
        
        //创建button容器，包含imageView、label
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        
        //创建imageView添加到button容器中
        UIImage * image = [UIImage imageNamed:imageName];
        UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
        [imageView setFrame:CGRectMake(24.25, 1, 30, 30)];
        [button addSubview:imageView];
        imageView.tag = 10 + i;
        
        [button setFrame:CGRectMake(i * 80.5, 1, 80, 49)];
        [backgroundImageView addSubview:button];
        
        //创建label添加到button容器中
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(5, button.frame.size.height - 20, 70, 20)];
        [label setText:[textArray objectAtIndex:i]];
        label.backgroundColor = [UIColor blackColor];
        label.textColor = [UIColor whiteColor];
        [label setFont:[UIFont systemFontOfSize:10]];
        label.textAlignment = NSTextAlignmentCenter;
        [button addSubview:label];
        label.tag = 20 + i;
        
        //设置初始状态
        if (i == 0)
        {
            button.selected = YES;
            label.textColor = [UIColor redColor];
            imageView.image = [UIImage imageNamed:selectedImageName];
        }
    }
    
    //创建indicatorImage指示条
    UIImageView * indicatorImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 47, 78.5, 3)];
    [indicatorImage setImage:[UIImage imageNamed:@"底部移动.png"]];
    indicatorImage.tag = 888;
    [backgroundImageView addSubview:indicatorImage];
}

- (void)createSpaceImageView
{
    UIImageView * spaceImageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(78.5, 519, 2, 49)];
    [spaceImageView1 setImage:[UIImage imageNamed:@"底部间隔.png"]];
    [self.view addSubview:spaceImageView1];
    
    UIImageView * spaceImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(159, 519, 2, 49)];
    [spaceImageView2 setImage:[UIImage imageNamed:@"底部间隔.png"]];
    [self.view addSubview:spaceImageView2];
    
    UIImageView * spaceImageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(239.5, 519, 2, 49)];
    [spaceImageView3 setImage:[UIImage imageNamed:@"底部间隔.png"]];
    [self.view addSubview:spaceImageView3];
}

- (void)clickButton:(UIButton *)button
{
    self.selectedIndex = button.tag;
    
    UIImageView * backgroundImageView = (UIImageView *)[self.view viewWithTag:999];
    
    //遍历在backgroundImageView里的所有subViews
    for (UIView * subView_1 in backgroundImageView.subviews)
    {
        if (![subView_1 isKindOfClass:[UIButton class]])
        {
            continue;
        }
        
        UIButton * btn = (UIButton *)subView_1;
        
        if (btn.tag == button.tag)
        {
            btn.selected = YES;
 
            for (UIView * subView_2 in btn.subviews)
            {
                //imageView
                if (subView_2.tag == button.tag + 10)
                {
                    UIImageView * imageView = (UIImageView *)subView_2;
                    imageView.image = [UIImage imageNamed:[self.selectImages objectAtIndex:button.tag]];
                }
                //label
                else if (subView_2.tag == button.tag + 20)
                {
                    UILabel * label = (UILabel *)subView_2;
                    label.textColor = [UIColor redColor];
                }
            }
        }
        else
        {
            btn.selected = NO;
            
            for (UIView * subView_2 in btn.subviews)
            {
                //label.tag --> 20+
                if (subView_2.tag >= 20)
                {
                    UILabel * label = (UILabel *)subView_2;
                    label.textColor = [UIColor whiteColor];
                }
                else if (subView_2.tag >= 10)
                {
                    //imageView.tag --> 10+
                    UIImageView * imageView = (UIImageView *)subView_2;
                    imageView.image = [UIImage imageNamed:[self.images objectAtIndex:imageView.tag - 10]];
                }
            }
        }
    }
    
    UIImageView * indicatorImage = (UIImageView *)[backgroundImageView viewWithTag:888];
    
    //设置缓冲动画，将要延迟执行的代码片段
    [UIView animateWithDuration:0.2
                     animations:^{
                         //根据点击的Button，改变indicatorImage的横坐标
                         CGRect frame = indicatorImage.frame;
                         frame.origin.x = button.tag * 78.5 + button.tag + 2;
                         indicatorImage.frame = frame;
                     }];
}

@end
