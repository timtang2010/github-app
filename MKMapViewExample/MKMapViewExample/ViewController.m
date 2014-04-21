//
//  ViewController.m
//  MKMapViewExample
//
//  Created by yuxin tang on 14-4-20.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *myControl;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)changeView:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.mapView.showsUserLocation = YES;
    
    //创建管理器
    CLLocationManager *locationManager = [[CLLocationManager alloc]init];
    //设置代理
     locationManager.delegate = self;
    //指定需要的进度级别
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //设置距离筛选器
    locationManager.distanceFilter = 1000.0f;
    //启动位置管理器
    [locationManager startUpdatingLocation];
    MKCoordinateSpan theSpan;
    //地图的范围 越小约精确
    theSpan.latitudeDelta = 0.05;
    theSpan.longitudeDelta = 0.05;
    MKCoordinateRegion theRegion;
    theRegion.center = [[locationManager location]coordinate];
    theRegion.span = theSpan;
    [self.mapView setRegion:theRegion];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeView:(id)sender {
    switch (self.myControl.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
}
@end
