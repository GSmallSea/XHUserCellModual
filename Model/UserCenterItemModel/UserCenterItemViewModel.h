//
//  UserCenterItemViewModel.h
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class UserCenterItemModel;

@interface UserCenterItemViewModel : NSObject

@property (nonatomic,strong) UserCenterItemModel *itemModel;
//! cell 的高度
@property (nonatomic,assign) CGFloat cellHeight;
//! 底线距离左侧
@property (nonatomic,assign) CGFloat bottomViewLeftGap;
//! 底线距离右侧侧
@property (nonatomic,assign) CGFloat bottomViewRightGap;
#pragma mark =============== 系统默认cell左侧 ===============
//! 功能左侧的间距
@property (nonatomic,assign) CGFloat funcLeftGap;
//! 左侧默认Label的size，传入text以后内部计算
@property (nonatomic,assign) CGSize funcNameLabelSize;
//! 功能图片尺寸
@property (nonatomic,assign) CGSize funcImageSize;
//! 左侧image和label的距离，存在默认值
@property (nonatomic,assign) CGFloat leftImageAndLabelGap;
//! 是否显示红点
@property (nonatomic,assign)  BOOL isRedDot;


#pragma mark =============== 系统默认cell右侧 ===============

//! 选择器回调
@property (nonatomic,copy) void (^switchValueDidChangeBlock)(BOOL isOn);

//! 右侧尖头左侧的文本和image是否同时存在，只能通过内部计算
@property (nonatomic,assign, readonly)  BOOL hasIndicatorImageAndLabel;
//! 右侧尖头左侧的文本和image同时存在时，是否是image挨着箭头，默认为YES
@property (nonatomic,assign) BOOL isImageFirst;

//! 右侧文字的大小
@property (nonatomic,assign) CGSize detailTitleSize;
//! 右侧图片的大小
@property (nonatomic,assign) CGSize detailImageSize;
//! 右侧尖头左侧image和label的距离，存在默认值
@property (nonatomic,assign) CGFloat indicatorLeftImageAndLabelGap;
//! 开关是否打开
@property (nonatomic,assign) BOOL isSwitchOn;

- (instancetype)initWithItem:(UserCenterItemModel *)item;

@end
