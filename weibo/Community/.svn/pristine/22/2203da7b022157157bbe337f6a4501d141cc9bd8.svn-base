//
//  YYService_YY_GaodeViewController.m
//  Community
//
//  Created by yuxin tang on 14-4-17.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "YYService_YY_GaodeViewController.h"
//#import "PPiFlatSegmentedControl.h"
//#import "NSString+FontAwesome.h"

@interface YYService_YY_GaodeViewController ()
@property (strong, nonatomic) UISegmentedControl * uiscontrol;

@end

@implementation YYService_YY_GaodeViewController

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
    NSArray *scarray = [[NSArray alloc] initWithObjects:@"显示",@"隐藏",@"定位",nil];
	self.uiscontrol = [[UISegmentedControl alloc] initWithItems:scarray];
    self.uiscontrol.frame = CGRectMake(20, 525, 150, 25);
    self.uiscontrol.tintColor = [UIColor redColor];//设置分段器的颜色
    self.uiscontrol.backgroundColor = [UIColor whiteColor];//背景颜色
    self.uiscontrol.momentary = NO;//点击后是否恢复原样
    [self.uiscontrol addTarget:self
                        action:@selector(select:)
              forControlEvents:UIControlEventValueChanged];
    self.uiscontrol.selectedSegmentIndex = 0;//默认选中
    [self.view addSubview:self.uiscontrol];
    
    
    // Do any additional setup after loading the view.
    //高德地图
    // battery 20 nav 44
    int statusHeight = 64;
    self.mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, statusHeight, 320, 568)];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    
    //让分页栏显示在地图上
    [self.view insertSubview:self.uiscontrol aboveSubview:self.mapView];
    
    //动画显示
    [self.mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    //设置为地图位置移动
    /*
     //黑框
     int myViewPosY = self.mapView.frame.origin.y + self.mapView.frame.size.height;
     UIView *myview = [[UIView alloc]initWithFrame:CGRectMake(0, myViewPosY, 320, 568 - myViewPosY)];
     myview.backgroundColor = [UIColor blackColor];
     //按钮
     //    UIButton * btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
     //    btn.frame = CGRectMake(20, 20, 30, 30);
     //    [myview addSubview:btn];
     //分页栏
     UISegmentedControl * seg1 = [[UISegmentedControl alloc] initWithItems:@[@"开始", @"停止"]];
     UISegmentedControl * seg2 = [[UISegmentedControl alloc] initWithItems:@[@"无", @"跟随", @"头"]];
     [myview addSubview:seg1];
     [myview addSubview:seg2];
     
     seg1.frame = CGRectMake(22, 7, 90, 30);
     seg2.frame = CGRectMake(132, 7, 150, 30);
     [self.view addSubview:myview];
     */
    //    [self initToolBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)initToolBar
{
    PPiFlatSegmentedControl *segmented=[[PPiFlatSegmentedControl alloc]
                                        initWithFrame:CGRectMake(20, 525, 150, 25)
                                        items:@[
                                                @{@"text":@"显示"},
                                                @{@"text":@"隐藏"},
                                                @{@"text":@"定位"}
                                                ]
                                        iconPosition:IconPositionRight andSelectionBlock:^(NSUInteger segmentIndex) {
                                            
                                        }];
    segmented.color=[UIColor whiteColor];
    segmented.borderWidth=0.5;
    segmented.borderColor=[UIColor colorWithRed:244.0f/255.0 green:67.0f/255.0 blue:60.0f/255.0 alpha:1];
    segmented.selectedColor=[UIColor colorWithRed:244.0f/255.0 green:67.0f/255.0 blue:60.0f/255.0 alpha:1];
    segmented.textAttributes=@{NSFontAttributeName:[UIFont systemFontOfSize:13],
                               NSForegroundColorAttributeName:
                                   [UIColor colorWithRed:244.0f/255.0 green:67.0f/255.0 blue:60.0f/255.0 alpha:1]};
    
    segmented.selectedTextAttributes=@{NSFontAttributeName:[UIFont systemFontOfSize:13],
                                       NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    [self.view addSubview: segmented];
    
}
*/

//1.调用跟踪模式
- (void)mapView:(MAMapView *)mapView didChangeUserTrackingMode:(MAUserTrackingMode)mode animated:(BOOL)animated
{
    if (mode == MAUserTrackingModeFollow)
    {
        self.uiscontrol.selectedSegmentIndex = 2;
    }
    else
    {
        self.uiscontrol.selectedSegmentIndex = mode;
    }
}

- (void)select:(id)sender{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    switch (control.selectedSegmentIndex) {
        case 0:
            [self showsSegmentAction:control];
            break;
        case 1:
            [self hideSegmentAction:control];
            break;
        case 2:
            [self modeAction:control];
            break;
            
        default:
            break;
    }
}

//显示地图
- (void)showsSegmentAction:(UISegmentedControl *)sender
{
    self.mapView.showsUserLocation = YES;//!sender.selectedSegmentIndex;
}

//隐藏地图
- (void)hideSegmentAction:(UISegmentedControl *)sender
{
    self.mapView.showsUserLocation = NO;//!sender.selectedSegmentIndex;
}
//打开定位
- (void)modeAction:(UISegmentedControl *)sender
{
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
}

//自动定位的方法
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.mapView.showsUserLocation = YES;
}
@end
