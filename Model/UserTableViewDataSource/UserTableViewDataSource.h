//
//  UserTableViewDataSource.h
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class UserCenterSectionModel;
@class UserCenterItemViewModel;
@class UserCenterTableViewCell;

typedef void(^cellConfigureBlock)(UserCenterTableViewCell *cell,UserCenterItemViewModel *itemViewModel);

@interface UserTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic,strong) NSArray *viewModelsArray;

//! 初始化dataSource
- (instancetype)initWithViewModelArray:(NSArray *)viewModelsArray
                        configureBlock:(cellConfigureBlock)configureBlock;

@end
