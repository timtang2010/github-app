//
//  ViewController.m
//  PageNacigation
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
    self.view.frame = CGRectMake(0.0f, 0.0f, 320.0f, 480.0f);
    self.pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                                             navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                           options:nil];
    
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *page1ViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"page1"];
    
    //第一个视图，作为PageViewController首页
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
    UIStoryboard *mailStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle:nil];
    NSString *pageId = [NSString stringWithFormat:@"Page%i",pageIndex+1];
    UIViewController *PvController = [mailStoryboard instantiateViewControllerWithIdentifier:pageId];
    
    return PvController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    pageIndex++;
    
    if (pageIndex > 2) {
        pageIndex = 2;
        return nil;
    }
    UIStoryboard *mailSoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                            bundle:nil];
    NSString *pageId = [NSString stringWithFormat:@"page%i",pageIndex+1];
    UIViewController *pvController = [mailSoryboard instantiateViewControllerWithIdentifier:pageId];
    
    return pvController;
}

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    UIStoryboard *mailStroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *page1ViewController = [mailStroyboard instantiateViewControllerWithIdentifier:@"page1"];
    UIViewController *page2ViewCOntroller = [mailStroyboard instantiateViewControllerWithIdentifier:@"page2"];
    
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
        NSArray *viewControllers = @[page1ViewController, page2ViewCOntroller];
        [self.pageViewController setViewControllers:viewControllers
                                          direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
        self.pageViewController.doubleSided = NO;
        return UIPageViewControllerSpineLocationMid;
    }
    NSArray *viewControlllers = @[page1ViewController];
    [self.pageViewController setViewControllers:viewControlllers
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:YES
                                     completion:NULL];
    self.pageViewController.doubleSided = NO;
    return UIPageViewControllerSpineLocationMin;
}

@end
