//
//  YYService_ViewController.m
//  Community
//
//  Created by yuxin tang on 14-3-27.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "YYService_ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "YYHousekeeping_TableViewController.h"

@interface YYService_ViewController ()

@end

@implementation YYService_ViewController
@synthesize scrollView, slideImages;
@synthesize pageControl;

/*
 - (void)initArray
 {
 
 //存放图片的数组
 imageArray = [NSMutableArray arrayWithObjects:
 [UIImage imageNamed:@"project_img_1"],
 [UIImage imageNamed:@"project_img_2"],
 [UIImage imageNamed:@"project_img_3"],
 [UIImage imageNamed:@"project_img_4"],
 [UIImage imageNamed:@"project_img_5"],
 nil];
 
 
 }
 */

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
    
    
    //启动定时器
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(runTimePage) userInfo:nil repeats:YES];
    
    //初始化scrollView及摄制
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 320, 132)];
    scrollView.bounces = YES;//默认是YES，就是滚动超过边界会反弹，即有反弹回来的效果。若是NO，则滚动到达边界会立刻停止
    scrollView.pagingEnabled = YES;//是否自动滚动到subView边界
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;//滚动时是否显示水平滚动条
    [self.view addSubview:scrollView];
    
    //初始化数组并添加图片
    slideImages = [[NSMutableArray alloc] init];
    [slideImages addObject:@"project_img_1"];
    [slideImages addObject:@"project_img_2"];
    [slideImages addObject:@"project_img_3"];
    [slideImages addObject:@"project_img_4"];
    
    //初始化pageControl
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(140, 160, 39, 37)];
    [pageControl setCurrentPageIndicatorTintColor:[UIColor whiteColor]];
    [pageControl setPageIndicatorTintColor:[UIColor grayColor]];
    pageControl.numberOfPages = [self.slideImages count];
    pageControl.currentPage = 0;
    [pageControl addTarget:self action:@selector(turnPage) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
    
    //创建图片imageView
    for (int i = 0; i < [slideImages count]; i++)
    {
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[slideImages objectAtIndex:i]]];
        imageView.frame = CGRectMake((320 * i) + 320, 0, 320, 132);//首页是第0页，默认从第1页开始的，所以 + 320
        [scrollView addSubview:imageView];
    }
    
    //取数组最后一张图片放在第0页
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[slideImages objectAtIndex:([slideImages count] - 1)]]];
    //添加最后1页在首页循环
    imageView.frame = CGRectMake(0, 0, 320, 132);
    [scrollView addSubview:imageView];
    
    //取数组第0张图片放在最后一页
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[slideImages objectAtIndex:0]]];
    imageView.frame = CGRectMake((320 * ([slideImages count] + 1)) , 0, 320, 132);//添加第1页在最后循环
    [scrollView addSubview:imageView];
    
    [scrollView setContentSize:CGSizeMake(320 * ([slideImages count] + 2), 132)];//加上第1页和第4页，原理：4-[1-2-3-4]-1
    [scrollView setContentOffset:CGPointMake(0, 0)];
    [self.scrollView scrollRectToVisible:CGRectMake(320, 0, 320, 132) animated:NO];//默认从序号1位置放第1页，序号0位置位置放第4页
    
    
    /*
     [self initArray];
     [self configScrollView];
     */
}

//定时器绑定的方法
- (void)runTimePage
{
    //获取当前的page
    int page = pageControl.currentPage;
    page ++;
    page = page > 3 ? 0 : page ;
    pageControl.currentPage = page;
    
    [self turnPage];
}

//pageControl选择器的方法
- (void)turnPage
{
    //获取当前的page
    int page = pageControl.currentPage;
    //触摸pageController那个点点 往后翻一页 + 1
    [self.scrollView scrollRectToVisible:CGRectMake(320 * (page + 1), 0, 320, 132) animated: NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 - (void)configScrollView
 {
 
 
 //初始化UIScrollView,设置相关的属性，均可以在syoryBoard中设置
 CGRect frame = CGRectMake(0, 64, 320, 480);
 self.myScrollView = [[UIScrollView alloc]initWithFrame:frame];
 self.myScrollView.backgroundColor = [UIColor blackColor];
 self.myScrollView.pagingEnabled = YES;//以也为单位滑动，及自动那个到下一页的开始边界
 self.myScrollView.showsVerticalScrollIndicator = NO;
 self.myScrollView.showsHorizontalScrollIndicator = NO;//隐藏垂直和水平显示条
 
 
 
 //    self.myScrollView.delegate = self;
 //    UIImageView *firstView = [[UIImageView alloc]initWithImage:[imageArray lastObject]];
 //    CGFloat Width = self.myScrollView.frame.size.width;
 //    CGFloat Height = self.myScrollView.frame.size.height;
 //
 //
 //    firstView.frame = CGRectMake(0, 0, Width, Height);
 //    [self.myScrollView addSubview:firstView];
 //    //set the last as the first
 //
 //    for (int i=0; i < [imageArray count]; i++) {
 //        UIImageView *subViews = [[UIImageView alloc]initWithImage:[imageArray objectAtIndex:i]];
 //        subViews.frame = CGRectMake(Width*(i+1), 0, Width, Height);
 //        [self.myScrollView addSubview:subViews];
 //    }
 //    UIImageView *lastView = [[UIImageView alloc] initWithImage:[imageArray objectAtIndex:0]];
 //
 //
 //    lastView.frame = CGRectMake(Width*(imageArray.count+1), 0, Width, Height);
 //    [self.myScrollView addSubview:lastView];
 //    //set the fiest as the last
 //
 //    [self.myScrollView setContentSize:CGSizeMake(Width*(imageArray.count+2), Height)];
 //    [self.view addSubview:self.myScrollView];
 //    [self.myScrollView scrollRectToVisible:CGRectMake(Width, 0, Width, Height) animated:NO];
 //    //show the real first image, not the first in the scrollview
 
 
 //设置pageControl的位置，及相关的属性，可选
 CGRect pageControlFrame = CGRectMake(100, 160, 78, 36);
 self.pageControl = [[UIPageControl alloc]initWithFrame:pageControlFrame];
 
 [self.pageControl setBounds:CGRectMake(0, 0, 16*(self.pageControl.numberOfPages - 1), 16)];//设置pageCOntrol中点的间距为16
 [self.pageControl.layer setCornerRadius:8];//设置圆角
 
 //    self.pageControl.backgroundColor = [UIColor blueColor];
 //    self.pageControl.numberOfPages = imageArray.count;
 //
 //    self.pageControl.currentPage = 0;
 //    self.pageControl.enabled = YES;
 //    [self.view addSubview:self.pageControl];
 //
 //    [self.pageControl addTarget:self
 //                         action:@selector(pageTurn:)
 //               forControlEvents:UIControlEventValueChanged];
 //
 //    myTimer = [NSTimer scheduledTimerWithTimeInterval:2.0f
 //                                               target:self
 //                                             selector:@selector(scrollToNextPage:)
 //                                             userInfo:nil
 //                                              repeats:YES];
 }
 */

/*
 #pragma UIScrollView delegate
 - (void)scrollToNextPage:(id)sender
 {
 int pageNum = self.pageControl.currentPage;
 CGSize viewSize = self.myScrollView.frame.size;
 CGRect rect = CGRectMake((pageNum+2)*viewSize.width, 0, viewSize.width, viewSize.height);
 [self.myScrollView scrollRectToVisible:rect animated:NO];
 pageNum++;
 if (pageNum == imageArray.count) {
 CGRect newRect = CGRectMake(viewSize.width, 0, viewSize.width, viewSize.height);
 [self.myScrollView scrollRectToVisible:newRect animated:NO];
 }
 }
 */

/*
 - (void)scrollViewDidScroll:(UIScrollView *)scrollView
 {
 CGFloat pageWidth = self.myScrollView.frame.size.width;
 int currentPage = floor((self.myScrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
 if (currentPage == 0) {
 self.pageControl.currentPage = imageArray.count - 1;
 }else if (currentPage == imageArray.count + 1){
 self.pageControl.currentPage = 0;
 }
 self.pageControl.currentPage = currentPage - 1;
 }
 
 - (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
 {
 [myTimer invalidate];
 }
 
 - (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
 {
 myTimer = [NSTimer scheduledTimerWithTimeInterval:2.0f
 target:self
 selector:@selector(scrollToNextPage:)
 userInfo:nil
 repeats:YES];
 }
 
 
 - (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
 {
 CGFloat pageWidth = self.myScrollView.frame.size.width;
 CGFloat pageHeight = self.myScrollView.frame.size.height;
 int currentPage = floor((self.myScrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
 
 NSLog(@"the current offset == %f",self.myScrollView.contentOffset.x);
 NSLog(@"the current page == %d",currentPage);
 
 if (currentPage == 0) {
 [self.myScrollView scrollRectToVisible:CGRectMake(pageWidth*imageArray.count, 0, pageWidth, pageHeight) animated:NO];
 self.pageControl.currentPage = imageArray.count -1;
 NSLog(@"pageControl currentPage == %d",self.pageControl.currentPage);
 NSLog(@"the last image");
 return;
 }else if (currentPage == [imageArray count]+1){
 [self.myScrollView scrollRectToVisible:CGRectMake(pageWidth, 0, pageWidth, pageHeight) animated:NO];
 self.pageControl.currentPage = 0;
 NSLog(@"pageControl currentPage == %d",self.pageControl.currentPage);
 NSLog(@"the first image");
 return;
 }
 self.pageControl.currentPage =currentPage -1;
 NSLog(@"pageControl currentPage == %d",self.pageControl.currentPage);
 }
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"JZFW"]|
        [segue.identifier isEqualToString:@"JZWX"]|
        [segue.identifier isEqualToString:@"WYWX"]|
        [segue.identifier isEqualToString:@"DQWX"]|
        [segue.identifier isEqualToString:@"QTFW"])
    {
        YYHousekeeping_TableViewController *detailViewController = segue.destinationViewController;
        UIButton *btn = (UIButton *)sender;
        detailViewController.msg = btn.titleLabel.text;
        
    }
}    
    //    else if ([segue.identifier isEqualToString:@"ShowDetail_WY"])
    //    {
    //        YYHousekeeping_TableViewController *detailViewController = segue.destinationViewController;
    //        UIButton *btn = (UIButton *)sender;
    //        detailViewController.msg = btn.titleLabel.text;
    //    }
    //
    //    else if ([segue.identifier isEqualToString:@"ShowDetail_DQ"])
    //    {
    //        YYHousekeeping_TableViewController *detailViewController = segue.destinationViewController;
    //        UIButton *btn = (UIButton *)sender;
    //        detailViewController.msg = btn.titleLabel.text;
    //    }
    //
    //    else if ([segue.identifier isEqualToString:@"ShowDetail_QT"])
    //    {
    //        YYHousekeeping_TableViewController *detailViewController = segue.destinationViewController;
    //        UIButton *btn = (UIButton *)sender;
    //        detailViewController.msg = btn.titleLabel.text;
    //    }
    //
    //    else //if ([segue.identifier isEqualToString:@"ShowDetail_DQ"])
    //    {
    //        YYHousekeeping_TableViewController *detailViewController = segue.destinationViewController;
    //        UIButton *btn = (UIButton *)sender;
    //        detailViewController.msg = btn.titleLabel.text;
    //    }

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 
 - (IBAction)pageTurn:(UIPageControl *)sender {
 int pageNum = _pageControl.currentPage;
 CGSize viewSize = self.myScrollView.frame.size;
 [self.myScrollView setContentOffset:CGPointMake((pageNum +1)*viewSize.width, 0)];
 NSLog(@"mycrollView.contentOffSet.x==%f",_myScrollView.contentOffset.x);
 NSLog(@"pageControl currentPage == %d",self.pageControl.currentPage);
 [myTimer invalidate];
 }
 */
@end
