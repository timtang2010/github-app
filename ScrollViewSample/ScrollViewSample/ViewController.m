//
//  ViewController.m
//  ScrollViewSample
//
//  Created by yuxin tang on 14-2-17.
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
    //设置视图的长度与高度
    self.scrollView.contentSize = CGSizeMake(320, 800);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设定ScrollView视图沿y轴正偏移110点的代码如下
- (void)viewDidAppear:(BOOL)animated
{
//    [self.scrollView setContentOffset:CGPointMake(0, 110) animated:YES];
//    //    self.scrollView.contentOffset = CGPointMake(0, 110);
//    NSLog(@"self.scrollView.contectSize %f,%f", self.scrollView.contentSize.height, self.scrollView.contentSize.width);
//    [super viewDidAppear:YES];
    
    //注册键盘出现的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    //注册键盘隐藏的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    //解除键盘出现通知
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:UIKeyboardDidShowNotification
                                                 object:nil];
    
    //解除键盘隐藏通知
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
                                                  object:nil];
    [super viewWillDisappear:animated];
}

- (void) keyboardDidShow: (NSNotification *)notif
{
    if (keyboardVisible) {//如果键盘已经出现，要忽略通知
        return;
    }
    //获得键盘尺寸
    NSDictionary* info = [notif userInfo];
    NSValue *aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    //重新定义SorollView的尺寸
    CGRect viewFrame = self.scrollView.frame;
    viewFrame.size.height -= (keyboardSize.height);
    self.scrollView.frame = viewFrame;
    
    //滚动到当前文本框
    CGRect textFieldRect = [self.textField frame];
    [self.scrollView scrollRectToVisible:textFieldRect animated:YES];
    
    keyboardVisible = YES;
}

- (void)keyboardDidHide: (NSNotification *)notif
{
    NSDictionary *info = [notif userInfo];
    NSValue *aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize = [aValue CGRectValue].size;
    
    CGRect viewFrame = self.scrollView.frame;
    viewFrame.size.height += keyboardSize.height;
    self.scrollView.frame = viewFrame;
    
    if (!keyboardVisible) {
        return;
    }
    keyboardVisible = NO;
}

#pragma mark -- UITextFieldDelegate method
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
