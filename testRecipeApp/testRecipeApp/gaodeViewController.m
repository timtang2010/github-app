//
//  gaodeViewController.m
//  testRecipeApp
//
//  Created by yuxin tang on 14-4-16.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "gaodeViewController.h"

@interface gaodeViewController ()

@property (nonatomic,strong) UIPageControl *showSegmeng;

@property (nonatomic, strong)UISegmentedControl *showSegment;

@property (nonatomic, strong)UISegmentedControl *modeSegment;

@end

@implementation gaodeViewController

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
    // Do any additional setup after loading the view.
    
    //高德地图
    // battery 20 nav 44
    int statusHeight = 64;
    self.mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, statusHeight, 320, 568)];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    
    /*
    //黑框
    int myViewPosY = self.mapView.frame.origin.y + self.mapView.frame.size.height;
    UIView *myview = [[UIView alloc]initWithFrame:CGRectMake(0, myViewPosY, 320, 568 - myViewPosY)];
    myview.backgroundColor = [UIColor blackColor];
    //    //按钮
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
    
//    //开启定位(yes开启 no关闭)
//    self.mapView.showsUserLocation = YES;
    
//    //地图跟随位置
//    [self modeAction];
    
    [self initToolBar];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -MAMapViewDelegate
//当userTrackingMode改变时，调用此接口 mapView 地图View mode 改变后的mode animated 动画
- (void)mapview:(MAMapView *)mapView didChangeUserTrackingMode:(MAUserTrackingMode)mode animates:(BOOL)animated
{
    //索引号确定所选择的段（即，最后一个分段触摸）
    self.modeSegment.selectedSegmentIndex = mode;
}

#pragma mark = Action Handle 操作手势
//一个的UISegmentedControl对象是一个水平控制使多个区段，每个区段用作离散的按钮。分段控件提供了一次小型的手段组合在一起的一些控制。
- (void)showsSegmentAction:(UISegmentedControl *)sender
{
    //是否显示用户位置
    self.mapView.showsUserLocation = !sender.selectedSegmentIndex;
}

//索引号确定所选择的段（即，最后一个分段触摸）。
- (void)modeAction:(UISegmentedControl *)sender
{
    //定位用户位置的模式
    self.mapView.userTrackingMode = sender.selectedSegmentIndex;
}

#pragma mark - NSKeyValueObservering
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    //比较接收的字符串：是否显示用户位置
    if ([keyPath isEqualToString:@"showsUserLocation"])
    {
        //返回具有给定键关联的值 变化： 背景: 获取更多信息
        NSNumber *showsNum = [change objectForKey:NSKeyValueChangeNewKey];
        
        self.showSegment.selectedSegmentIndex = ![showsNum boolValue];
    }
}

#pragma mark -InitiaLization 初始化
- (void)initToolBar
{
    //加载第一个barbutton
    UIBarButtonItem *flexble = [[UIBarButtonItem alloc]
                                //空白到其他项目之间添加。该空间中的其他项目之间平均分配。
                                initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                target:nil
                                action:nil];
    
    //第一部分的名称
    self.showSegment = [[UISegmentedControl alloc]
                        initWithItems:[NSArray arrayWithObjects:
                                       @"显示",
                                       @"隐藏",
                                       nil]];
    
    //加载显示事件
    [self.showSegment addTarget:self
                         action:@selector(showsSegmentAction:)
               forControlEvents:UIControlEventValueChanged];
    
    //索引号确定所选择的段
    self.showSegment.selectedSegmentIndex = 0;
    
    //加载第二个barbutton
    UIBarButtonItem *showItem = [[UIBarButtonItem alloc]
                                 initWithCustomView:self.showSegment];
    
    //第二部分的名称
    self.modeSegment = [[UISegmentedControl alloc]
                        initWithItems:[NSArray arrayWithObjects:
                                       @"None",
                                       @"定位",
                                       @"Head",
                                       nil]];
    //加载显示事件
    //UIControlEventValueChanged 一种触摸拖动
    [self.modeSegment addTarget:self
                         action:@selector(modeAction:)
               forControlEvents:UIControlEventValueChanged];
    
    self.modeSegment.selectedSegmentIndex = 0;
    
    //初始化视图的新项目。
    UIBarButtonItem *modeItem = [[UIBarButtonItem alloc]
                                 initWithCustomView:self.modeSegment];
    
    self.toolbarItems = [NSArray arrayWithObjects:
                         flexble,
                         showItem,
                         flexble,
                         modeItem,
                         flexble,nil];
}

- (void)initObservers
{
    //添加观测器展示用户位置
    //add observer for showsUserLocation
    
    //指示改变字典应该提供新的属性值
    [self.mapView addObserver:self
                   forKeyPath:@"showsUserLocation"
                      options:NSKeyValueObservingOptionNew
                      context:nil];
}

- (void)returnAction
{
    
    //userTrackingMode 定位用户位置的模式
    self.mapView.userTrackingMode  = MAUserTrackingModeNone;
    
    [self.mapView removeObserver:self forKeyPath:@"showsUserLocation"];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

//设置地图是否跟随位置移动
- (void)modeAction
{
    //MAUserTrackingModeFollow 地图如下用户的位置
    [self.mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //barStyle工具栏风格，指定其外观 UIBarStyleBlack 使用黑色背景光的内容。
    self.navigationController.toolbar.barStyle = UIBarStyleBlack;
    //translucent 指示工具栏是否是半透明的
    self.navigationController.toolbar.translucent = YES;
    //内置工具栏的可见性。 (no不可见)
    [self.navigationController setToolbarHidden:NO animated:animated];
    
    [self initObservers];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //是否显示用户位置
    self.mapView.showsUserLocation = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
