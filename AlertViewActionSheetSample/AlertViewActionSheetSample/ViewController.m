//
//  ViewController.m
//  AlertViewActionSheetSample
//
//  Created by yuxin tang on 14-2-18.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate, UIActionSheetDelegate>

- (IBAction)testAlertView:(id)sender;
- (IBAction)testActionSheet:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testAlertView:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Alert"
                              message:@"Alert text goes here"
                              delegate:self
                              cancelButtonTitle:@"No"
                              otherButtonTitles:@"Yes", nil];
    [alertView show];
}

#pragma mark --实现UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex = %i", buttonIndex);
}

- (IBAction)testActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"破坏性按钮"
                                  otherButtonTitles:@"Facebook", @"新浪微博", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    [actionSheet showInView:self.view];
}
/*
 UIActionSheetStyleAutomatic        自动样式
 UIActionSheetStyleDefault          默认样式
 UIActionSheetStyleBlackTranslucent 半透明样式
 UIActionSheetStyleBlackOpaque      透明样式
 */
#pragma mark -- 实现UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex = %i", buttonIndex);
}
@end
