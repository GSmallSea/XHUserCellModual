//
//  UserCenterSectionModel.h
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class UserCenterItemViewModel;

@interface UserCenterSectionModel : NSObject
//! 该section的数据源
@property (nonatomic, strong) NSMutableArray  *cellViewModelsArray;
//!header的高度
@property (nonatomic, assign) CGFloat  sectionHeaderHeight;
//!footer的高度
@property (nonatomic, assign) CGFloat  sectionFooterHeight;

@property (nonatomic,strong) UIColor *sectionHeaderColor;

- (instancetype)initWithItemViewModels:(NSArray <UserCenterItemViewModel *>*)models;

@end
