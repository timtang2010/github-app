//
//  ViewController.h
//  textField Save Plist
//
//  Created by yuxin tang on 14-4-5.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *IdTextField;
@property (weak, nonatomic) IBOutlet UITextField *NameTextField;
@property (weak, nonatomic) IBOutlet UITextField *AgeTextField;
@property (weak, nonatomic) IBOutlet UITextField *ClassTextField;
- (IBAction)SaveData:(id)sender;
- (IBAction)LoadData:(id)sender;
@end
