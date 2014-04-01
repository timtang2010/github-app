//
//  ViewController.h
//  test
//
//  Created by yuxin tang on 14-4-1.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

#define cityGroup 0
#define stateGroup 1

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>

@property (strong, nonatomic) UIPickerView * cityPicker;
@property (weak, nonatomic) NSDictionary *stateArea;

@property (weak, nonatomic) IBOutlet UITextField *area;
@property (weak, nonatomic) IBOutlet UITextField *details;

@property (strong, nonatomic) NSArray *city;
@property (strong, nonatomic) NSArray *state;

@end
