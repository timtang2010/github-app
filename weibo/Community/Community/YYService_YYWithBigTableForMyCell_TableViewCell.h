//
//  YYService_YYWithBigTableForMyCell_TableViewCell.h
//  Community
//
//  Created by WEB08-V5MCS006 on 14-4-12.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYService_YYWithBigTableForMyCell_TableViewCell : UITableViewCell

/*
@property (strong, nonatomic) UIImageView * serviceProvidersImageView;
@property (strong, nonatomic) UILabel * serviceProvidersNameLabel;
@property (strong, nonatomic) UILabel * serviceProvidersAddressLabel;
@property (strong, nonatomic) UILabel * serviceProvidersDistanceLabel;
*/

@property (strong, nonatomic) IBOutlet UIImageView *YYImage;
@property (strong, nonatomic) IBOutlet UILabel *YYName;
@property (strong, nonatomic) IBOutlet UILabel *yyAddress;
@property (strong, nonatomic) IBOutlet UILabel *YYPhone;

@end
