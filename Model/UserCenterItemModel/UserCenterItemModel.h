//
//  UserCenterItemModel.h
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "userConst.h"

typedef NS_ENUM(NSUInteger, CellType) {
    CellTypeSystemAccessoryNone,                            //右侧没有任何控件
    CellTypeSystemAccessorySwitch,                          //右侧是开关
    CellTypeSystemAccessoryDisclosureIndicator,             //右侧是三角箭头
    CellTypeSystemAccessoryTitle,                           //右侧是文字
    CellTypeSystemAccessoryLogout,                          // 退出登录
};

@interface UserCenterItemModel : NSObject

+ (instancetype)itemModel;
//! cell reuser identifier
@property (nonatomic, copy)  NSString *cellID;

#pragma mark =============== 系统默认cell左侧 ===============
//! cell 类型
@property (nonatomic,assign) CellType celltype;
//! 功能名称
@property (nonatomic,copy) NSString *funcName;
//! 功能图片
@property (nonatomic,copy) UIImage *funcImage;
//! 功能文字的大小
@property (nonatomic,strong) UIFont *funcNameTextFont;
//! 功能文字的颜色
@property (nonatomic, strong) UIColor *funcNameTextColor;
//! 左侧红点
@property (nonatomic,copy) NSString *funcRedDot;

#pragma mark =============== 系统默认cell右侧 ===============
//! 右侧箭头左侧的文本，按需传入
@property (nonatomic,copy) NSString *detailTitle;
//! 右侧左侧的图片
@property (nonatomic,copy) UIImage *detailImage;
//!区别每个cell，用于点击
@property (nonatomic, assign) NSInteger identifier;

//! 右侧文字的大小
@property (nonatomic,strong) UIFont *detailTextFont;
//! 右侧文字的颜色
@property (nonatomic,strong) UIColor *detailTextColor;

//! 右侧图片圆角
@property (nonatomic,assign) CGFloat cornerRadius;

@end
