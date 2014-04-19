//
//  AOScrollerView.h
//  ImageView
//
//  Created by yuxin tang on 14-4-8.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AOImageView.h"

#define leftDirection 0
#define rightDirection 1
//点击scrollView中的图片的点击事件协议
@protocol ValueClickDelegate <NSObject>

- (void)buttonClick:(int)vid;

@end

@interface AOScrollerView : UIView <UIScrollViewDelegate,UrlImageButtonDelegate>
{
    int pagrNumbe;//页码
    int switchDirection;//方向
    NSMutableArray *imageNameArr;//图片数组
    NSMutableArray *titleStrArr;//标题数组
    
    UIScrollView *imageSV;//滚动视图
    int page;//页码
}

@property(nonatomic,strong)id<ValueClickDelegate> vDelegate;
//自定义实例化方法
//parameter：
//imageArr：图片url数组
//titleArr：标题数组
//height：视图高度
-(id)initWithNameArr:(NSMutableArray *)imageArr titleArr:(NSMutableArray *)titleArr height:(float)heightValue;

@end
