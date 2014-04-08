//
//  ViewController.m
//  PlistTutorial
//
//  Created by yuxin tang on 14-4-6.
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
    
    /*
    //从根direcory获取路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory,
                                                          NSUserDomainMask,
                                                          YES);
    //获取文件路径
    NSString *documentsPath = [paths objectAtIndex:0];
    
    //获取路径，我们的数据/ plist文件
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"Data.plist"];
    
    //检查是否Data.plist存在于文件
    if (![[NSFileManager defaultManager]fileExistsAtPath:plistPath]) {
        //如果没有文件，获取属性列表从主束
        NSData *plistXML = [[NSFileManager defaultManager]contentsAtPath:plistPath];
        
        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        
        //转换静态属性liost成字典对象
        NSDictionary *temp = (NSDictionary *)
        [NSPropertyListSerialization propertyListFromData:plistXML
                                         mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                   format:&format
                                         errorDescription:&errorDesc];
        
        if (!temp) {
            NSLog(@"Erroe reding plist: %@, format: %d", errorDesc, format);
        }
        //赋值
        self.personeName = [temp objectForKey:@"Name"];
        self.phoneNumbers = [NSMutableArray arrayWithArray:[temp objectForKey:@"Phones"]];
        
        //显示值
        self.nameEntered.text = self.personeName;
        self.homePhone.text = [self.phoneNumbers objectAtIndex:0];
        self.workPhone.text = [self.phoneNumbers objectAtIndex:1];
        self.cellPhone.text = [self.phoneNumbers objectAtIndex:2];
    }
     */
    
    // get paths from root direcory
	NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory,
                                                          NSUserDomainMask,
                                                          YES);
	// get documents path
	NSString *documentsPath = [paths objectAtIndex:0];
    
	// get the path to our Data/plist file
	NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"Data.plist"];
	
	// check to see if Data.plist exists in documents
	if (![[NSFileManager defaultManager]
          fileExistsAtPath:plistPath])
	{
		// if not in documents, get property list from main bundle
		plistPath = [[NSBundle mainBundle]
                     pathForResource:@"Data" ofType:@"plist"];
	}
	
	// read property list into memory as an NSData object
	NSData *plistXML = [[NSFileManager defaultManager]
                        contentsAtPath:plistPath];
	NSString *errorDesc = nil;
	NSPropertyListFormat format;
    
	// convert static property liost into dictionary object
	NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
	if (!temp)
	{
		NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
	}
	// assign values
	self.personeName = [temp objectForKey:@"Name"];
	self.phoneNumbers = [NSMutableArray arrayWithArray:[temp objectForKey:@"Phones"]];
	// display values
	_nameEntered.text = _personeName;
    
	_homePhone.text = [_phoneNumbers objectAtIndex:0];
    
	_workPhone.text = [_phoneNumbers objectAtIndex:1];
	_cellPhone.text = [_phoneNumbers objectAtIndex:2];
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

- (IBAction)saveData:(id)sender {
    /*
    //从根direcory获取路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask,
                                                         YES);
    //获取文件路径
    NSString *documentsPath = [paths objectAtIndex:0];
    
    //获取路径，我们的数据/ plist文件
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"Data.plist"];
    
    //在文本字段中设置的变量的值
    self.personeName = self.nameEntered.text;
    self.phoneNumbers = [[NSMutableArray alloc]initWithCapacity:3];
    [self.phoneNumbers addObject:self.homePhone.text];
    [self.phoneNumbers addObject:self.workPhone.text];
    [self.phoneNumbers addObject:self.cellPhone.text];
    
    //创建字典在UITextFields值
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects:
                               [NSArray arrayWithObjects:self.personeName, self.phoneNumbers, nil]
                                                          forKeys:[NSArray arrayWithObjects:@"Name",@"Phones", nil]];
    NSString *error = nil;
    //从字典中创建的NSData
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict
                                                                   format:NSPropertyListXMLFormat_v1_0
                                                         errorDescription:&error];
    //检查plistData存在
    if (plistData) {
        //写plistData我们Data.plist文件
        [plistData writeToFile:plistPath atomically:YES];
    }
    else {
        NSLog(@"Erroe in saveData %@", error);
        
    }
    */
    // get paths from root direcory
	NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
	// get documents path
    
	NSString *documentsPath = [paths objectAtIndex:0];
	// get the path to our Data/plist file
    
	NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"Data.plist"];
	
	// set the variables to the values in the text fields
	self.personeName = _nameEntered.text;
	self.phoneNumbers = [[NSMutableArray alloc] initWithCapacity:3];
	[_phoneNumbers addObject:_homePhone.text];
	[_phoneNumbers addObject:_workPhone.text];
	[_phoneNumbers addObject:_cellPhone.text];
	
	
	// create dictionary with values in UITextFields
    NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: _personeName, _phoneNumbers, nil] forKeys:[NSArray arrayWithObjects: @"Name", @"Phones", nil]];
	
	NSString *error = nil;
	// create NSData from dictionary
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
	
    // check is plistData exists
	if(plistData)
	{
		// write plistData to our Data.plist file
        [plistData writeToFile:plistPath atomically:YES];
    }
    else
	{
        NSLog(@"Error in saveData: %@", error);
    }

    
}
@end
