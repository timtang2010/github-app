//
//  GRFindPassword_ViewController.m
//  Community
//
//  Created by WEB08-V5MCS006 on 14-4-2.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "GRFindPassword_ViewController.h"

@interface GRFindPassword_ViewController ()

@end

@implementation GRFindPassword_ViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDone:(id)sender
{
    [self.accountTextField resignFirstResponder];
    [self.eMailTextField resignFirstResponder];
}

@end
