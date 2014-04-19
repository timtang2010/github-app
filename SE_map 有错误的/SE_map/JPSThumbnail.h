//
//  JPSThumbnail.h
//  SE_map
//
//  Created by yuxin tang on 14-4-18.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

typedef void (^ActionBlock)();

@interface JPSThumbnail : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) ActionBlock disclosureBlock;

@end
