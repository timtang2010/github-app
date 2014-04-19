//
//  SE_MapViewController.h
//  SE_map
//
//  Created by yuxin tang on 14-4-18.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import "CommonUtility.h"

@interface SE_MapViewController : UIViewController<MAMapViewDelegate,AMapSearchDelegate>
{
    BOOL canUpdate;
}
@property (nonatomic, retain) MAMapView *mapView_;
@property (nonatomic,retain)AMapSearchAPI *search;
@property (nonatomic,retain)NSString *address;
@property (nonatomic,retain)NSString *currentAddress;
@property (nonatomic,assign)double latitude;
@property (nonatomic,assign)double longitude;
@property (nonatomic,assign)BOOL useAddress;
@property (nonatomic,assign)double beginlatitue;
@property (nonatomic,assign)double beginlongitude;
@property (nonatomic,assign)double endlatitude;
@property (nonatomic,assign)double endlongitude;
@property (nonatomic,retain)AMapRoute *route;
@property (nonatomic,retain)NSMutableArray *anmitaionArray;
@property (nonatomic,retain)MAPolylineView *overlayView;


@end
