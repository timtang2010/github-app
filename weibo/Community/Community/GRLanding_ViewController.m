//
//  GRLanding_ViewController.m
//  Community
//
//  Created by WEB08-V5MCS006 on 14-3-31.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "GRLanding_ViewController.h"

@interface GRLanding_ViewController ()

@end

@implementation GRLanding_ViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)textFieldDone:(id)sender
{
    [self.nameOrNumberTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}
@end
