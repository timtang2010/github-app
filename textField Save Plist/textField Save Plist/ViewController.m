//
//  ViewController.m
//  textField Save Plist
//
//  Created by yuxin tang on 14-4-5.
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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

// 点击textField和键盘的屏幕后隐藏键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.IdTextField resignFirstResponder];
    [self.NameTextField resignFirstResponder];
    [self.AgeTextField resignFirstResponder];
    [self.ClassTextField resignFirstResponder];
}

//获取文件的路径
- (NSString *)dataFiePath
{
    //1.获取文件路径数组，这个是因为考虑为Mac编写代码的原因
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask,
                                                         YES);
    //2.获取文件路径数组的第一个元素，因为我们只需要这一个
    NSString *documentPath = [paths objectAtIndex:0];
    
    //3.获取第2步得到的元素的字符串，并创建一个名为data.plist的.plist文件用于保存数据
    NSString *fileName = [documentPath stringByAppendingPathComponent:@"data.plist"];
    return fileName;
    
}

- (IBAction)SaveData:(id)sender {
    
    //1.首先获取文件的存取路径
    NSString *pathStr = [self dataFiePath];
    
    //如果路径没有找到，则弹出来一个警告对话框
    if (pathStr == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告"
                                                        message:@"当前路径没有找到"
                                                       delegate:nil
                              
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles: nil];
        [alert show];

    }
    //如果路径不为空
    else {
        NSLog(@"pathStr: %@", pathStr); //输出路径的地址
    }
    
    //2.获取路径后，定义一个可变数组用来保存数据
    //用数组是因为.plist文件的root 下得值的tepy只能是数组或者字典
    NSMutableArray *data = [[NSMutableArray alloc] init];
    
    //3.将4个textField里面写入的值放到data里面
    [data addObject:self.IdTextField.text];
    [data addObject:self.NameTextField.text];
    [data addObject:self.AgeTextField.text];
    [data addObject:self.ClassTextField.text];
    
    //4.将可变数组里面的数据按照路径写入文件
    [data writeToFile:pathStr atomically:YES];
}

//点击读取按钮时触发的操作
- (IBAction)LoadData:(id)sender {
    
    //1.首先获取文件的存取路径
    NSString *pathSrt = [self dataFiePath];
    
    //判断文件是否存在，如果存在用一个数据取出文件中的数据
    //并分别赋值给4个textField
    if ([[NSFileManager defaultManager]fileExistsAtPath:pathSrt]) {
        //获取文件存取路径下的文件
        NSArray *data = [[NSArray alloc] initWithContentsOfFile:pathSrt];
        
        //将获取到文件分别赋值给4个textField
        self.IdTextField.text = [data objectAtIndex:0];
        self.NameTextField.text = [data objectAtIndex:1];
        self.AgeTextField.text = [data objectAtIndex:2];
        self.ClassTextField.text = [data objectAtIndex:3];
        
    }
}
@end
