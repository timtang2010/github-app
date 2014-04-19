//
//  ZCHelp_DetailsViewController.m
//  Community
//
//  Created by yuxin tang on 14-4-16.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ZCHelper_DetailsViewController.h"

@interface ZCHelper_DetailsViewController ()

@property (nonatomic, strong) UIPopoverController *masterPopoverController;

@end

@implementation ZCHelper_DetailsViewController

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
    [self configureView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView
{
    if (self.detailItem) {
        self.viewControllerLabel.text = [self.detailItem description];
    }
}

- (void)setDetailItem:(id)detailItem
{
    if (self.detailItem != detailItem) {
        self.detailItem = detailItem;
        
        //更新view
        [self configureView];
    }
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
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
