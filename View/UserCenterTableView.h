//
//  UserCenterTableView.h
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserCenterItemViewModel;
@class UserTableViewDataSource;

@protocol UserCenterTableViewDelegate <UITableViewDelegate>

@optional

- (void)didSelectViewModel: (UserCenterItemViewModel *)viewModel
               atIndexPath:(NSIndexPath *)indexPath;
@end

@interface UserCenterTableView : UITableView<UITableViewDelegate>

@property (nonatomic,strong) id <UserCenterTableViewDelegate> tdelegate;
@property (nonatomic,strong) UserTableViewDataSource *tDataSource;

@end
