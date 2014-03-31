//
//  GRRegister_ViewController.m
//  Community
//
//  Created by WEB08-V5MCS006 on 14-3-31.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "GRRegister_ViewController.h"

@interface GRRegister_ViewController ()

@end

@implementation GRRegister_ViewController

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

- (IBAction)TextFieldDone:(id)sender
{
    [self.nameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.surePasswordTextField resignFirstResponder];
}

- (IBAction)clickBackground:(id)sender
{
    [self.numberTextField resignFirstResponder];
}

- (IBAction)registerUser:(id)sender
{
    if (self.nameTextField == nil |
        self.passwordTextField == nil |
        self.surePasswordTextField == nil |
        self.numberTextField == nil)
    {

    }
}

- (IBAction)toAppearPassword:(id)sender
{
    self.notAppearPasswordButton.hidden = YES;
    self.appearPasswordButton.hidden = NO;
    self.passwordTextField.secureTextEntry = NO;
    self.surePasswordTextField.secureTextEntry = NO;
}

- (IBAction)toDisappearPasswordButton:(id)sender
{
    self.appearPasswordButton.hidden = YES;
    self.notAppearPasswordButton.hidden = NO;
    self.passwordTextField.secureTextEntry = YES;
    self.surePasswordTextField.secureTextEntry = YES;
}

@end
