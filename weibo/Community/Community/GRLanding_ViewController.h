//
//  GRLanding_ViewController.h
//  Community
//
//  Created by WEB08-V5MCS006 on 14-3-31.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRLanding_ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *nameOrNumberTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIButton *notRememberMeButton;
@property (strong, nonatomic) IBOutlet UIButton *rememberMeButton;

- (IBAction)textFieldDone:(id)sender;
- (IBAction)toRememberMe:(id)sender;
- (IBAction)notToRememberMe:(id)sender;

@end
