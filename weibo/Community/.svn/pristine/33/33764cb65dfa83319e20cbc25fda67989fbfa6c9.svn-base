//
//  GRFeedback_ViewController.m
//  Community
//
//  Created by WEB08-V5MCS006 on 14-3-31.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "GRFeedback_ViewController.h"
#import "CPTextViewPlaceholder.h"

@interface GRFeedback_ViewController ()

@end

@implementation GRFeedback_ViewController

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
    
    self.textView.placeholder = @"请留下您的宝贵意见";
    [self.textView becomeFirstResponder];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)clickBackground:(id)sender
{
    [self.textField resignFirstResponder];
    [self.textView resignFirstResponder];
}

- (IBAction)textDone:(id)sender
{
    [self.textField resignFirstResponder];
}

@end
