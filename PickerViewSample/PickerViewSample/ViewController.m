//
//  ViewController.m
//  PickerViewSample
//
//  Created by yuxin tang on 14-2-21.
//  Copyright (c) 2014年 timtang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) NSDictionary *pickerData;//保存全部数据
@property (strong, nonatomic) NSArray *pickerProvincesData;//当前的省数据
@property (strong, nonatomic) NSArray *pickerCitiesData;//当前的省下面的市数据

- (IBAction)onClick:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"provinces_cities"
                                           ofType:@"plist"];
    //获取属性列表文件中的全部数据
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.pickerData = dict;
    
    //省份名数据
    self.pickerProvincesData = [self.pickerData allKeys];
    
    //默认取出弟弟一个省得所有市的数据
    NSString *selectedProvince = [self.pickerProvincesData objectAtIndex:0];
    self.pickerCitiesData = [self.pickerData objectForKey:selectedProvince];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClick:(id)sender {
    NSInteger row1 = [self.pickerView selectedRowInComponent:0];
    NSInteger row2 = [self.pickerView selectedRowInComponent:1];
    
    NSString *selected1 = [self.pickerProvincesData objectAtIndex:row1];
    NSString *selected2 = [self.pickerCitiesData objectAtIndex:row2];
    
    NSString *title = [[NSString alloc]initWithFormat:@"%@, %@市", selected1, selected2];
    
    self.label.text = title;
    
}

#pragma mark 实现协议UIPickerViewDataSource方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return [self.pickerProvincesData count];
    }else {
        return [self.pickerCitiesData count];
    }
}

#pragma mark 实现协议UIPickerViewDelegate方法
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
    if (component == 0) {
        return [self.pickerProvincesData objectAtIndex:row];
    } else {
        return [self.pickerCitiesData objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    if (component == 0) {
        NSString *selectedProvince= [self.pickerProvincesData objectAtIndex:row];
        NSArray *array = [self.pickerData objectForKey:selectedProvince];
        self.pickerCitiesData = array;
        [self.pickerView reloadComponent:1];
    }
}
@end
