//
//  GRRegister_ViewController.h
//  Community
//
//  Created by WEB08-V5MCS006 on 14-3-31.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRRegister_ViewController : UIViewController <UIAlertViewDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UITextField * nameTextField;
@property (strong, nonatomic) IBOutlet UITextField * passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField * surePasswordTextField;
@property (strong, nonatomic) IBOutlet UITextField * numberTextField;
@property (strong, nonatomic) IBOutlet UIButton * notAppearPasswordButton;
@property (strong, nonatomic) IBOutlet UIButton *appearPasswordButton;
@property (strong, nonatomic) UIActionSheet * sheet;

- (IBAction)TextFieldDone:(id)sender;
- (IBAction)clickBackground:(id)sender;
- (IBAction)registerUser:(id)sender;
- (IBAction)toAppearPassword:(id)sender;
- (IBAction)toDisappearPasswordButton:(id)sender;

@end
