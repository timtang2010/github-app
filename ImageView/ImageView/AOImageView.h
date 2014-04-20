//
//  AOImageView.h
//  ImageView
//
//  Created by yuxin tang on 14-4-8.
//  Copyright (c) 2014年 v5mcs. All rights reserved.
//

#import <UIKit/UIKit.h>
//按钮点击协议

@protocol UrlImageButtonDelegate <NSObject>

- (void)click: (int)vid;

@end

@interface AOImageView : UIView
//按钮点击委托对象
@property(strong, nonatomic)id<UrlImageButtonDelegate> uBdelegate;
//自定义初始化方法
//parameter:
//imageName: 图片url字符串
//titleStr:标题
//xPoint:视图横坐标
//视图纵坐标
//视图高度
- (id)initWithImageName:(NSString *)imageName
                  title:(NSString *)titleStr
                      x:(float)xPoint
                      y:(float)yPoint
                 height:(float)height;
@end
