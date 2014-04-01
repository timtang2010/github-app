//
//  ViewController.m
//  test
//
//  Created by yuxin tang on 14-4-1.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"shanghai area"
                            withExtension:@"plist"];
    
    self.stateArea = [NSDictionary
                        dictionaryWithContentsOfURL:plistURL];
    //设置Key值
    self.city = [self.stateArea allKeys];
    //使用比较排序
    self.city = [self.city sortedArrayUsingSelector:@selector(compare:)];
    //设置Value值（从第0位开始设置Value值）
    self.state = [self.stateArea objectForKey:[self.city objectAtIndex:0]];
    
    
    self.cityPicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    self.cityPicker.delegate = self;
    self.cityPicker.dataSource = self;
    [self.cityPicker setShowsSelectionIndicator:YES];
    
    _area.inputView = self.cityPicker;
    _details.inputView = self.cityPicker;
    
    UIToolbar *myPickerToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    myPickerToolBar.barStyle = UIBarStyleBlackOpaque;
    [myPickerToolBar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc]init];
    
    UIBarButtonItem *flexSpacr = [[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                  target:self
                                  action:nil];
    [barItems addObject:flexSpacr];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]
                                
                                initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                target:self
                                action:@selector(pickerDoneClicker)];
    [barItems addObject:doneBtn];
    
    [myPickerToolBar setItems:barItems animated:YES];
    
    _area.inputAccessoryView = myPickerToolBar;
    _details.inputView = myPickerToolBar;
    
}

- (void)pickerDoneClicker
{
    NSLog(@"Done Clicker");
    [_area resignFirstResponder];
    [_details resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Picker Data Source Mthods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return [self.city count];
    } else {
        return [self.state count];
    }
}

#pragma mark picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return self.city[row];
    } else {
        return self.state[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        NSString *keyString = [self.city objectAtIndex:row];
        self.state = [self.stateArea objectForKey:keyString];
        
        [pickerView reloadComponent:1];
        [pickerView selectRow:0
                  inComponent:1
                     animated:YES];
//        NSString *selectedState = self.city[row];
//        self.state = self.stateArea[selectedState];
//        [self.cityPicker reloadComponent:stateGroup];
//        [self.cityPicker selectRow:0
//                       inComponent:stateGroup
//                          animated:YES];
    }
}

@end
