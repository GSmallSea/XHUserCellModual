//
//  UserCenterTableViewCell+AccessorySwitch.m
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import "UserCenterTableViewCell+AccessorySwitch.h"

@implementation UserCenterTableViewCell (AccessorySwitch)

- (void)configureAccessorySwitchCellWithViewModel:(UserCenterItemViewModel *)viewModel{
    
    [self layoutLeftPartSubViewsWithViewModel:viewModel];
    [self.contentView addSubview:self.indicatorSwitch];
    
 
    self.indicatorSwitch.on = self.viewModel.isSwitchOn;

}
@end
