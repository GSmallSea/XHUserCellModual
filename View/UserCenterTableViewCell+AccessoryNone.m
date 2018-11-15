//
//  UserCenterTableViewCell+AccessoryNone.m
//  UserCellModual
//
//  Created by XH on 2018/5/18.
//  Copyright © 2018年 XH. All rights reserved.
//

#import "UserCenterTableViewCell+AccessoryNone.h"

@implementation UserCenterTableViewCell (AccessoryNone)

- (void)configureAccessoryNoneCellWithViewModel:(UserCenterItemViewModel *)viewModel{
    
    [self layoutLeftPartSubViewsWithViewModel:viewModel];
}
@end
