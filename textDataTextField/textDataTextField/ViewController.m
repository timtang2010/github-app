//
//  ViewController.m
//  textDataTextField
//
//  Created by yuxin tang on 14-2-20.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIDatePicker *_datePicker;
    UIToolbar *_pickerToolBar;
    UITextField *_activeTextField;
    NSDateFormatter *_dateFormatter;
    
}
@property (weak, nonatomic) IBOutlet UITextField *formDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *toDateTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addInputViewToTextField:(UITextField *)textField {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc]init];
        [_datePicker setTag:textField.tag];
        [_datePicker setDatePickerMode:UIDatePickerModeDate];
        [_datePicker setDate:[NSDate date]];
    }
    textField.inputView = _datePicker;
    
    if (!_pickerToolBar) {
        _pickerToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
        _pickerToolBar.barStyle = UIBarStyleBlackOpaque;
        
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                     target:self
                                                                                     action:@selector(cancelButtonPressed:)];
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc]
                                          initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                          target:self
                                          action:nil];
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                   target:self
                                                                                   action:@selector(doneButtonPressed:)];
        [_pickerToolBar setItems:@[cancelButton, flexibleSpace, doneButton]];
    }
    textField.inputAccessoryView = _pickerToolBar;
}

- (void)doneButtonPressed:(id)sender
{
    if (!_dateFormatter) {
        _dateFormatter = [NSDateFormatter new];
        [_dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [_dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    }
    
    _activeTextField.text = [_dateFormatter stringFromDate:_datePicker.date];
    [_activeTextField resignFirstResponder];
}

- (void)cancelButtonPressed:(id)sender
{
    [_activeTextField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    _activeTextField = textField;
    [self addInputViewToTextField:textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    _activeTextField = nil;
}

@end
