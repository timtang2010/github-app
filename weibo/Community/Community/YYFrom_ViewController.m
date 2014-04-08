//
//  YYFrom_ViewController.m
//  Community
//
//  Created by yuxin tang on 14-3-30.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "YYFrom_ViewController.h"

#define areaRow 0
#define detailsRow 1

@interface YYFrom_ViewController ()

@end

@implementation YYFrom_ViewController
{
    NSArray *areaArrays;
    NSArray *detailsArrays;
}

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
    // Do any additional setup after loading the view.
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"shanghai area"
                               withExtension:@"plist"];
    
    self.stateArea = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    
    NSArray *allStates = [self.stateArea allKeys];
    NSArray *soryedStates = [allStates sortedArrayUsingSelector:@selector(compare:)];
    
    self->areaArrays = soryedStates;
    
    NSString *selectedState = self.self->areaArrays[0];
    self->detailsArrays = self.stateArea[selectedState];
    
    self.cityPicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    
    self.cityPicker.delegate = self;
    self.cityPicker.dataSource = self;
    
    [self.cityPicker setShowsSelectionIndicator:YES];
    //调用cityPicker
    self.area.inputView = self.cityPicker;
    self.details.inputView = self.cityPicker;
    
    //工具栏
    UIToolbar *myPickerToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 56)];
    myPickerToolBar.barStyle = UIBarStyleBlackOpaque;
    [myPickerToolBar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                              target:self
                                                                              action:nil];
    [barItems addObject:flexSpace];
    
    //工具栏按钮
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                            target:self
                                                                            action:@selector(pickerDoneClicker)];
    [barItems addObject:doneBtn];
    
    [myPickerToolBar setItems:barItems animated:YES];
    
    self.area.inputAccessoryView = myPickerToolBar;
    self.details.inputAccessoryView = myPickerToolBar;
    
#pragma mark 打印选择状态
    //设置默认的选择状态
    self.gender.momentary = YES;
    
    //调用打印的方法
    [self.gender addTarget:self
                    action:@selector(segmentedControlTapper:)
          forControlEvents:UIControlEventValueChanged];
    
    
    self.area.inputAccessoryView = myPickerToolBar;
    self.details.inputAccessoryView = myPickerToolBar;
}

- (void)pickerDoneClicker
{
    NSLog(@"Done Clicker");
    int cityIdx = [self.cityPicker selectedRowInComponent:areaRow];
    int stateIdx = [self.cityPicker selectedRowInComponent:detailsRow];
    
    self.area.text = [self->areaArrays objectAtIndex:cityIdx];
    self.details.text = [self->detailsArrays objectAtIndex:stateIdx];
    
    [self.area resignFirstResponder];
    [self.details resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return areaArrays.count;
    }
    else {
        return detailsArrays.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return self->areaArrays[row];
    }
    else {
        return self->detailsArrays[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        NSString *keyString = [self->areaArrays objectAtIndex:row];
        self->detailsArrays = [self.stateArea objectForKey:keyString];
        
        [pickerView reloadComponent:detailsRow];
        [pickerView selectRow:0
                  inComponent:detailsRow
                     animated:YES];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)slideFrameUp:(id)sender {
    [self slideFrame:YES];
    
}

- (IBAction)slideFrameDown:(id)sender {
    [self slideFrame:NO];
}

- (IBAction)closeKey:(id)sender {
    [self.name resignFirstResponder];
    [self.phone resignFirstResponder];
    [self.service resignFirstResponder];
    [self.address resignFirstResponder];
    [self.claim resignFirstResponder];
}

- (IBAction)saveDone:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                   message:@"保存成功" delegate:self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    [alert show];
    //回调关闭键盘方法
    [self closeKey:(id)sender];
}

- (void)slideFrame:(BOOL)up {
    const int movementDistance = 150;//偏移量
    const float movementDuration = 0.3f;//动画时间
    
    int movement = (up ? -movementDistance:movementDistance);
    
    [UIView beginAnimations:@"anim" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

#pragma mark 打印分段控制器的状态
- (void)segmentedControlTapper:(UISegmentedControl *)paramSender {
    switch (paramSender.selectedSegmentIndex) {
        case 0:
            NSLog(@"你选择的是男");
            break;
            
        default:
            NSLog(@"你选择的是女");
            break;
    }
}
@end
