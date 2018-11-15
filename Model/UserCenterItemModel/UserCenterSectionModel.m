//
//  UserCenterSectionModel.m
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import "UserCenterSectionModel.h"

@implementation UserCenterSectionModel

- (instancetype)initWithItemViewModels:(NSArray<UserCenterItemViewModel *> *)models{
    
    if (self = [super init]) {
        _cellViewModelsArray = [models mutableCopy];
        _sectionHeaderHeight = 10;
        _sectionFooterHeight = 0;
        self.sectionHeaderColor = [UIColor colorWithHexString:@"#ebebeb"];
    }
    return self;
}

@end
