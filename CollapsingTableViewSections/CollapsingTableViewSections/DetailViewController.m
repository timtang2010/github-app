//
//  DetailViewController.m
//  CollapsingTableViewSections
//
//  Created by yuxin tang on 14-4-11.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
//@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDetailItem:(id)detailItem
{
    if (_detailItem != detailItem) {
        _detailItem  = detailItem;
        
        //Update the View
        [self configureView];
    }
//    if (self.masterPopoverController != nil) {
//        [self.masterPopoverController dismissPopoverAnimated:YES];
//    }
}

- (void)configureView
{
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

//#pragma mark - Split view
//- (void)splitviewcontroller:(UISplitViewController *)splitController
//     willHideViewController:(UIViewController *)viewController
//          withBarButtonItem:(UIBarButtonItem *)barButtonItem
//       forPopoverController:(UIPopoverController *)popoverController
//{
//    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
//    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
//    self.masterPopoverController = popoverController;
//}
//
//- (void)splitviewcontroller:(UISplitViewController *)splitController
//     willShowViewController:(UIViewController *)viewController
//  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
//{
//    //调用视图再次显示在拆分视图时，无效的按钮和酥饼控制器。
//    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
//    self.masterPopoverController = nil;
//}
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
