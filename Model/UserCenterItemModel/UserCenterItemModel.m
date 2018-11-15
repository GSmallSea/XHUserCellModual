//
//  UserCenterItemModel.m
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import "UserCenterItemModel.h"

@implementation UserCenterItemModel

+ (instancetype)itemModel{
    return [[self alloc] init];
}

- (instancetype)init{
    if (self == [super init]) {
        self.funcNameTextFont = [UIFont systemFontOfSize:15];
        self.celltype = CellTypeSystemAccessoryDisclosureIndicator;
        self.detailTextFont = [UIFont systemFontOfSize:15];
        self.cornerRadius = 0;
    }
    return self;
}
@end
