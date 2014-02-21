//
//  ViewController.h
//  ActionSheetPicker
//
//  Created by yuxin tang on 14-2-20.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AbstractActionSheetPicker;
@interface ViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *dateTextField;
@property (strong, nonatomic) IBOutlet UITextField *animalTextField;

@property (strong, nonatomic) NSArray *animals;
@property (assign, nonatomic) NSInteger selectedIndex;
@property (strong, nonatomic) NSDate *selectedDate;
@property (assign, nonatomic) NSInteger selectedBigUnit;
@property (assign, nonatomic) NSInteger selectedSmallUnit;
@property (strong, nonatomic) AbstractActionSheetPicker *actionSheetPicker;

- (IBAction)selectABlock:(id)sender;
- (IBAction)selectAnAnimal:(id)sender;
- (IBAction)selectADate:(id)sender;
- (IBAction)selectAMeasurement:(id)sender;
- (IBAction)selectAMusicalScale:(id)sender;

@end
