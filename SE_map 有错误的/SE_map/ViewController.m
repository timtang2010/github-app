//
//  ViewController.m
//  SE_map
//
//  Created by yuxin tang on 14-4-18.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ViewController.h"
#import "SE_MapViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn setTitle:@"sss" forState:UIControlStateNormal];
    btn.frame=CGRectMake(100,100,100,50);
    btn.titleLabel.text = @"按钮";
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self
            action:@selector(click)
  forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)click
{
    SE_MapViewController *map=[[SE_MapViewController alloc]init];
    map.useAddress=YES;
    map.address=@"天安门";
    map.endlatitude=31.38873;
    map.endlongitude=121.447821;
    [self.navigationController pushViewController:map animated:YES];

}


@end
