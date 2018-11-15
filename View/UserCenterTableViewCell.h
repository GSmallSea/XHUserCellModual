//
//  UserCenterTableViewCell.h
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserCenterItemViewModel.h"
@class UserRedDotImageView;

@interface UserCenterTableViewCell : UITableViewCell

@property (nonatomic,strong) UserCenterItemViewModel *viewModel;

#pragma mark =============== 系统默认cell左侧 ===============

//! 功能图片
@property (nonatomic,strong) UserRedDotImageView *funcImageView;
//! 功能名称
@property (nonatomic,strong) UILabel * funcTitleLabel;

#pragma mark =============== 系统默认cell右侧 ===============

//! 右侧箭头左侧的文本
@property (nonatomic,strong) UILabel *detailTitleLabel;
//! 右侧图片
@property (nonatomic,strong) UIImageView *detailImageView;
//!右侧的箭头的左边的开关
@property (nonatomic,strong) UISwitch *indicatorSwitch;
//! 退出登录的label
@property (nonatomic,strong) UILabel *logoutLabel;
//!右侧的箭头
@property (nonatomic,strong) UIImageView *indicatorArrow;
//! 底线
@property (nonatomic,strong) UIView * bottomLineView;

- (void)layoutLeftPartSubViewsWithViewModel:(UserCenterItemViewModel *)viewModel;


@end
