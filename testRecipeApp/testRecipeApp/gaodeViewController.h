//
//  gaodeViewController.h
//  testRecipeApp
//
//  Created by yuxin tang on 14-4-16.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>


@interface gaodeViewController : UIViewController<MAMapViewDelegate>
@property (nonatomic, strong) MAMapView *mapView;



@end
