//
//  UserCenterTableViewCell+AccessoryLogout.m
//  UserCellModual
//
//  Created by XH on 2018/5/18.
//  Copyright © 2018年 XH. All rights reserved.
//

#import "UserCenterTableViewCell+AccessoryLogout.h"
@implementation UserCenterTableViewCell (AccessoryLogout)

- (void)configureAccessoryLogoutTableViewCellWithViewModel:(UserCenterItemViewModel *)viewModel{
    self.viewModel = viewModel;
    [self.contentView addSubview:self.logoutLabel];
}

@end
