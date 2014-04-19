//
//  GRMyOrderWithMyCell_TableViewCell.m
//  Community
//
//  Created by WEB08-V5MCS006 on 14-4-9.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import "GRMyOrderWithMyCell_TableViewCell.h"
#import "GRServiceEvaluation_ViewController.h"
#import "GRMyOrder_ViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation GRMyOrderWithMyCell_TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.orderNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 16, 100, 21)];
        self.orderNumberLabel.text = @"订单编号：";
        [self.orderNumberLabel setTextColor:[UIColor redColor]];
        [self.contentView addSubview:self.orderNumberLabel];
        
        self.orderDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 56, 100, 21)];
        self.orderDataLabel.text = @"下单日期：";
        [self.orderDataLabel setTextColor:[UIColor redColor]];
        [self.contentView addSubview:self.orderDataLabel];
        
        self.serveContentLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 96, 100, 21)];
        self.serveContentLabel.text = @"服务内容：";
        [self.serveContentLabel setTextColor:[UIColor redColor]];
        [self.contentView addSubview:self.serveContentLabel];
        
        self.orderStateLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 136, 100, 21)];
        self.orderStateLabel.text = @"订单状态：";
        [self.orderStateLabel setTextColor:[UIColor redColor]];
        [self.contentView addSubview:self.orderStateLabel];
        
        self.orderEvaluateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.orderEvaluateButton.frame = CGRectMake(220, 115, 100, 30);
        [self.orderEvaluateButton setTitle:@"服务评价" forState:UIControlStateNormal];
        [self.contentView addSubview:self.orderEvaluateButton];
        [self.orderEvaluateButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)clickButton:(UIButton *)button
{
    [self.delegate turnToGRServiceEvaluation_ViewController];
}

//灰色水平线
- (void)drawRect:(CGRect)rect
{
    self.imgLines =[[UIImageView alloc] initWithFrame:self.contentView.frame];
    [self.contentView addSubview:self.imgLines];
    
    UIGraphicsBeginImageContext(self.imgLines.frame.size);
    [self.imgLines.image drawInRect:CGRectMake(0, 0, self.imgLines.frame.size.width, self.imgLines.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapSquare); //端点形状
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 2); //线条粗细
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetShouldAntialias(UIGraphicsGetCurrentContext(), NO);//设置线条平滑，不需要两边像素宽
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 0.1); //颜色
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 0, 88);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 320, 88);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.imgLines.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

@end
