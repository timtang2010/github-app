//
//  JPSThumbnailAnnotationView.h
//  SE_map
//
//  Created by yuxin tang on 14-4-18.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MAMapKit/MAAnnotationView.h>
#import "JPSThumbnail.h"

typedef enum {
    JPSThumbnailAnnotationViewAnimationDirectionGrow,
    JPSThumbnailAnnotationViewAnimationDirectionShrink,
} JPSThumbnailAnnotationViewAnimationDirection;

typedef enum {
    JPSThumbnailAnnotationViewStateCollapsed,
    JPSThumbnailAnnotationViewStateExpanded,
    JPSThumbnailAnnotationViewStateAnimating,
} JPSThumbnailAnnotationViewState;

@protocol JPSThumbnailAnnotationViewProtocol <NSObject>

- (void)didSelectAnnotationViewInMap:(MAMapView *)mapView;
- (void)didDeselectAnnotationViewInMap:(MAMapView *)mapView;

@end

@interface JPSThumbnailAnnotationView : MAPinAnnotationView<JPSThumbnailAnnotationViewProtocol>

{
    CAShapeLayer *_shapeLayer;
    CAShapeLayer *_strokeAndShadowLayer;
    UIButton *_disclosureButton;
    JPSThumbnailAnnotationViewState _state;
}

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) ActionBlock disclosureBlock;

- (id)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier;

@end
