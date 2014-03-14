//
//  ViewController.m
//  PageNavigation
//
//  Created by yuxin tang on 14-3-14.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                                             navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    
    UIStoryboard *mailStroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *page1ViewController = [mailStroyboard instantiateViewControllerWithIdentifier:@"page1"];
    
    //取出第一个视图控制器，作为PageViewController首页
    NSArray *viewControllers = @[page1ViewController];
    
    [self.pageViewController setViewControllers:viewControllers
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:YES
                                     completion:NULL];
    
    [self.view addSubview:self.pageViewController.view];
    
    pageIndex = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    pageIndex--;
    if (pageIndex < 0) {
        pageIndex = 0;
        return nil;
    }
    directionForward = ForwardBefore;
    
    UIStoryboard *mailStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NSString *pageId = [NSString stringWithFormat:@"page%i",pageIndex+1];
    UIViewController *pvController = [mailStoryboard instantiateViewControllerWithIdentifier:pageId];
    
    return pvController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    pageIndex++;
    
    if (pageIndex > 2) {
        pageIndex = 2;
        return nil;
    }
    directionForward = ForwardAfter;
    
    UIStoryboard *mailStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NSString *pageId = [NSString stringWithFormat:@"page%i", pageIndex+1];
    UIViewController *pvController = [mailStoryboard instantiateViewControllerWithIdentifier:pageId];
    
    return pvController;
    
}

#pragma mark - Page View Controller Delegate 
- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    self.pageViewController.doubleSided = NO;
    return UIPageViewControllerSpineLocationMin;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    if (!completed) {
        if (directionForward == ForwardAfter) {
            pageIndex--;
        }
        if (directionForward == ForwardBefore) {
            pageIndex++;
        }
    }
}
@end
