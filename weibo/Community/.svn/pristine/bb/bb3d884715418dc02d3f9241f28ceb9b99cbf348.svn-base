//
//  YYFrom_ViewController.h
//  Community
//
//  Created by yuxin tang on 14-3-30.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYFrom_ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UITextField *name;
@property (retain, nonatomic) IBOutlet UISegmentedControl *gender;

@property (retain, nonatomic) IBOutlet UITextField *phone;
@property (retain, nonatomic) IBOutlet UITextField *service;
@property (retain, nonatomic) IBOutlet UITextField *area;
@property (retain, nonatomic) IBOutlet UITextField *details;
@property (retain, nonatomic) IBOutlet UITextField *address;
@property (retain, nonatomic) IBOutlet UITextField *claim;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *Done;

@property (retain, nonatomic) NSDictionary *stateArea;
@property (retain, nonatomic) UIPickerView *cityPicker;

- (IBAction)slideFrameUp:(id)sender;
- (IBAction)slideFrameDown:(id)sender;
- (IBAction)closeKey:(id)sender;

- (IBAction)saveDone:(id)sender;
- (void)slideFrame:(BOOL)up ;

@end
