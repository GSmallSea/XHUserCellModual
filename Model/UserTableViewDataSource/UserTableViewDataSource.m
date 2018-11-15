//
//  UserTableViewDataSource.m
//  UserCellModual
//
//  Created by XH on 2018/5/17.
//  Copyright © 2018年 XH. All rights reserved.
//

#import "UserTableViewDataSource.h"
#import "UserCenterSectionModel.h"
#import "UserCenterTableViewCell.h"
#import "UserCenterItemModel.h"


@interface UserTableViewDataSource ()
@property (nonatomic,copy) cellConfigureBlock configsBlock;
@end

@implementation UserTableViewDataSource

- (instancetype)initWithViewModelArray:(NSArray *)viewModelsArray
                        configureBlock:(cellConfigureBlock)configureBlock{
    
    if (self = [super init]) {
        self.viewModelsArray = viewModelsArray;
        self.configsBlock = configureBlock;
    }
    return self;
}

#pragma mark - Tableview Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.viewModelsArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    UserCenterSectionModel *sections = self.viewModelsArray[section];
    return sections.cellViewModelsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UserCenterSectionModel *sections = self.viewModelsArray[indexPath.section];
    UserCenterItemViewModel *viewModel = [sections.cellViewModelsArray objectAtIndex:indexPath.row];
    
    UserCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:viewModel.itemModel.cellID];
    if (cell == nil) {
        cell = [[UserCenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:viewModel.itemModel.cellID];
    }

    if (self.configsBlock) {
        self.configsBlock(cell, viewModel);
    }
    return cell;
    
}

@end
