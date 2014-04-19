//
//  SE_MapViewController.m
//  SE_map
//
//  Created by yuxin tang on 14-4-18.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "SE_MapViewController.h"
#import "CustomAnnotationView.h"
#import "JPSThumbnailAnnotationView.h"

@interface SE_MapViewController ()

@end

@implementation SE_MapViewController

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
    _anmitaionArray=[[NSMutableArray alloc]initWithCapacity:0];
    canUpdate=YES;
    self.mapView_ = [[MAMapView alloc] initWithFrame:self.view.bounds];
    _mapView_.delegate=self;
    _mapView_.showsUserLocation=YES;
    [self.view addSubview:_mapView_];
    [_mapView_ addObserver:self forKeyPath:@"showsUserLocation" options:NSKeyValueObservingOptionNew context:nil];
    _search = [[AMapSearchAPI alloc] initWithSearchKey:[MAMapServices sharedServices].apiKey Delegate:self];
    
    MAPointAnnotation *red = [[MAPointAnnotation alloc] init];
    red.coordinate = CLLocationCoordinate2DMake(self.endlatitude, self.endlongitude);
    red.title      =@"点击获取路径";
    [_mapView_ addAnnotation:red];

    _mapView_.visibleMapRect = MAMapRectMake(220852032.0, 101508584.0, 1000,1000);
    [_mapView_ setCenterCoordinate:((MAPointAnnotation*)[_mapView_.annotations lastObject]).coordinate animated:YES];
	// Do any additional setup after loading the view.
}

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
{
    CLLocation * location=userLocation.location;
    if(location&&canUpdate==YES){
        //      [mapView_ removeAnnotations:mapView_.annotations];
        canUpdate=NO;
        self.beginlatitue=location.coordinate.latitude;
        self.beginlongitude=location.coordinate.longitude;
        NSLog(@"%f   %f",location.coordinate.latitude,location.coordinate.longitude);
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
/* 驾车导航搜索. */
- (void)searchNaviDrive
{
    AMapNavigationSearchRequest *navi = [[AMapNavigationSearchRequest alloc] init];
    navi.searchType       = AMapSearchType_NaviDrive;
    navi.requireExtension = YES;
    
    /* 出发点. */
    navi.origin = [AMapGeoPoint locationWithLatitude:self.beginlatitue
                                           longitude:self.beginlongitude];
    /* 目的地. */
    navi.destination = [AMapGeoPoint locationWithLatitude:self.endlatitude
                                                longitude:self.endlongitude];
    
    [_search AMapNavigationSearch:navi];

}
/* 导航搜索回调. */
- (void)onNavigationSearchDone:(AMapNavigationSearchRequest *)request
                      response:(AMapNavigationSearchResponse *)response
{
    
    if (response.route == nil)
    {
        return;
    }
    self.route = response.route;
    NSLog(@"%@",self.route.paths);
    NSArray *polylines = [CommonUtility polylinesForPath:self.route.paths[0]];
    [_mapView_ addOverlays:polylines];
    _mapView_.visibleMapRect = [CommonUtility mapRectForOverlays:polylines];
    
    AMapPath *paths=self.route.paths[0];
    for(int i=0;i<paths.steps.count;i++){
        AMapStep *step =paths.steps[i];
        if(!step.road||[step.road isEqualToString:@""]){
            continue;
        }
        NSArray *array=[step.polyline componentsSeparatedByString:@";"];
        NSArray *latLong=[[array objectAtIndex:0]componentsSeparatedByString:@","];
        MAPointAnnotation *red = [[MAPointAnnotation alloc] init];
        red.coordinate = CLLocationCoordinate2DMake([[latLong objectAtIndex:1]doubleValue],[[latLong objectAtIndex:0]doubleValue]);
        NSLog(@"%f   %f",red.coordinate.latitude,red.coordinate.longitude);
        red.title      =step.road;
        red.subtitle=step.instruction;
        [_anmitaionArray addObject:red];

        
    }
    
    MAPointAnnotation *red = [[MAPointAnnotation alloc] init];
    red.coordinate = CLLocationCoordinate2DMake(self.beginlatitue,self.beginlongitude);
    red.title      =@"起点:";
    red.subtitle=self.currentAddress;
    [_anmitaionArray addObject:red];

    
    MAPointAnnotation *red1 = [[MAPointAnnotation alloc] init];
    red1.coordinate = CLLocationCoordinate2DMake(self.endlatitude,self.endlongitude);
    red1.title      =@"终点:";
    red1.subtitle=self.address;
    [_anmitaionArray addObject:red1];

    
    [_mapView_ removeAnnotations:_mapView_.annotations];
    [_mapView_ addAnnotations:_anmitaionArray];
    
}

- (MAOverlayView *)mapView:(MAMapView *)mapView viewForOverlay:(id<MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MAPolyline class]])
    {
        MAPolylineView *overlayView = [[MAPolylineView alloc] initWithPolyline:overlay];
        
        overlayView.lineWidth   = 8;
        overlayView.strokeColor = [UIColor magentaColor];
        
        return overlayView;
    }
    
    return nil;
}

- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view
{
    NSLog(@"%d",view.tag);
    if([view isMemberOfClass:[CustomAnnotationView class]]){
        if(self.beginlatitue!=0&&self.beginlongitude!=0){
            
            [self searchReGeocodeWithCoordinate:CLLocationCoordinate2DMake(self.beginlatitue, self.beginlongitude)];
        }
    }
}

-(void)mapView:(MAMapView *)mapView didDeselectAnnotationView:(MAAnnotationView *)view
{
    if([view.rightCalloutAccessoryView isKindOfClass:[UIButton class]]){
        UIButton *btn=(UIButton*)view.rightCalloutAccessoryView;
        btn.tag=0;
        UIView *AMapSMCalloutView=btn.superview;
        UILabel *label=[AMapSMCalloutView.subviews objectAtIndex:2];
        label.numberOfLines=1;
        label.bounds=CGRectMake(0,0,label.bounds.size.width,16);
        UIView *AMapSMCalloutDrawnBackgroundView=label.superview;
        AMapSMCalloutDrawnBackgroundView.bounds=CGRectMake(0,0,AMapSMCalloutDrawnBackgroundView.bounds.size.width,70);
    }
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        if([((MAPointAnnotation*)annotation).title isEqualToString:@"点击获取路径"]){
            
            static NSString *pointReuseIndetifier = @"pointReuseIndetifier1";
            CustomAnnotationView *annotationView = (CustomAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
            annotationView.tag=100;
            if (annotationView == nil)
            {
                annotationView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
            }
            annotationView.portrait = [UIImage imageNamed:@"首页地图.png"];
            annotationView.name=@"获取路径";
            
            return annotationView;
            
            
        }else{
            
            static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
            MAPinAnnotationView *annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
            if (annotationView == nil)
            {
                annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndetifier];
                annotationView.canShowCallout            = YES;
                annotationView.animatesDrop              = YES;
                annotationView.draggable                 = YES;
                UIButton *btn=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
                [btn addTarget:self action:@selector(extentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                annotationView.rightCalloutAccessoryView =btn;
            }
            annotationView.pinColor =MAPinAnnotationColorGreen;
            if([((MAPointAnnotation*)annotation).title rangeOfString:@"起点:"].length!=0||[((MAPointAnnotation*)annotation).title rangeOfString:@"终点:"].length!=0){
                annotationView.pinColor =MAPinAnnotationColorRed;
            }
            
            return annotationView;
            
        }
    }
    return nil;
    
}

//你地理编码
- (void)searchReGeocodeWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc] init];
    
    regeo.location = [AMapGeoPoint locationWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    regeo.requireExtension = YES;
    
    [self.search AMapReGoecodeSearch:regeo];
}
/* 逆地理编码回调. */
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    if (response.regeocode != nil)
    {
        self.currentAddress=response.regeocode.formattedAddress;
        [self searchNaviDrive];
        
        NSLog(@"%@",response.regeocode.formattedAddress);
    }
}

-(void)extentBtnClick:(UIButton*)btn
{
    if(btn.tag==0){
        btn.tag=1;
        UIView *AMapSMCalloutView=btn.superview;
        NSLog(@"%@",AMapSMCalloutView.subviews);
        UILabel *label=[AMapSMCalloutView.subviews objectAtIndex:2];
        label.numberOfLines=0;
        NSLog(@"%@",label.text);
        
//        CGSize size = [label.text boundingRectWithSize:<#(CGSize)#> options:<#(NSStringDrawingOptions)#> attributes:<#(NSDictionary *)#> context:<#(NSStringDrawingContext *)#>]
        
        CGSize size=[label.text sizeWithFont:label.font
                           constrainedToSize:CGSizeMake(label.frame.size.width,100000) lineBreakMode:label.lineBreakMode];
        if(size.height<=16){
            btn.tag=0;
            return;
        }
        NSLog(@"%f   %f  %f",label.frame.size.height,label.frame.size.width,label.frame.origin.y);
        label.bounds=CGRectMake(0,0,label.bounds.size.width,size.height);
        UIView *AMapSMCalloutDrawnBackgroundView=label.superview;
        NSLog(@"%f",AMapSMCalloutDrawnBackgroundView.bounds.size.height);
        AMapSMCalloutDrawnBackgroundView.bounds=CGRectMake(0,0,AMapSMCalloutDrawnBackgroundView.bounds.size.width,(size.height+25+5)/45*25+size.height+25+5);
    }else{
        btn.tag=0;
        UIView *AMapSMCalloutView=btn.superview;
        UILabel *label=[AMapSMCalloutView.subviews objectAtIndex:2];
        label.numberOfLines=1;
        label.bounds=CGRectMake(0,0,label.bounds.size.width,16);
        UIView *AMapSMCalloutDrawnBackgroundView=label.superview;
        AMapSMCalloutDrawnBackgroundView.bounds=CGRectMake(0,0,AMapSMCalloutDrawnBackgroundView.bounds.size.width,70);
    }
}


@end
